variable "aws_account" {}

variable "datadog_aws_account_id" {
  description = "AWS account_id of Datadog"
  type        = "string"
  default     = "464622532012"
}

variable "filter_tags" {
  description = "Filters tags to limit metrics collection on EC2 for datadog aws integration"
  default     = ["dd_monitoring:enabled"]
}

variable "host_tags" {
  description = "Tags to add all metrics retrieved from the datadog aws integration"
  default     = []
}

variable "account_specific_namespace_rules" {
  description = "Namespaces to limite metric collection for datadog aws integration"
  default     = {}
}
