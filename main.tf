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
  "servicenetworking.googleapis.com"]
}

module "vpc_creation" {
  source                      = "./modules/vpc_creation"
  vpc_name                    = "test-vpc"
  vpc_description             = "VPC network for composer deployement"
  vpc_auto_create_subnetworks = "false"
  vpc_routing_mode            = "REGIONAL"
  depends_on                  = [module.enable-api]
}

module "custom_subnet_01" {
  source                          = "./modules/compute_subnetwork"
  subnet_name                     = "snet-test-nane"
  subnet_region                   = var.region
  subnet_ip_cidr_range            = "10.162.0.0/20"
  vpc_subnet_network              = module.vpc_creation.vpc_id
  subnet_private_ip_google_access = "true"
  vpc_secondary_subnet            = []
}

resource "google_compute_global_address" "private_ip_address" {
  # provider = google-beta

  name          = "private-ip-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = module.vpc_creation.vpc_id
  depends_on    = [module.vpc_creation]
}

resource "google_service_networking_connection" "private_vpc_connection" {
  # provider = google-beta

  network                 = module.vpc_creation.vpc_id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}

module "storage_bucket_01" {
  source               = "./modules/storage"
  region               = "northamerica-northeast1"
  bucket_name          = "sb-dia-gcyhero-${var.label_environment}-data-staging"
  project_name         = var.project_id
  bucket_storage_class = "STANDARD"
  label_environment    = var.label_environment
  label_application    = var.application
}

module "cloudsql-sql" {
  source            = "./modules/cloudsql-private"
  disk_size         = "50"
  instance_type     = "db-f1-micro"
  user              = var.user
  password          = var.password
  vpc_project_name  = module.vpc_creation.vpc_project #var.sql_vpc_project_name
  vpc_name          = module.vpc_creation.vpc_name    #var.sql_vpc_name
  av_type           = "REGIONAL"                      #var.sql_av_type
  db_version        = "POSTGRES_15"                   #var.sql_db_version
  db_name           = "sql-test-01"
  region            = "northamerica-northeast1"
  database_project  = var.project_id
  label_environment = var.label_environment
  label_application = var.label_application
  depends_on        = [google_service_networking_connection.private_vpc_connection]
}


# module "redis_instance_01" {

#   source = "./modules/google_redis_instance"

#   redis_instance_name           = "test-redis-instance-01"
#   redis_instance_tier           = "BASIC"
#   redis_instance_memory_size_gb = 1

#   vpc_name                    = module.vpc_creation.vpc_name
#   vpc_project_name            = module.vpc_creation.vpc_project
#   redis_instance_connect_mode = "PRIVATE_SERVICE_ACCESS" #Possible values are DIRECT_PEERING and PRIVATE_SERVICE_ACCESS

#   redis_version = "REDIS_4_0"

#   label_application = "label_application"
#   label_environment = "label_environment"
#   depends_on        = [module.vpc_creation]
# }
