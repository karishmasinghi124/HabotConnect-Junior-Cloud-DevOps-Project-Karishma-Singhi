output "raw_landing_bucket_name" { value = google_storage_bucket.d0_raw_landing.name }
output "bigquery_dataset_id" { value = google_bigquery_dataset.d1_staged_enforced.dataset_id }
output "student_onboarding_table_id" { value = google_bigquery_table.student_onboarding.table_id }
