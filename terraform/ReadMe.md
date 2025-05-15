# 🚀 Root Terraform Module
This Terraform root module orchestrates the deployment of network infrastructure and compute instances in Yandex Cloud. It integrates child modules for streamlined resource management.

## 📦 Dependencies

- **Child Modules:**
  - `tf-yc-network`: Manages network configurations.
  - `tf-yc-instance`: Provisions compute instances.

## 🗄️ Providers

- **Yandex Cloud Provider:**
  - Source: `yandex-cloud/yandex`
  - Version: `>= 0.87.0`

## 📝 Requirements

- **Terraform Version:** `>= 0.13`
- **Environment Variables:**
  - `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` for S3 backend.
  - `TF_VAR_token`, `TF_VAR_cloud_id`, `TF_VAR_folder_id` for Yandex Cloud authentication.

## 🚀 Usage

```hcl
module "network" {
  source = "./modules/tf-yc-network"
}

module "instance" {
  source   = "./modules/tf-yc-instance"
  zone     = var.zone
  subnet_id = module.network.yandex_vpc_subnets[var.zone].id
}
```

## 🔐 Setting Sensitive Variables

For Yandex Cloud CLI users:
```bash
export TF_VAR_token=$(yc iam create-token)
export TF_VAR_cloud_id="<your-cloud-id>"
export TF_VAR_folder_id="<your-folder-id>"
```
Static access key can be generated via CLI by using command:
```bash
yc iam access-key create --service-account-name your-sa-name
```
Save `key_id` and `secret` in the corresponding environment variables:
```bash
export AWS_ACCESS_KEY_ID="<your-static-access-key-id>"
export AWS_SECRET_ACCESS_KEY="<your-static-access-key-secret>"
```

## 🔧 Variables

| Name        | Description                                  | Type   | Default         | Required |
|-------------|----------------------------------------------|--------|-----------------|----------|
| `zone`      | Y.Cloud zone                                 | string | `"ru-central1-a"` | No       |
| `token`     | Y.Cloud IAM token (sensitive)                | string | N/A             | Yes      |
| `cloud_id`  | Y.Cloud cloud ID (sensitive)                 | string | N/A             | Yes      |
| `folder_id` | Y.Cloud folder ID within the cloud (sensitive) | string | N/A             | Yes      |

## 🔧 Backend Configuration

- **Y.Cloud S3 Backend:**
  - Endpoint: `https://storage.yandexcloud.net`
  - Bucket: `<your-bucket-name>`
  - Key: `<your-object-key>`
  - Region: `ru-central1`