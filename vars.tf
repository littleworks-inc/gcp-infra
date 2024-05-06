# variable "credentials" {}

variable "project_id" {
  type = string
}

variable "password" {
  type = string
}

variable "user" {
  type = string
}

variable "label_environment" {
  type    = string
  default = ""
}

variable "label_application" {
  type    = string
  default = ""
}

variable "val_deletion_protection" {
  default = false
}

variable "region" {
  default = "northamerica-northeast1"
}

variable "application" {

}

variable "vpc_name" {
  
}
  
variable "vpc_description" {
  
}

variable "vpc_auto_create_subnetworks" {
  
}

variable "vpc_routing_mode" {
  
}

variable "subnet_ip_cidr_range" {

}

variable "subnet_private_ip_google_access" {
  
}

variable "env" {
  
}