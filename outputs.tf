output "aws_role_arn" {
  value = "${aws_iam_role.dd_integration_role.arn}"
}

output "aws_role_name" {
  value = "${aws_iam_role.dd_integration_role.name}"
}

