terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.26.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "5.26.0"
    }
  }
}

provider "google" {
  project = "nomadic-rush-408023"
  region  = "northamerica-northeast1-a"
}

# provider "google-beta" {
#   project     = "nomadic-rush-408023"
#   region = "northamerica-northeast1-a"
# }

