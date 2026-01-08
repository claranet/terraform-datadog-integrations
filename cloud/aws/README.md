# CLOUD AWS DataDog integrations

## How to use this module

```hcl
module "datadog-integrations-cloud-aws" {
  source      = "claranet/integrations/datadog//cloud/aws"
  version     = "{revision}"

  aws_account_id = var.aws_account
  env            = var.environment
}

```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.11 |
| aws | >= 6.0.0 |
| datadog | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 6.0.0 |
| datadog | >= 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.dd_integration_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_attachment.allow_dd_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_policy_attachment.allow_security_audit_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_role.dd_integration_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [datadog_integration_aws_account.main](https://registry.terraform.io/providers/Datadog/datadog/latest/docs/resources/integration_aws_account) | resource |
| [aws_iam_policy_document.datadog_integration_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.dd_trust_relationship](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [datadog_integration_aws_external_id.main](https://registry.terraform.io/providers/Datadog/datadog/latest/docs/data-sources/integration_aws_external_id) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_account\_id | AWS account configuration for Datadog integration | `string` | n/a | yes |
| aws\_iam\_role\_enabled | Enable IAM role deployment for Datadog AWS integration | `bool` | `true` | no |
| aws\_partition | AWS partition for Datadog integration | `string` | `"aws"` | no |
| datadog\_aws\_account\_id | AWS account\_id of Datadog | `string` | `"464622532012"` | no |
| metrics\_config | Metrics configuration for Datadog AWS integration | <pre>object({<br>    automute_enabled : optional(bool, true),<br>    collect_cloudwatch_alarms : optional(bool, false),<br>    collect_custom_metrics : optional(bool, false),<br>    enabled : optional(bool, true),<br>    namespace_filters : optional(object({<br>      exclude_only : optional(list(string), null),<br>      include_only : optional(list(string), null),<br>      }), {<br>      exclude_only = ["AWS/ElasticMapReduce", "AWS/SQS", "AWS/Usage"]<br>    }),<br>    tag_filters : optional(object({<br>      namespace : string,<br>      tags : list(string),<br>      }), {<br>      namespace = "AWS/EC2"<br>      tags      = ["dd_monitored:true"]<br>    }),<br>  })</pre> | `{}` | no |
| metrics\_tags | Tags to apply to metrics collected from AWS | `map(string)` | `{}` | no |
| resource\_collection\_enabled | Enable resource collection for Datadog AWS integration | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| aws\_integration\_id | The ID of the DataDog AWS integration |
| aws\_role\_arn | The role ARN of the DataDog integration |
| aws\_role\_name | The IAM role name of the DataDog integration |
<!-- END_TF_DOCS -->