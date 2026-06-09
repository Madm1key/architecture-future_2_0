variable "yc_token" {
  description = "Yandex Cloud OAuth token (yc iam create-token)"
  type        = string
  sensitive   = true
}

variable "cloud_id" {
  description = "Yandex Cloud ID (yc config get cloud-id)"
  type        = string
}

variable "folder_id" {
  description = "Yandex Cloud Folder ID (yc config get folder-id)"
  type        = string
}

variable "zone" {
  description = "Availability zone"
  type        = string
  default     = "ru-central1-a"
}
