# CLOUD AWS DataDog integrations

## How to use this module

```
module "datadog-integrations-cloud-aws" {
  source = "claranet/integrations/datadog//cloud/aws"
  version = "{revision}"

  aws_account = var.aws_account
}

```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| account\_specific\_namespace\_rules | Namespaces to limit metric collection for datadog aws integration | `map` | `{}` | no |
| aws\_account | n/a | `any` | n/a | yes |
| datadog\_aws\_account\_id | AWS account\_id of Datadog | `string` | `"464622532012"` | no |
| filter\_tags | Filters tags to limit metrics collection on EC2 for datadog aws integration | `list` | <pre>[<br>  "dd_monitoring:enabled"<br>]<br></pre> | no |
| host\_tags | Tags to add all metrics retrieved from the datadog aws integration | `list` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| aws\_role\_arn | The role ARN of the DataDog integration |
| aws\_role\_name | The IAM role name of the DataDog integration |

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

