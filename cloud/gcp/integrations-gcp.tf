resource "random_id" "service_account_name" {
  count       = var.gcp_service_account_id == "" ? 1 : 0
  byte_length = 4
  prefix      = "datadog-integration-"
}

data "google_service_account" "datadog_service_account" {
  count      = var.gcp_service_account_id != "" ? 1 : 0
  account_id = var.gcp_service_account_id
  project    = var.gcp_project_id
}

resource "google_service_account" "datadog_service_account" {
  count        = var.gcp_service_account_id == "" ? 1 : 0
  account_id   = lower(random_id.service_account_name[0].hex)
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

  id_to_use = length(data.google_service_account.datadog_service_account) > 0 ? data.google_service_account.datadog_service_account[0].id : google_service_account.datadog_service_account[0].id
}

resource "google_service_account_key" "sak" {
  service_account_id = local.id_to_use
}

resource "google_project_iam_member" "datadog_service_account_membership" {
  for_each = toset(var.gcp_service_account_id == "" ? local.project_roles : [])

  project = var.gcp_project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.datadog_service_account[0].account_id}"
}

locals {
  decoded_private_key = jsondecode(base64decode(google_service_account_key.sak.private_key))
}

resource "datadog_integration_gcp" "integration" {
  project_id     = local.decoded_private_key["project_id"]
  private_key    = local.decoded_private_key["private_key"]
  private_key_id = local.decoded_private_key["private_key_id"]
  client_email   = local.decoded_private_key["client_email"]
  client_id      = local.decoded_private_key["client_id"]
  host_filters   = join(",", var.host_filters)

  depends_on = [google_project_iam_member.datadog_service_account_membership]
}
