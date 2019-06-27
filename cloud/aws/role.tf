resource "aws_iam_role" "dd_integration_role" {
  name        = local.role_name
  description = "Datadog AWS Integration Role according to https://docs.datadoghq.com/integrations/aws"

  assume_role_policy = data.aws_iam_policy_document.dd_trust_relationship.json
}

data "aws_iam_policy_document" "dd_trust_relationship" {
  statement {
    sid     = "DatadogAWSTrustRelationship"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type = "AWS"

      identifiers = [
        "arn:aws:iam::${var.datadog_aws_account_id}:root",
      ]
    }

    condition {
      test     = "StringEquals"
      values   = [datadog_integration_aws.datadog_integration_aws.external_id]
      variable = "sts:ExternalId"
    }
  }
}

resource "aws_iam_policy_attachment" "allow_dd_role" {
  name       = "Allow Datadog PolicyAccess via Role"
  roles      = [aws_iam_role.dd_integration_role.name]
  policy_arn = aws_iam_policy.dd_integration_policy.arn
}

