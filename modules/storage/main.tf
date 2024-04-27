resource "google_storage_bucket" "storage-bucket" {
  //provider = "google.${var.provider_name}"
  name = var.bucket_name

  //project = var.project_name
  location                    = var.region
  storage_class               = var.bucket_storage_class
  #STANDARD, MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE
  force_destroy               = true
  //bucket_policy_only = true
  uniform_bucket_level_access = true
  labels                      = {
	environment     = var.label_environment
	application     = var.label_application
  }
}
