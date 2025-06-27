resource "datadog_integration_pagerduty_service_object" "service" {
  for_each     = var.services
  service_name = each.key
  service_key  = each.value
}
