resource "datadog_integration_pagerduty" "pagerduty" {
  individual_services = true
  subdomain           = var.subdomain
  api_token           = var.api_token
}

resource "datadog_integration_pagerduty_service_object" "service" {
  depends_on   = ["datadog_integration_pagerduty.pagerduty"]
  for_each     = var.services
  service_name = each.key
  service_key  = each.value
}
