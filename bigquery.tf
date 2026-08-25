resource "google_bigquery_dataset" "d1_staged_enforced" {
  dataset_id                 = var.bigquery_dataset_id
  location                   = var.region
  delete_contents_on_destroy = false
  labels = {
    environment = var.environment
    data_layer  = "d1-staged"
    managed_by  = "terraform"
  }
}

resource "google_bigquery_table" "student_onboarding" {
  dataset_id          = google_bigquery_dataset.d1_staged_enforced.dataset_id
  table_id            = "student_onboarding"
  deletion_protection = true

  schema = jsonencode([
    {"name":"student_id","type":"STRING","mode":"REQUIRED"},
    {"name":"student_name","type":"STRING","mode":"REQUIRED"},
    {"name":"date_of_birth","type":"DATE","mode":"REQUIRED"},
    {"name":"parent_email","type":"STRING","mode":"REQUIRED"},
    {"name":"parent_phone","type":"STRING","mode":"REQUIRED"},
    {"name":"learning_support_required","type":"BOOL","mode":"REQUIRED"},
    {"name":"consent_given","type":"BOOL","mode":"REQUIRED"},
    {"name":"region","type":"STRING","mode":"REQUIRED"},
    {"name":"created_at","type":"TIMESTAMP","mode":"REQUIRED"}
  ])
}
resource "google_bigquery_dataset_iam_member" "analytics_data_viewer" {
  dataset_id = google_bigquery_dataset.d1_staged_enforced.dataset_id
  role       = "roles/bigquery.dataViewer"
  member     = "group:${var.analytics_group}"
}
