output "google_service_account_key_id" {
  description = "The id of the service_account key just created"
  value       = local.decoded_private_key["private_key_id"]
}

output "google_service_account_email" {
  description = "The email of the service_account created, if gcp_service_account_id was not provided"
  value       = local.decoded_private_key["client_email"]
}

output "google_client_id" {
  description = "The client id used in the service_account created, if gcp_service_account_id was not provided"
  value       = local.decoded_private_key["client_id"]
}
