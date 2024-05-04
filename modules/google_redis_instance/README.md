# Google Cloud Redis instance

Create an Google Cloud Redis instance. To use see the example below and the inputs tab for more variables that can be used

**Usage**

**Only applicable to STANDARD_HA tier (highly available primary/replica instances)** 

```terraform
module "redis_instance_01"{

  source = "git::https://gitlab.lblw.ca/aps/terraform-modules.git//modules/google_redis_instance?ref=master"

  highly_available = true

  redis_instance_name           = "test-redis-instance-01"
  redis_instance_tier           = "STANDARD_HA"
  redis_instance_memory_size_gb = 1

  redis_location_zone_01        = "us-central1-a"
  redis_location_zone_02        = "us-central1-f"

  vpc_name                      = "vpc_name"
  vpc_project_name              = "vpc_project"
  redis_instance_connect_mode   = "PRIVATE_SERVICE_ACCESS"  #Possible values are DIRECT_PEERING and PRIVATE_SERVICE_ACCESS

  redis_version                 = "REDIS_4_0"

  label_application = "label_application"
  label_environment = "label_environment"
  label_owner = "label_owner"
  label_snow_queue = "label_snow_queue"
}
```

**With out STANDARD_HA tier(single instance)** 

```terraform
module "redis_instance_01"{

  source = "git::https://gitlab.lblw.ca/aps/terraform-modules.git//modules/google_redis_instance?ref=master"

  redis_instance_name           = "test-redis-instance-01"
  redis_instance_tier           = "BASIC"
  redis_instance_memory_size_gb = 1

  vpc_name                      = "vpc_name"
  vpc_project_name              = "vpc_project"
  redis_instance_connect_mode       = "PRIVATE_SERVICE_ACCESS" #Possible values are DIRECT_PEERING and PRIVATE_SERVICE_ACCESS

  redis_version     = "REDIS_4_0"

  label_application = "label_application"
  label_environment = "label_environment"
  label_owner = "label_owner"
  label_snow_queue = "label_snow_queue"
}
```