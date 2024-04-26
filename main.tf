module "cloudsql-sql-" {
  source            = "./modules/cloudsql-private"
  disk_size         = "50"
  instance_type     = "db-custom-8-30720"
  user              = var.user
  password          = var.password
  vpc_project_name  = "lcl-net-svc" #var.sql_vpc_project_name
  vpc_name          = "vpc-bf-pre"  #var.sql_vpc_name
  av_type           = "REGIONAL"    #var.sql_av_type
  db_version        = "POSTGRES_15" #var.sql_db_version
  db_name           = "sql-bitools-prd-02"
  region            = "northamerica-northeast1"
  database_project  = var.project_id
  label_environment = var.label_environment
  label_application = var.label_application
}
