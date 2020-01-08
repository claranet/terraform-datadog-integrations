output "monitoring_user_password" {
  description = "Monitoring user password if created by the module"
  value       = join("", random_password.datadog.*.result)
  sensitive   = true
}

output "monitoring_user_login" {
  description = "Monitoring user login"
  value       = var.monitoring_user_login
}

output "monitoring_user_host" {
  description = "Monitoring user password"
  value       = var.monitoring_user_host
}
