data "google_compute_network" "vpc" {
  name    = var.vpc_name
  project = var.vpc_project_name
}

resource "google_redis_instance" "single_instance" {
  count          = var.highly_available ? 0 : 1
  name           = var.redis_instance_name
  tier           = var.redis_instance_tier
  memory_size_gb = var.redis_instance_memory_size_gb

  #location_id             = "us-central1-a"
  #alternative_location_id = "us-central1-f"

  authorized_network = data.google_compute_network.vpc.self_link
  connect_mode       = var.redis_instance_connect_mode

  redis_version = var.redis_version
  display_name  = var.redis_instance_name

  #depends_on = [google_service_networking_connection.private_service_connection]

  labels = {
    environment = var.label_environment
    application = var.label_application
  }
}

resource "google_redis_instance" "highly_available" {
  count          = var.highly_available ? 1 : 0
  name           = var.redis_instance_name
  tier           = var.redis_instance_tier
  memory_size_gb = var.redis_instance_memory_size_gb

  location_id             = var.redis_location_zone_01
  alternative_location_id = var.redis_location_zone_02

  authorized_network = data.google_compute_network.vpc.self_link
  connect_mode       = var.redis_instance_connect_mode

  redis_version = var.redis_version
  display_name  = var.redis_instance_name

  #depends_on = [google_service_networking_connection.private_service_connection]

  labels = {
    environment = var.label_environment
    application = var.label_application
  }
}