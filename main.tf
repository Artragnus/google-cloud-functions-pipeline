locals {
  project = "copper-tracker-414721" # Google Cloud Platform Project ID
}

resource "google_storage_bucket" "bucket" {
  name     = "${local.project}-gcf-source"  # Every bucket name must be globally unique
  location = "US"
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_object" "object" {
  name   = "objects"
  bucket = google_storage_bucket.bucket.name
  source = "index.zip"  # Add path to the zipped function source code
}

resource "google_cloudfunctions2_function" "function" {
  name = "function-v2"
  location = "us-central1"
  description = "a new function"

  build_config {
    runtime = "nodejs20"
    entry_point = "helloWorld"  # Set the entry point 
    source {
      storage_source {
        bucket = google_storage_bucket.bucket.name
        object = google_storage_bucket_object.object.name
      }
    }
  }

  service_config {
    max_instance_count  = 1
    available_memory    = "256M"
    timeout_seconds     = 60
  }
}