resource "datadog_integration_aws" "datadog_integration_aws" {
  account_id                       = var.aws_account
  role_name                        = local.role_name
  filter_tags                      = var.filter_tags
  host_tags                        = var.host_tags
  account_specific_namespace_rules = var.account_specific_namespace_rules
}

