# variable "db_depends_on" {
#   description = "A single resource that the database instance depends on like (often its google_service_networking_connection)"
#   type        = any
# }

variable "db_name" {
  type        = string
  description = "(required) name of sql db"
}

variable "disk_size" {
  description = "The size in GB of the disk for db"
  type        = number
}

variable "disk_autoresize" {
  type        = bool
  default     = false
  description = "resize disk automatically, disk_size will be ignored if set to true"
}


variable "instance_type" {
  description = "The instance type of the VM that will run the db (e.g. db-f1-micro, db-custom-8-32768)"
  type        = string
}

variable "password" {
  description = "The db password used to connect to db"
  type        = string
}

variable "user" {
  description = "The username for db"
  type        = string
}

# variable "vpc_link" {
#   description = "A link to the VPC where the db will live (i.e. google_compute_network.some_vpc.self_link)"
#   type        = string
# }

variable "vpc_name" {
  description = "The name of the VPC where the db will live"
  type        = string
}

variable "vpc_project_name" {
  type        = string
  description = "(required) project where vpc sits"
}


variable "public_ip" {
  type        = bool
  default     = false
  description = "Give the instance a public IP, true or false"
}

variable "av_type" {
  type        = string
  description = "(required) ZONAL or REGIONAL for prod"
}

variable "db_version" {
  type        = string
  description = "(required) type of database like 'POSTGRES_11'"
}

variable "region" {
  type        = string
  description = "(required) region for instance to be placed"
}

variable "database_project" {
  type        = string
  description = "(required) gcp project the db is part of"
}

variable "label_environment" {
  type        = string
  description = "(required) environment label for gcp"
}

variable "label_application" {
  type        = string
  description = "(required) application label for resource"
}

variable "database_name" {
  type        = string
  default     = "test-db"
  description = "Create database with this name"
}


variable "backup_enabled" {
  type        = bool
  default     = true
  description = "description"
}

variable "database_flags" {
  type        = map(any)
  default     = {}
  description = "Flags to enable on DB"
}
