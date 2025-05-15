# vm-1 variables
variable "zone" {
  description = "Y.Cloud zone for vm-1"
  type        = string
}

variable "name" {
  description = "vm-1 resource name"
  type = string
  default = "chapter5-lesson4-qwervm"
}

variable "cores" {
  description = "Number of cores"
  type    = number
  default = 2
}

variable "memory" {
  description = "RAM size in GB"
  type    = number
  default = 2
}

variable "disk_type" {
  description = "Permanent storage type"
  type    = string
  default = "network-nvme"
}

variable "disk_size" {
  description = "Permanent storage size in GB"
  type    = number
  default = 50
}

variable "image_family" {
  description = "OS image family for the disk"
  type = string
  default = "ubuntu-2004-lts"
}

variable "platform_id" {
  description = "The type of virtual machine to create. More info here: https://yandex.cloud/en/docs/compute/concepts/vm-platforms"
  type = string
  default = "standard-v1"
}

variable "preemptible" {
  description = "Specifies if the instance is preemptible."
  type = bool
  default = false
}

variable "subnet_id" {
  description = "Y.Cloud subnet id"
  type = string
}

variable "nat" {
  description = "Specifies if the instance will have public IP address"
  type    = bool
  default = true
}

variable "ssh_pub_file" {
  description = "Location of ssh public key"
  type = string
  default = "~/.ssh/id_personal_pub"
}