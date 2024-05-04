############################## Redis Single Instance output #####################################
output "single_instance_id" {
  value = google_redis_instance.single_instance.*.id
}

output "single_instance_current_location_id" {
  value = google_redis_instance.single_instance.*.current_location_id
}

output "single_instance_host" {
  value = google_redis_instance.single_instance.*.host
}

output "single_instance_port" {
  value = google_redis_instance.single_instance.*.port
}

output "single_instance_persistence_iam_identity" {
  value = google_redis_instance.single_instance.*.persistence_iam_identity
}

############################## Redis highly available output #####################################

/* output "highly_available_id" {
    value = google_redis_instance.highly_available.id
}

output "highly_available_current_location_id" {
    value = google_redis_instance.highly_available.current_location_id
}

output "highly_available_current_location_id" {
    value = google_redis_instance.highly_available.current_location_id
}

output "highly_available_host" {
    value = google_redis_instance.highly_available.current_location_host
}

output "highly_available_port" {
    value = google_redis_instance.highly_available.current_location_port
}

output "highly_available_persistence_iam_identity" {
    value = google_redis_instance.highly_available.persistence_iam_identity
} */