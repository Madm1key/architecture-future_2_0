terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.84"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token = var.yc_token
  cloud_id = var.cloud_id
  folder_id = var.folder_id
  zone = var.zone
}

resource "yandex_vpc_network" "fintech_network" {
  name = "fintech-network"
}

resource "yandex_vpc_subnet" "fintech_subnet" {
  name = "fintech-subnet"
  zone = var.zone
  network_id = yandex_vpc_network.fintech_network.id
  v4_cidr_blocks = ["10.10.1.0/24"]
}

data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts"
}

resource "yandex_compute_disk" "fintech_disk" {
  name = "fintech-api-disk"
  type = "network-ssd"
  zone = var.zone
  image_id = data.yandex_compute_image.ubuntu.image_id
  size = 20
}

resource "yandex_compute_instance" "fintech_api" {
  name = "fintech-api"
  zone = var.zone

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    disk_id = yandex_compute_disk.fintech_disk.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.fintech_subnet.id
    nat = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}
