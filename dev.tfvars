project_id        = "nomadic-rush-408023"
password          = "password@123"
region            = "northamerica-northeast1"
label_environment = "dev"
application       = "test"
user              = "postgres"


vpc_name                    = "test-vpc"
vpc_description             = "VPC network for composer deployement"
vpc_auto_create_subnetworks = "false"
vpc_routing_mode            = "REGIONAL"
subnet_ip_cidr_range        = "10.162.0.0/20"
subnet_private_ip_google_access = "true"

env = "dev"
