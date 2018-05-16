AWS Configuration for Datadog Integration
=========================================

How to use this module
----------------------

```
module "datadog-aws-integration" {
  source          = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.integrations.git//cloud/aws?ref={revision}"

  aws_external_id = "${var.aws_external_id}"
}
```

Purpose
-------

Creates a role with attached policy to allows Datadog to fetch metrics

* Creates IAM role
* Creates IAM policy
* Attach policy to role

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aws_external_id | Token provided by DataDog to connect with the AWS account | string | - | yes |

Outputs
-------

| Name | Description |
|------|-------------|
| aws_role_arn | The role ARN of the DataDog integration |
| aws_role_name | The IAM role name of the DataDog integration |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/amazon_web_services/#setup](https://docs.datadoghq.com/integrations/amazon_web_services/#setup)