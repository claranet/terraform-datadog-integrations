# Datadog Integrations [![pipeline status](https://git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/integrations/badges/master/pipeline.svg)](https://git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/integrations/commits/master) #

This repository is used to store terraform modules allowing to configure datadog integrations like cloud providers.

## How to contribute ? ##

First, you may refresh your knowledge and look at the [terminology](https://confluence.fr.clara.net/display/DAT/Getting+started).

To contribute you will need to [report an issue](https://confluence.fr.clara.net/display/DAT/Project+and+Workflow) and create a branch with its Jira ID.

Then, create new directory for a new integration or update an existing one, do your changes, commit referncing Jira ID and open a merge request.

After any change you should run `./scripts/auto_update.sh ./` command to make sure all is up to date else the CI pipeline will fail on the branch.

## Important notes ##

* This repository represents a terraform feature and each first level directory could be imported as a terraform module, you must choose the one(s) you need.
* Each module should be usable by default but you should be able to configure some specicities if you need.
* You will find a complete `README.md` on each module, explaining how to use it.

### Terraform ###

Version >= 0.12 is required to use these modules of monitors.

```
terraform {
  required_version = "~> 0.12"
}

```

### DataDog provider ###

Here is the last tester terraform provider version for datadog but next versions should work too.

```
provider "datadog" {
  version = "2.0.2" # last tested working version

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
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/integrations.git//my/monitors/set?ref={revision}"
#  Rest of configuration will depends on each module, please see its README.md
}

```

Replace `{revision}` to the last git tag available on this repository.
The `//` is very important, it's a terraform specific syntax used to separate git url and folder path.
`my/integration` represents the path to an integration directory listed below.

### Integrations summary ###

- [cloud](https://git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/integrations/tree/master/cloud/)
	- [aws](https://git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/integrations/tree/master/cloud/aws/)
