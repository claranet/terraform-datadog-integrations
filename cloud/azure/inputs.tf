variable "azure_tenant_id" {
  description = "Azure Tenant ID."
  type        = string
}

variable "azure_service_principal" {
  description = "Azure Service Principal for Datadog integration."
  type = object({
    client_id     = string
    client_secret = string
  })
  nullable = false
}

variable "filter_tags" {
  description = "Filters tags to limit metrics collection for Datadog Azure integration."
  type        = list(string)
  default     = ["dd_monitoring:enabled"]
}

variable "automute_enabled" {
  description = "Silence monitors for expected Azure VM shutdowns."
  type        = bool
  default     = false
  nullable    = false
}

variable "custom_metrics_enabled" {
  description = "Enable custom metrics for Azure integration."
  type        = bool
  default     = false
  nullable    = false
}

variable "cspm_enabled" {
  description = "When enabled, Datadog’s Cloud Security Management product scans resource configurations monitored by this app registration. Note: This requires `resource_collection_enabled` to be set to `true`."
  type        = bool
  default     = false
  nullable    = false
}

variable "resource_collection_enabled" {
  description = "When enabled, Datadog collects metadata and configuration info from cloud resources (such as compute instances, databases, and load balancers) monitored by this app registration/Service Principal."
  type        = bool
  default     = null
}
