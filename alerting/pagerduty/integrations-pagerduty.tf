resource "datadog_integration_pagerduty" "pagerduty" {
  individual_services = true
  subdomain           = var.subdomain
  api_token           = var.api_token
}

resource "datadog_integration_pagerduty_service_object" "service" {
  depends_on   = ["datadog_integration_pagerduty.pagerduty"]
  count        = length(var.services)
  service_name = element(keys(var.services), count.index)
  service_key  = lookup(var.services, element(keys(var.services), count.index))
}
