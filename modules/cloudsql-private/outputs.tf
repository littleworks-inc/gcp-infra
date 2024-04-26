output "connection" {
  description = "The connection string used by Cloud SQL Proxy, e.g. my-project:us-central1:my-db"
  value       = google_sql_database_instance.db_instance.connection_name
}

output "name" {
  description = "name of DB instance"
  value       = google_sql_database_instance.db_instance.name
}