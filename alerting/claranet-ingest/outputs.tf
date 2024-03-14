output "datadog_integration_id" {
  description = "Datadog integration ID"
  value       = datadog_webhook.datadog_integration.id
}

output "datadog_integration_name" {
  description = "Datadog integration name"
  value       = datadog_webhook.datadog_integration.name
}

output "datadog_integration_notification" {
  description = "Datadog integration formatted notification"
  value       = format("@webhook-%s", datadog_webhook.datadog_integration.id)
}
