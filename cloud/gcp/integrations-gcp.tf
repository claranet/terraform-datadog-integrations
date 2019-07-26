data "google_service_account" "sa" {
  account_id = var.gcp_service_account_id
  project    = var.gcp_project_id
}

resource "google_service_account_key" "sak" {
  service_account_id = data.google_service_account.sa.name
}
resource "datadog_integration_gcp" "integration" {
  project_id     = var.gcp_project_id
  private_key_id = split("/", google_service_account_key.sak.id)[5]
  private_key    = jsondecode(base64decode(google_service_account_key.sak.private_key))["private_key"]
  client_email   = data.google_service_account.sa.email
  client_id      = data.google_service_account.sa.unique_id
  host_filters   = join(",", var.host_filters)
}
