# variable "credentials" {}

variable "project_id" {
  type    = string
}

variable "password" {
  type    = string
}

# variable "compute_sa" {
#   type        = string
#   description = "(optional) describe your variable"
# }

variable "user" {
  type    = string
  default = ""
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
  default = true
}

variable "region" {
  default = "northamerica-northeast1"
}
