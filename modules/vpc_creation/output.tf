output "vpc_id" {
  value = google_compute_network.vpc.id
}

output "vpc_self_link" {
  value = google_compute_network.vpc.self_link
}

output "vpc_gateway_ipv4" {
  value = google_compute_network.vpc.gateway_ipv4
}

output "vpc_project" {
  value = google_compute_network.vpc.project
}

output "vpc_name" {
  value = google_compute_network.vpc.name
}