data "datadog_integration_aws_external_id" "main" {
  aws_account_id = var.aws_account_id

  lifecycle {
    enabled = var.aws_iam_role_enabled
  }

  depends_on = [
    datadog_integration_aws_account.main
  ]
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

resource "aws_iam_role_policy_attachment" "allow_security_audit_policy" {
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
  role       = aws_iam_role.dd_integration_role.name

  lifecycle {
    enabled = var.aws_iam_role_enabled && var.resource_collection_enabled
  }
}

resource "aws_iam_policy" "dd_integration_policy" {
  name        = local.policy_name
  path        = "/"
  description = "Datadog integration policy according to https://docs.datadoghq.com/integrations/aws/"

  policy = data.aws_iam_policy_document.datadog_integration_policy.json

  lifecycle {
    enabled = var.aws_iam_role_enabled
  }
}

# Required permissions documented at https://docs.datadoghq.com/integrations/amazon-web-services/#aws-iam-permissions
data "aws_iam_policy_document" "datadog_integration_policy" {
  statement {
    sid    = "DatadogAWSIntegration"
    effect = "Allow"

    actions = [
      "account:GetAccountInformation",
      "airflow:GetEnvironment",
      "airflow:ListEnvironments",
      "apigateway:GET",
      "appsync:ListGraphqlApis",
      "autoscaling:Describe*",
      "backup:List*",
      "batch:DescribeJobDefinitions",
      "batch:DescribeJobQueues",
      "batch:DescribeJobs",
      "batch:ListJobs",
      "bcm-data-exports:GetExport",
      "bcm-data-exports:ListExports",
      "budgets:ViewBudget",
      "cloudfront:GetDistributionConfig",
      "cloudfront:ListDistributions",
      "cloudtrail:DescribeTrails",
      "cloudtrail:GetTrail",
      "cloudtrail:GetTrailStatus",
      "cloudtrail:ListTrails",
      "cloudtrail:LookupEvents",
      "cloudwatch:Describe*",
      "cloudwatch:Get*",
      "cloudwatch:List*",
      "codebuild:BatchGetProjects",
      "codebuild:ListProjects",
      "codedeploy:BatchGet*",
      "codedeploy:List*",
      "cur:DescribeReportDefinitions",
      "directconnect:Describe*",
      "dms:DescribeReplicationInstances",
      "dynamodb:Describe*",
      "dynamodb:List*",
      "ec2:Describe*",
      "ecs:Describe*",
      "ecs:List*",
      "eks:DescribeCluster",
      "eks:ListClusters",
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
      "events:CreateEventBus",
      "fsx:DescribeFileSystems",
      "fsx:ListTagsForResource",
      "health:DescribeAffectedEntities",
      "health:DescribeEventDetails",
      "health:DescribeEvents",
      "iam:ListAccountAliases",
      "kinesis:Describe*",
      "kinesis:List*",
      "lambda:List*",
      "logs:DeleteSubscriptionFilter",
      "logs:DescribeDeliveries",
      "logs:DescribeDeliverySources",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
      "logs:DescribeSubscriptionFilters",
      "logs:FilterLogEvents",
      "logs:GetDeliveryDestination",
      "logs:PutSubscriptionFilter",
      "logs:TestMetricFilter",
      "network-firewall:DescribeLoggingConfiguration",
      "network-firewall:ListFirewalls",
      "oam:ListAttachedLinks",
      "oam:ListSinks",
      "organizations:Describe*",
      "organizations:List*",
      "rds:Describe*",
      "rds:List*",
      "redshift-serverless:ListNamespaces",
      "redshift:DescribeClusters",
      "redshift:DescribeLoggingStatus",
      "route53:List*",
      "route53resolver:ListResolverQueryLogConfigs",
      "s3:GetBucketLocation",
      "s3:GetBucketLogging",
      "s3:GetBucketNotification",
      "s3:GetBucketTagging",
      "s3:ListAllMyBuckets",
      "s3:PutBucketNotification",
      "ses:Get*",
      "ses:List*",
      "sns:GetSubscriptionAttributes",
      "sns:List*",
      "sns:Publish",
      "sqs:ListQueues",
      "ssm:GetServiceSetting",
      "ssm:ListCommands",
      "states:DescribeStateMachine",
      "states:ListStateMachines",
      "support:DescribeTrustedAdvisor*",
      "support:RefreshTrustedAdvisorCheck",
      "tag:GetResources",
      "tag:GetTagKeys",
      "tag:GetTagValues",
      "timestream:DescribeEndpoints",
      "wafv2:ListLoggingConfigurations",
      "xray:BatchGetTraces",
      "xray:GetTraceSummaries",
    ]

    resources = ["*"]
  }

  lifecycle {
    enabled = var.aws_iam_role_enabled
  }
}
