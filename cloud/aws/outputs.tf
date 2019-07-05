output "aws_role_arn" {
  description = "The role ARN of the DataDog integration"
  value       = aws_iam_role.dd_integration_role.arn
}

output "aws_role_name" {
  description = "The IAM role name of the DataDog integration"
  value       = aws_iam_role.dd_integration_role.name
}

