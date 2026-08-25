resource "google_storage_bucket" "d0_raw_landing" {
  name                        = var.raw_bucket_name
  location                    = var.region
  force_destroy               = false
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"

  versioning { enabled = true }

  lifecycle_rule {
    action { type = "Delete" }
    condition { age = 365 }
  }

  labels = {
    environment = var.environment
    data_layer  = "d0-raw"
    managed_by  = "terraform"
  }
}

resource "google_storage_bucket_iam_member" "data_ingestion_writer" {
  bucket = google_storage_bucket.d0_raw_landing.name
  role   = "roles/storage.objectCreator"
  member = "serviceAccount:${var.data_ingestion_service_account}"
}

resource "google_storage_bucket_iam_member" "analytics_reader" {
  bucket = google_storage_bucket.d0_raw_landing.name
  role   = "roles/storage.objectViewer"
  member = "group:${var.analytics_group}"
}
