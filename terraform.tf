terraform {
  required_version = ">= 1.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }

  cloud {
    organization = "biyeon"

    workspaces {
      name = "bibi-v2-terraform"
    }
  }
}

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}
