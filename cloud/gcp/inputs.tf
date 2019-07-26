variable "gcp_service_account_id" {
  description = "GCP service account id for use with the Datadog GCP integration"
  type        = string
}

variable "gcp_project_id" {
  description = "GCP project id for use with the Datadog GCP integration"
  type        = string
}

variable "host_filters" {
  description = "Filters to include or exclude metrics retrieved from the Datadog GCP integration"
  default     = ["dd_monitoring:enabled"]
}
