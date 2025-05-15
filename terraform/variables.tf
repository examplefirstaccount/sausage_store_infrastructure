# Provider variables
variable "zone" {
  description = "Y.Cloud zone"
  type        = string
  default     = "ru-central1-a"
}

variable "token" {
  description = "Y.Cloud authorization IAM-token; expires every 12 hours"
  type        = string
  sensitive   = true
}

variable "cloud_id" {
  description = "Y.Cloud cloud id"
  type        = string
  sensitive   = true
}

variable "folder_id" {
  description = "Y.Cloud folder id of the cloud"
  type        = string
  sensitive   = true
}