output "vm_id" {
  description = "Compute instance ID"
  value       = yandex_compute_instance.fintech_api.id
}

output "vm_external_ip" {
  description = "External (NAT) IP address"
  value       = yandex_compute_instance.fintech_api.network_interface[0].nat_ip_address
}
