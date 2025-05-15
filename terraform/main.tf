module "network" {
  source = "./modules/tf-yc-network"
}

module "instance" {
  source   = "./modules/tf-yc-instance"
  zone = var.zone
  subnet_id = module.network.yandex_vpc_subnets[var.zone].id
}