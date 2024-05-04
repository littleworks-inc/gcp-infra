variable "redis_instance_name" {}
variable "redis_instance_tier" {}
variable "redis_instance_memory_size_gb" {}
#variable redis_instance_vpc_id {}
variable "redis_instance_connect_mode" {}
variable "redis_version" {}
variable "label_environment" {}
variable "label_application" {}
variable "highly_available" {
  default     = false
  description = "Enable highly available primary/replica instances"
}
variable "redis_location_zone_01" {
  default = ""
}
variable "redis_location_zone_02" {
  default = ""
}
variable "vpc_name" {}
variable "vpc_project_name" {}