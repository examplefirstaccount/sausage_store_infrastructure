# 💻 Compute Instance Terraform Module
This Terraform module provisions a Yandex Cloud Compute Instance with configurable resources such as CPU, memory, disk, and network settings.

## 📦 Dependencies

- **Data Sources:**
  - `yandex_compute_image`: Fetches information about the specified OS image family.

## 🗄️ Providers

- **Yandex Cloud Provider:**
  - Source: `yandex-cloud/yandex`
  - Version: `>= 0.87.0`

## 📝 Requirements

- **Terraform Version:** `>= 0.13`

## 🚀 Usage

```hcl
module "compute_instance" {
  source        = "./path-to-module"
  name          = "my-instance"
  zone          = "ru-central1-a"
  cores         = 4
  memory        = 8
  disk_type     = "network-ssd"
  disk_size     = 100
  image_family  = "ubuntu-2004-lts"
  platform_id   = "standard-v1"
  preemptible   = false
  subnet_id     = "subnet-id-example"
  nat           = true
  ssh_pub_file  = "~/.ssh/id_rsa.pub"
}
```

## 🔧 Variables

| Name           | Description                                                       | Type    | Default                      | Required |
|----------------|-------------------------------------------------------------------|---------|------------------------------|----------|
| `zone`         | Y.Cloud zone for the compute instance                            | string  | N/A                          | Yes      |
| `name`         | Resource name for the compute instance                           | string  | `"chapter5-lesson4-qwervm"`  | No       |
| `cores`        | Number of CPU cores                                               | number  | `2`                          | No       |
| `memory`       | RAM size in GB                                                    | number  | `2`                          | No       |
| `disk_type`    | Type of the boot disk                                             | string  | `"network-nvme"`             | No       |
| `disk_size`    | Size of the boot disk in GB                                       | number  | `50`                         | No       |
| `image_family` | OS image family for the boot disk                                | string  | `"ubuntu-2004-lts"`          | No       |
| `platform_id`  | Type of virtual machine to create                                 | string  | `"standard-v1"`              | No       |
| `preemptible`  | Specifies if the instance is preemptible                          | bool    | `false`                      | No       |
| `subnet_id`    | Y.Cloud subnet ID for the network interface                      | string  | N/A                          | Yes      |
| `nat`          | Specifies if the instance will have a public IP address           | bool    | `true`                       | No       |
| `ssh_pub_file` | Path to the SSH public key file                                  | string  | `"~/.ssh/id_personal_pub"`   | No       |

## 📤 Outputs

| Name            | Description                         |
|-----------------|-------------------------------------|
| `ip_address`    | Internal IP address of the instance |
| `nat_ip_address`| Public IP address (if NAT enabled)  |
