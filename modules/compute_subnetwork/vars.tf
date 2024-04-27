variable "subnet_name" {}
variable "subnet_region" {}
variable "subnet_ip_cidr_range" {}
variable "vpc_subnet_network" {}
variable "subnet_private_ip_google_access" {}
#variable "subnet_enable_flow_logs"{}
variable "vpc_secondary_subnet" {
  type = list(map(string))
}
