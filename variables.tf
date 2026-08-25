variable "project_id" { type = string }
variable "region" { type = string default = "asia-south1" }
variable "environment" {
  type = string
  default = "staging"
  validation {
    condition = contains(["staging", "production"], var.environment)
    error_message = "Environment must be staging or production."
  }
}
variable "raw_bucket_name" { type = string }
variable "bigquery_dataset_id" { type = string default = "d1_staged_enforced" }
variable "data_ingestion_service_account" { type = string }
variable "analytics_group" { type = string }
