resource "datadog_integration_azure" "main" {
  tenant_name   = var.azure_tenant_id
  client_id     = var.azure_service_principal.client_id
  client_secret = var.azure_service_principal.client_secret

  host_filters             = join(",", var.filter_tags)
  app_service_plan_filters = join(",", var.filter_tags)
  container_app_filters    = join(",", var.filter_tags)

  automute               = var.automute_enabled
  custom_metrics_enabled = var.custom_metrics_enabled
  cspm_enabled           = var.cspm_enabled

  metrics_enabled             = true
  metrics_enabled_default     = true
  usage_metrics_enabled       = true
  resource_collection_enabled = var.resource_collection_enabled
}
