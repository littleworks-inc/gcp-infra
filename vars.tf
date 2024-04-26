variable "credentials" {}

variable "project_id" {
    type = string
    default = "nomadic-rush-408023"
}

variable "password"{
    type = "string"
}

variable "compute_sa" {
    type = string
    description = "(optional) describe your variable"
}

variable "user"{
    type = "string"
    default = "lcluser"
}

variable "label_environment"{
    type = "string"
    default = "production"
}

variable "label_app_no"{
    type = "string"
    default = "1"
}

variable "label_application"{
    type = "string"
}

variable "val_deletion_protection" {
    default = true
}

variable "region" {
    default = "northamerica-northeast1"
}
