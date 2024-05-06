module "enable-api" {
  source     = "./modules/enable_apis"
  project_id = var.project_id
  enable_api_services = [
    "vpcaccess.googleapis.com",
    "pubsub.googleapis.com",
    "containerregistry.googleapis.com",
    "monitoring.googleapis.com",
    "iap.googleapis.com",
    "pubsublite.googleapis.com",
    "iamcredentials.googleapis.com",
    "serviceusage.googleapis.com",
    "iam.googleapis.com",
    "redis.googleapis.com",
    "sqladmin.googleapis.com",
    "secretmanager.googleapis.com",
    "servicenetworking.googleapis.com",
    "redis.googleapis.com",
    "memcache.googleapis.com",
    "firestore.googleapis.com",
    "run.googleapis.com",
    "cloud.googleapis.com"
  ]
}

# module "vpc_creation" {
#   source                      = "./modules/vpc_creation"
#   vpc_name                    = var.vpc_name
#   vpc_description             = var.vpc_description
#   vpc_auto_create_subnetworks = var.vpc_auto_create_subnetworks
#   vpc_routing_mode            = var.vpc_routing_mode
#   depends_on                  = [module.enable-api]
# }

# module "custom_subnet_01" {
#   source                          = "./modules/compute_subnetwork"
#   subnet_name                     = "snet-${var.env}"
#   subnet_region                   = var.region
#   subnet_ip_cidr_range            = var.subnet_ip_cidr_range
#   vpc_subnet_network              = module.vpc_creation.vpc_id
#   subnet_private_ip_google_access = var.subnet_private_ip_google_access
#   vpc_secondary_subnet            = []
# }

# resource "google_compute_global_address" "private_ip_address" {
#   # provider = google-beta

#   name          = "private-ip-address-${var.env}"
#   purpose       = "VPC_PEERING"
#   address_type  = "INTERNAL"
#   prefix_length = 16
#   network       = module.vpc_creation.vpc_id
#   depends_on    = [module.vpc_creation]
# }

# resource "google_service_networking_connection" "private_vpc_connection" {
#   # provider = google-beta

#   network                 = module.vpc_creation.vpc_id
#   service                 = "servicenetworking.googleapis.com"
#   reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
# }

# module "storage_bucket_01" {
#   source               = "./modules/storage"
#   region               = "northamerica-northeast1"
#   bucket_name          = "sb-dia-gcyhero-${var.label_environment}-data-staging"
#   project_name         = var.project_id
#   bucket_storage_class = "STANDARD"
#   label_environment    = var.label_environment
#   label_application    = var.application
# }

# module "cloudsql-sql" {
#   source            = "./modules/cloudsql-private"
#   disk_size         = "50"
#   instance_type     = "db-f1-micro"
#   user              = var.user
#   password          = var.password
#   vpc_project_name  = module.vpc_creation.vpc_project #var.sql_vpc_project_name
#   vpc_name          = module.vpc_creation.vpc_name    #var.sql_vpc_name
#   av_type           = "REGIONAL"                      #var.sql_av_type
#   db_version        = "POSTGRES_15"                   #var.sql_db_version
#   db_name           = "sql-test-01"
#   region            = "northamerica-northeast1"
#   database_project  = var.project_id
#   label_environment = var.label_environment
#   label_application = var.label_application
#   depends_on        = [google_service_networking_connection.private_vpc_connection]
# }


# module "memorystore" {
#   source = "./modules/google_redis_instance"

#   name           = "memorystore"
#   project        = var.project_id
#   memory_size_gb = "1"

#   tier = "BASIC"
#   region = "northamerica-northeast1"


#   authorized_network = module.vpc_creation.vpc_id
#   connect_mode       = "PRIVATE_SERVICE_ACCESS"
#   depends_on         = [google_service_networking_connection.private_vpc_connection]
# }

# resource "google_firestore_database" "database" {
#   project                           = var.project_id
#   name                              = "database-id"
#   location_id                       = "northamerica-northeast1"
#   type                              = "FIRESTORE_NATIVE"
#   concurrency_mode                  = "OPTIMISTIC"
#   app_engine_integration_mode       = "DISABLED"
#   point_in_time_recovery_enablement = "POINT_IN_TIME_RECOVERY_DISABLED"
#   delete_protection_state           = "DELETE_PROTECTION_DISABLED"
#   deletion_policy                   = "DELETE"
#   depends_on = [ module.enable-api ]
# }