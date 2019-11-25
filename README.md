# Datadog Integrations
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![Apache V2 License](http://img.shields.io/badge/license-Apache%20V2-blue.svg)](LICENSE) [![pipeline status](https://git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/integrations/badges/master/pipeline.svg)](https://git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/integrations/commits/master)

This repository aims to help to configure [Datadog](https://www.datadoghq.com/) integrations using [Terraform](https://www.terraform.io/) modules.

## Important notes

* This repository provide multiple Terraform modules which could be imported, you must choose the one(s) you need.
* Each module should be usable by default but you should be able to configure some specicities if you need.
* You will find a complete `README.md` on each module, explaining how to use it.

## Getting started

### Terraform

Here is the minimum version required to use these modules of integrations.

```
terraform {
  required_version = ">= 0.12.7"
}

```

### DataDog provider

Here is the last tester terraform provider version for datadog but next versions should work too.

```
provider "datadog" {
  version = "2.3.0" # last tested working version

  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}

```

Both of the `datadog_api_key` and `datadog_app_key` are unique to the each datadog account. You can define them in `terraform.tfvars` file:

```
datadog_api_key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
datadog_app_key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
```

### Variables

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

## Modules declaration example

```
# integrations modules to declare ...
module "datadog-my-integration" {
  source = "git::ssh://git@github.com/claranet/terraform-datadog-integrations.git//my/integration/set?ref={revision}"
#  Rest of configuration will depends on each module, please see its README.md
}

```

* Replace `{revision}` to the last git tag available on this repository.
* The `//` is very important, it's a terraform specific syntax used to separate git url and folder path.
* `my/integration` represents the path to an integration directory listed below.

### Integrations summary

- [alerting](https://github.com/claranet/terraform-datadog-integrations/tree/master/alerting/)
	- [pagerduty](https://github.com/claranet/terraform-datadog-integrations/tree/master/alerting/pagerduty/)
- [cloud](https://github.com/claranet/terraform-datadog-integrations/tree/master/cloud/)
	- [aws](https://github.com/claranet/terraform-datadog-integrations/tree/master/cloud/aws/)
	- [gcp](https://github.com/claranet/terraform-datadog-integrations/tree/master/cloud/gcp/)
