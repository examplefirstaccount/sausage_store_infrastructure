# 📡 Network Setup Terraform Module
This Terraform module manages the network setup in Yandex Cloud, including VPC networks and subnets across specified zones.

## 📦 Dependencies

- **Data Sources:**
  - `yandex_vpc_network`: Retrieves information about the default VPC network.
  - `yandex_vpc_subnet`: Fetches subnet information for the specified network zones.

## 🗄️ Providers

- **Yandex Cloud Provider:**
  - Source: `yandex-cloud/yandex`
  - Version: `>= 0.87.0`

## 📝 Requirements

- **Terraform Version:** `>= 0.13`

## 🚀 Usage

```hcl
module "network_setup" {
  source        = "./path-to-module"
  network_zones = ["ru-central1-a", "ru-central1-b"]
}
```

## 🔧 Variables

| Name            | Description                             | Type        | Default                            | Required |
|-----------------|-----------------------------------------|-------------|------------------------------------|----------|
| `network_zones` | Set of Y.Cloud network zones to include | set(string) | `["ru-central1-a", "ru-central1-b"]` | Yes       |

## 📤 Outputs

| Name               | Description                   |
|--------------------|-------------------------------|
| `yandex_vpc_subnets` | Yandex.Cloud Subnets map with key as zone and value as subnet data source|
