output "aws_role_arn" {
  description = "The role ARN of the DataDog integration"
  value       = try(aws_iam_role.dd_integration_role.arn, null)
}

output "aws_role_name" {
  description = "The IAM role name of the DataDog integration"
  value       = try(aws_iam_role.dd_integration_role.name, null)
}

output "aws_integration_id" {
  description = "The ID of the DataDog AWS integration"
  value       = datadog_integration_aws_account.main.id
}
