# CLOUD AWS DataDog integrations

This Terraform module sets up the integration between AWS and Datadog monitoring service. 
It creates an IAM role and policies in AWS that allow Datadog to access and collect metrics from your AWS resources, 
and configures the Datadog AWS integration with customizable metric collection settings.

Related documentation: [https://docs.datadoghq.com/integrations/amazon-web-services/#setup](https://docs.datadoghq.com/integrations/amazon-web-services/#setup)

## Default behavior

- Namespaces related to ElasticMapReduce, SQS, and Usage are excluded from monitoring to reduce noise
- EC2 and Lambda metrics are filtered to only include resources tagged with `claranet_monitored:true` to avoid unexpected costs
- Resource collection is enabled

## How to use this module

```hcl
module "datadog-integrations-cloud-aws" {
  source      = "claranet/integrations/datadog//cloud/aws"
  version     = "{revision}"

  aws_account_id = var.aws_account
}

```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.0.0 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 6.0.0 |
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | >= 3.0.0 |

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
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | AWS account configuration for Datadog integration | `string` | n/a | yes |
| <a name="input_aws_iam_role_enabled"></a> [aws\_iam\_role\_enabled](#input\_aws\_iam\_role\_enabled) | Enable IAM role deployment for Datadog AWS integration | `bool` | `true` | no |
| <a name="input_aws_partition"></a> [aws\_partition](#input\_aws\_partition) | AWS partition for Datadog integration | `string` | `"aws"` | no |
| <a name="input_datadog_aws_account_id"></a> [datadog\_aws\_account\_id](#input\_datadog\_aws\_account\_id) | AWS account\_id of Datadog | `string` | `"464622532012"` | no |
| <a name="input_metrics_config"></a> [metrics\_config](#input\_metrics\_config) | Metrics configuration for Datadog AWS integration | <pre>object({<br>    automute_enabled : optional(bool, true),<br>    collect_cloudwatch_alarms : optional(bool, false),<br>    collect_custom_metrics : optional(bool, false),<br>    enabled : optional(bool, true),<br>    namespace_filters : optional(object({<br>      exclude_only : optional(list(string), null),<br>      include_only : optional(list(string), null),<br>      }), {<br>      exclude_only = ["AWS/ElasticMapReduce", "AWS/SQS", "AWS/Usage"]<br>    }),<br>    tag_filters : optional(list(object({<br>      namespace : string,<br>      tags : list(string),<br>    })), [<br>      {<br>        namespace = "AWS/EC2"<br>        tags = ["claranet_monitored:true"]<br>      }, {<br>        namespace = "AWS/Lambda"<br>        tags = [<br>          "claranet_monitored:true",<br>        ]<br>      }<br>    ],<br>    )})</pre> | `{}` | no |
| <a name="input_metrics_tags"></a> [metrics\_tags](#input\_metrics\_tags) | Tags to apply to metrics collected from AWS | `map(string)` | `{}` | no |
| <a name="input_resource_collection_enabled"></a> [resource\_collection\_enabled](#input\_resource\_collection\_enabled) | Enable resource collection for Datadog AWS integration | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_integration_id"></a> [aws\_integration\_id](#output\_aws\_integration\_id) | The ID of the DataDog AWS integration |
| <a name="output_aws_role_arn"></a> [aws\_role\_arn](#output\_aws\_role\_arn) | The role ARN of the DataDog integration |
| <a name="output_aws_role_name"></a> [aws\_role\_name](#output\_aws\_role\_name) | The IAM role name of the DataDog integration |
<!-- END_TF_DOCS -->