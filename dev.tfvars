project_id        = "nomadic-rush-408023"
password          = "password@123"
region            = "northamerica-northeast1"
label_environment = "dev"
application       = "test"

############################ Redis Variables ########################
redis_instance_name           = "conductor-redis-dev"
redis_instance_tier           = "BASIC"
redis_instance_memory_size_gb = 1
redis_vpc_name                = "lt-sre-svpc-net"
redis_vpc_project_name        = "lt-sre-svpc"
redis_instance_connect_mode   = "PRIVATE_SERVICE_ACCESS" #Possible values are DIRECT_PEERING and PRIVATE_SERVICE_ACCESS
redis_version                 = "REDIS_4_0"