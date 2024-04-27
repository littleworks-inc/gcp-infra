resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  description             = var.vpc_description
  auto_create_subnetworks = var.vpc_auto_create_subnetworks
  routing_mode            = var.vpc_routing_mode
  #Possible values are REGIONAL and GLOBAL
}
