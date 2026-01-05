data "datadog_integration_aws_external_id" "main" {
  aws_account_id = var.aws_account_id

  lifecycle {
    enabled = var.aws_iam_role_enabled
  }
}

resource "aws_iam_role" "dd_integration_role" {
  name        = local.role_name
  description = "Datadog AWS Integration Role according to https://docs.datadoghq.com/integrations/aws"

  assume_role_policy = data.aws_iam_policy_document.dd_trust_relationship.json

  lifecycle {
    enabled = var.aws_iam_role_enabled
  }
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
      values   = [data.datadog_integration_aws_external_id.main.external_id]
      variable = "sts:ExternalId"
    }
  }

  lifecycle {
    enabled = var.aws_iam_role_enabled
  }
}

resource "aws_iam_policy_attachment" "allow_dd_role" {
  name       = "Allow Datadog PolicyAccess via Role"
  roles      = [aws_iam_role.dd_integration_role.name]
  policy_arn = aws_iam_policy.dd_integration_policy.arn

  lifecycle {
    enabled = var.aws_iam_role_enabled
  }
}

resource "aws_iam_policy" "dd_integration_policy" {
  name        = "DatadogAWSIntegrationPolicy"
  path        = "/"
  description = "Datadog integration policy according to https://docs.datadoghq.com/integrations/aws/"

  policy = data.aws_iam_policy_document.datadog_integration_policy.json

  lifecycle {
    enabled = var.aws_iam_role_enabled
  }
}

data "aws_iam_policy_document" "datadog_integration_policy" {
  statement {
    sid    = "DatadogAWSIntegration"
    effect = "Allow"

    actions = [
      "account:GetAccountInformation",
      "apigateway:GET",
      "autoscaling:Describe*",
      "budgets:ViewBudget",
      "cloudfront:GetDistributionConfig",
      "cloudfront:ListDistributions",
      "cloudtrail:DescribeTrails",
      "cloudtrail:GetTrailStatus",
      "cloudwatch:Describe*",
      "cloudwatch:Get*",
      "cloudwatch:List*",
      "codedeploy:BatchGet*",
      "codedeploy:List*",
      "directconnect:Describe*",
      "dynamodb:Describe*",
      "dynamodb:List*",
      "ec2:Describe*",
      "ecs:Describe*",
      "ecs:List*",
      "elasticache:Describe*",
      "elasticache:List*",
      "elasticfilesystem:DescribeAccessPoints",
      "elasticfilesystem:DescribeFileSystems",
      "elasticfilesystem:DescribeTags",
      "elasticloadbalancing:Describe*",
      "elasticmapreduce:Describe*",
      "elasticmapreduce:List*",
      "es:DescribeElasticsearchDomains",
      "es:ListDomainNames",
      "es:ListTags",
      "health:DescribeAffectedEntities",
      "health:DescribeEventDetails",
      "health:DescribeEvents",
      "kinesis:Describe*",
      "kinesis:List*",
      "lambda:AddPermission",
      "lambda:GetPolicy",
      "lambda:List*",
      "lambda:RemovePermission",
      "logs:DeleteSubscriptionFilter",
      "logs:Describe*",
      "logs:DescribeSubscriptionFilters",
      "logs:FilterLogEvents",
      "logs:Get*",
      "logs:PutSubscriptionFilter",
      "logs:TestMetricFilter",
      "rds:Describe*",
      "rds:List*",
      "redshift:DescribeClusters",
      "redshift:DescribeLoggingStatus",
      "route53:List*",
      "s3:GetBucketLocation",
      "s3:GetBucketLogging",
      "s3:GetBucketNotification",
      "s3:GetBucketTagging",
      "s3:ListAllMyBuckets",
      "s3:PutBucketNotification",
      "ses:Get*",
      "sns:List*",
      "sns:Publish",
      "sqs:ListQueues",
      "states:DescribeStateMachine",
      "states:ListStateMachines",
      "support:*",
      "tag:GetResources",
      "tag:GetTagKeys",
      "tag:GetTagValues",
      "xray:BatchGetTraces",
      "xray:GetTraceSummaries",
    ]

    resources = ["*"]
  }

  lifecycle {
    enabled = var.aws_iam_role_enabled
  }
}
