data "yandex_compute_image" "my_image" {
  family = var.image_family
}

resource "yandex_compute_instance" "vm-1" {
  name = var.name
  zone = var.zone
  platform_id = var.platform_id

  resources {
    cores  = var.cores
    memory = var.memory
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.my_image.id
      type = var.disk_type
      size = var.disk_size
    }
  }
  
  scheduling_policy {
    preemptible = var.preemptible
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = var.nat
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_pub_file)}"
  }
}