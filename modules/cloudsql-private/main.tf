locals {
  is_mysql    = substr(var.db_version, 0, 5) == "MYSQL"
  is_ha       = substr(var.av_type, 0, 3) == "REG"
  is_mysql_ha = local.is_mysql && local.is_ha

}

// db module for private ip

resource "google_sql_database" "main" {
  name     = var.database_name
  instance = google_sql_database_instance.db_instance.name
  project  = var.database_project
}

resource "google_sql_database_instance" "db_instance" {
  # provider         = "google-beta"
  name             = var.db_name #"test-db-instance"
  database_version = var.db_version
  # depends_on       = [var.db_depends_on]
  # root_password    = "${var.sql_root_password}"
  project             = var.database_project
  region              = var.region
  deletion_protection = false

  settings {
    tier              = var.instance_type
    availability_type = var.av_type
    disk_autoresize   = var.disk_autoresize
    disk_size         = var.disk_autoresize ? null : var.disk_size

    ip_configuration {
      ipv4_enabled                                  = var.public_ip
      private_network                               = data.google_compute_network.vpc.self_link #var.vpc_link # the VPC where the db will be assigned a private IP
      enable_private_path_for_google_cloud_services = true
    }
    user_labels = {
      environment = var.label_environment
      application = var.label_application
    }

    backup_configuration {
      enabled            = var.backup_enabled
      binary_log_enabled = local.is_mysql_ha
    }

    dynamic "database_flags" {
      iterator = flag
      for_each = var.database_flags

      content {
        name  = flag.key
        value = flag.value
      }
    }
  }
}

# resource "google_sql_user" "db_user" {
#   name     = var.user
#   instance = google_sql_database_instance.db_instance.name
#   password = var.password
#   project  = var.database_project
# }