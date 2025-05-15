output "yandex_vpc_subnets" {
  description = "Yandex.Cloud Subnets map"
  value       = data.yandex_vpc_subnet.default
  
  # Map of key=zone, value=id of subnet
  # value       = { for zone, subnet in data.yandex_vpc_subnet.default : zone => subnet.id }
}