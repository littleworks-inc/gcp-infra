output "custom_subnet_id" {
  value = google_compute_subnetwork.custom_subnet.id
}

output "custom_subnet_self_link" {
  value = google_compute_subnetwork.custom_subnet.self_link
}

output "custom_subnet_gateway_address" {
  value = google_compute_subnetwork.custom_subnet.gateway_address
}

output "custom_subnet_creation_timestamp" {
  value = google_compute_subnetwork.custom_subnet.creation_timestamp
}