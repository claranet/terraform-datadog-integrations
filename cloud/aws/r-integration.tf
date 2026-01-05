resource "datadog_integration_aws_account" "main" {
  account_tags   = ["env:${var.env}"]
  aws_account_id = var.aws_account_id
  aws_partition  = "aws"

  aws_regions {
    include_all = true
  }

  auth_config {
    aws_auth_config_role {
      role_name = local.role_name
    }
  }

  metrics_config {
    automute_enabled          = var.metrics_config.automute_enabled
    collect_cloudwatch_alarms = var.metrics_config.collect_cloudwatch_alarms
    collect_custom_metrics    = var.metrics_config.collect_custom_metrics
    enabled                   = var.metrics_config.enabled
    namespace_filters {
      exclude_only = var.metrics_config.namespace_filters.exclude_only
      include_only = var.metrics_config.namespace_filters.include_only
    }
    dynamic "tag_filters" {
      for_each = var.metrics_config.tag_filters[*]
      content {
        namespace = tag_filters.value.namespace
        tags      = tag_filters.value.tags
      }
    }
  }

  resources_config {
    extended_collection = false
  }

  logs_config {
    lambda_forwarder {}
  }
  traces_config {
    xray_services {}
  }
}
