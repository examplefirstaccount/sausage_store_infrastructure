# network variables
variable "network_zones" {
  description = "Y.Cloud set of needed network zones"
  type        = set(string)
  default     = ["ru-central1-a", "ru-central1-b"]
}