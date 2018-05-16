variable "datadog_aws_external_id" {
  description = "Token provided by DataDog to connect with the AWS account"
  type        = "string"
}

variable "datadog_aws_account_id" {
  description = "AWS account_id of Datadog"
  type        = "string"
  default     = "464622532012"
}
