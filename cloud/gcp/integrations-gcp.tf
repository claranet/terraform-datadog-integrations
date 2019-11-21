resource "random_id" "service_account_name" {
  byte_length = 4
  prefix      = "datadog-integration-"
}

resource "google_service_account" "datadog_service_account" {
  account_id   = lower(random_id.service_account_name.hex)
  display_name = "Datadog integration"
  project      = var.gcp_project_id
}

locals {
  project_roles = [
    "roles/cloudasset.viewer",
    "roles/compute.viewer",
    "roles/container.viewer",
    "roles/monitoring.viewer",
  ]
}

resource "google_service_account_key" "datadog_service_account_key" {
  service_account_id = google_service_account.datadog_service_account.email
}

resource "google_project_iam_member" "datadog_service_account_membership" {
  for_each = toset(local.project_roles)

  project = var.gcp_project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.datadog_service_account.email}"
}

resource "datadog_integration_gcp" "datadog_project_integration" {
  project_id     = jsondecode(base64decode(google_service_account_key.datadog_service_account_key.private_key))["project_id"]
  private_key    = jsondecode(base64decode(google_service_account_key.datadog_service_account_key.private_key))["private_key"]
  private_key_id = jsondecode(base64decode(google_service_account_key.datadog_service_account_key.private_key))["private_key_id"]
  client_email   = jsondecode(base64decode(google_service_account_key.datadog_service_account_key.private_key))["client_email"]
  client_id      = jsondecode(base64decode(google_service_account_key.datadog_service_account_key.private_key))["client_id"]
  host_filters   = join(",", var.host_filters)

  depends_on = [ google_project_iam_member.datadog_service_account_membership ]
}
