# README #

This repository is used to configure AWS integration on Datadog. 


### Module Declaration example ###

```
module "datadog-integration" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.datadog.integration.aws.git"

  datadog_aws_external_id = "${var.datadog_aws_external_id}"
}
```

### Input Declaration example ###

```
variable "datadog_aws_external_id" {
  default = "xxx" # as defined in the Datadog console
}
```
