# Datadog Integrations [![pipeline status](https://git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/integrations/badges/master/pipeline.svg)](https://git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/integrations/commits/master) #

This repository is used to store terraform modules allowing to configure datadog integrations like cloud providers.

## How to contribute ? ##

First, you may refresh your knowledge and look at the [terminology](https://confluence.fr.clara.net/display/DAT/Getting+started).

To contribute you will need to [report an issue](https://confluence.fr.clara.net/display/DAT/Project+and+Workflow) and create a branch with its Jira ID.

After any change, you will need to run the [auto update scripts](./scripts/README.md) to make sure all is up to date otherwise the CI pipeline will fail.

## Important notes ##

* This repository represents a terraform feature and each first level directory could be imported as a terraform module, you must choose the one(s) you need.
* Each module should be usable by default but you should be able to configure some specicities if you need.
* You will find a complete `README.md` on each module, explaining how to use it.

### Terraform ###

Here is the minimum version required to use these modules of integrations.

```
terraform {
  required_version = ">= 0.12.6"
}

```

### DataDog provider ###

Here is the last tester terraform provider version for datadog but next versions should work too.

```
provider "datadog" {
  version = "2.1.0" # last tested working version

  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}

```

Both of the `datadog_api_key` and `datadog_app_key` are unique to the each datadog account. You can define them in `terraform.tfvars` file:

```
datadog_api_key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
datadog_app_key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
```

### Variables ###

Some variables need to be declared.

```
variable "environment" {
  type    = string
  default = "dev"
}

variable "datadog_api_key" {
  type = string
}

variable "datadog_app_key" {
  type = string
}

```

## Modules declaration example ##

```
# integrations modules to declare ...
module "datadog-my-integration" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/integrations.git//my/integration/set?ref={revision}"
#  Rest of configuration will depends on each module, please see its README.md
}

```

Replace `{revision}` to the last git tag available on this repository.
The `//` is very important, it's a terraform specific syntax used to separate git url and folder path.
`my/integration` represents the path to an integration directory listed below.

### Integrations summary ###

- [alerting](https://git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/integrations/tree/master/alerting/)
	- [pagerduty](https://git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/integrations/tree/master/alerting/pagerduty/)
- [cloud](https://git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/integrations/tree/master/cloud/)
	- [aws](https://git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/integrations/tree/master/cloud/aws/)
	- [gcp](https://git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/integrations/tree/master/cloud/gcp/)
