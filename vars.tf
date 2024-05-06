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