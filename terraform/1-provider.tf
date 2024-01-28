# https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  project = "erf-security-project"
  region  = "us-central1"
}

# https://www.terraform.io/language/settings/backends/gcs
terraform {
  backend "gcs" {
    bucket = "erfan-tf-state-staging2"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
