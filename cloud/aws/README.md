# CLOUD AWS DataDog integrations

## How to use this module

```hcl
module "datadog-integrations-cloud-aws" {
  source      = "claranet/integrations/datadog//cloud/aws"
  version     = "{revision}"

  aws_account = var.aws_account
}

```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | >= 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.dd_integration_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_attachment.allow_dd_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_role.dd_integration_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [datadog_integration_aws.datadog_integration_aws](https://registry.terraform.io/providers/Datadog/datadog/latest/docs/resources/integration_aws) | resource |
| [aws_iam_policy_document.datadog_integration_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.dd_trust_relationship](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_specific_namespace_rules"></a> [account\_specific\_namespace\_rules](#input\_account\_specific\_namespace\_rules) | Namespaces to limit metric collection for datadog aws integration | `map` | `{}` | no |
| <a name="input_aws_account"></a> [aws\_account](#input\_aws\_account) | n/a | `any` | n/a | yes |
| <a name="input_datadog_aws_account_id"></a> [datadog\_aws\_account\_id](#input\_datadog\_aws\_account\_id) | AWS account\_id of Datadog | `string` | `"464622532012"` | no |
| <a name="input_filter_tags"></a> [filter\_tags](#input\_filter\_tags) | Filters tags to limit metrics collection on EC2 for datadog aws integration | `list` | <pre>[<br>  "dd_monitoring:enabled"<br>]</pre> | no |
| <a name="input_host_tags"></a> [host\_tags](#input\_host\_tags) | Tags to add all metrics retrieved from the datadog aws integration | `list` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_role_arn"></a> [aws\_role\_arn](#output\_aws\_role\_arn) | The role ARN of the DataDog integration |
| <a name="output_aws_role_name"></a> [aws\_role\_name](#output\_aws\_role\_name) | The IAM role name of the DataDog integration |
## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_web_services/#setup](https://docs.datadoghq.com/integrations/amazon_web_services/#setup)

## Requirements

You need to configure you AWS provider.
Credentials could be set in your `terraform.tfvars`.

```
variable "aws_region" {
  type = string
}

variable "aws_account" {
  type = string
}

variable "aws_access_key" {
}

variable "aws_secret_key" {
}

variable "aws_token" {
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  token      = var.aws_token
}

```

