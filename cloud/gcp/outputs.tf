output "google_project_id" {
  description = "The id of the google project"
  value       = jsondecode(base64decode(google_service_account_key.datadog_service_account_key.private_key))["project_id"]
}

output "google_service_account_key_id" {
  description = "The id of the service_account key just created"
  value       = jsondecode(base64decode(google_service_account_key.datadog_service_account_key.private_key))["private_key_id"]
}

output "google_service_account_key_value" {
  description = "The value of the service_account key just created"
  value       = jsondecode(base64decode(google_service_account_key.datadog_service_account_key.private_key))["private_key"]
}

output "google_service_account_email" {
  description = "The email of the service_account just created"
  value       = jsondecode(base64decode(google_service_account_key.datadog_service_account_key.private_key))["client_email"]
}

output "google_client_id" {
  description = "The client id used in the service_account just created"
  value       = jsondecode(base64decode(google_service_account_key.datadog_service_account_key.private_key))["client_id"]
}
