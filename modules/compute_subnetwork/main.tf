resource "google_compute_subnetwork" "custom_subnet" {
  name                     = var.subnet_name
  region                   = var.subnet_region
  ip_cidr_range            = var.subnet_ip_cidr_range
  network                  = var.vpc_subnet_network
  private_ip_google_access = var.subnet_private_ip_google_access
  #enable_flow_logs         = var.subnet_enable_flow_logs
  /* secondary_ip_range {
    range_name    = "tf-test-secondary-range-update1"
    ip_cidr_range = "192.168.10.0/24"
  } */
  dynamic "secondary_ip_range" {
	for_each = var.vpc_secondary_subnet
	content {
	  range_name    = secondary_ip_range.value.range_name
	  ip_cidr_range = secondary_ip_range.value.ip_cidr_range
	}
  }
}
