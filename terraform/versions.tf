terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = ">= 0.87.0"
    }
  }
  required_version = ">= 0.13" # The minimum version of Terraform that the provider is compatible with

  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket     = "terraform-state-test"
    region     = "ru-central1"
    key        = "terraform-example.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true # Necessary for Terraform >= v1.6.1
    skip_s3_checksum            = true # Necessary for Terraform >= v1.6.3
  }
}