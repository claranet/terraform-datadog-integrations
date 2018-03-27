resource "aws_iam_role" "dd_integration_role" {
  name        = "DatadogAWSIntegrationRole"
  description = "Datadog AWS Integration Role according to https://docs.datadoghq.com/integrations/aws"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Principal": { "AWS": "arn:aws:iam::464622532012:root" },
    "Action": "sts:AssumeRole",
    "Condition": { "StringEquals": { "sts:ExternalId": "${var.aws_external_id}" } }
  }
}
EOF
}

resource "aws_iam_policy_attachment" "allow_dd_role" {
  name       = "Allow Datadog PolicyAccess via Role"
  roles      = ["${aws_iam_role.dd_integration_role.name}"]
  policy_arn = "${aws_iam_policy.dd_integration_policy.arn}"
}
