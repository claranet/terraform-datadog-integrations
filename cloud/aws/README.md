# CLOUD AWS DataDog integration

## How to use this module

```
module "datadog-monitors-cloud-aws" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/integrations.git//cloud/aws?ref={revision}"

  aws_account = "${var.aws_account}"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| account\_specific\_namespace\_rules | Namespaces to limit metric collection for datadog aws integration | map | `{}` | no |
| aws\_account |  | string | n/a | yes |
| datadog\_aws\_account\_id | AWS account_id of Datadog | string | `"464622532012"` | no |
| filter\_tags | Filters tags to limit metrics collection on EC2 for datadog aws integration | list | `[ "dd_monitoring:enabled" ]` | no |
| host\_tags | Tags to add all metrics retrieved from the datadog aws integration | list | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| aws\_role\_arn | The role ARN of the DataDog integration |
| aws\_role\_name | The IAM role name of the DataDog integration |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_web_services/#setup](https://docs.datadoghq.com/integrations/amazon_web_services/#setup)
