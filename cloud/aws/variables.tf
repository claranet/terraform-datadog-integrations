variable "aws_account_id" {
  description = "AWS account configuration for Datadog integration"
  type        = string
}

variable "env" {
  description = "Environment configuration for Datadog integration"
  type        = string
}

variable "datadog_aws_account_id" {
  description = "AWS account_id of Datadog"
  type        = string
  default     = "464622532012"
}

variable "metrics_config" {
  description = "Metrics configuration for Datadog AWS integration"
  type = object({
    automute_enabled : optional(bool, true),
    collect_cloudwatch_alarms : optional(bool, false),
    collect_custom_metrics : optional(bool, false),
    enabled : optional(bool, true),
    namespace_filters : optional(object({
      exclude_only : optional(list(string), null),
      include_only : optional(list(string), null),
      }), {
      exclude_only = ["AWS/ElasticMapReduce", "AWS/SQS", "AWS/Usage"]
    }),
    tag_filters : optional(object({
      namespace : string,
      tags : list(string),
      }), {
      namespace = "AWS/EC2"
      tags      = ["dd_monitored:true"]
    }),
  })
  default = {}
}

variable "aws_iam_role_enabled" {
  description = "Enable IAM role deployment for Datadog AWS integration"
  type        = bool
  default     = false
}
