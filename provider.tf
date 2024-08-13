terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.40.0"
    }
  }
}

provider "google" {
    credentials = file("credentials.json")
    project = "copper-tracker-414721"
    region = "us-central1"
}