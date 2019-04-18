# Datadog Integrations [![pipeline status](https://git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/integrations/badges/master/pipeline.svg)](https://git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/integrations/commits/master) #

This repository is used to store terraform features to configure datadog integrations.

### How to contribute ? ###

First, you may refresh your knowledge and look at the [terminology](https://confluence.fr.clara.net/display/DAT/Getting+started).

To contribute you will need to [report an issue](https://confluence.fr.clara.net/display/DAT/Project+and+Workflow) and create a branch with its Jira ID.

Then, create new directory for a new integration or update an existing one, do your changes, commit referncing Jira ID and open a merge request.

After any change you should run `./scripts/auto_update.sh ./` command to make sure all is up to date else the CI pipeline will fail on the branch.

### Important notes ###

* This repository represents a terraform feature and each first level directory could be imported as a terraform module, you must choose the one(s) you need.
* Each module should be usable by default but you should be able to configure some specicities if you need.
* You will find a complete `README.md` on each module, explaining how to use it.

### The DataDog provider ###

Before importing some modules, you must define the DataDog provider in your `main.tf`

```
provider "datadog" {
  version = "1.7.0" # if you use version before 1.0.4 you will have diff on monitor type

  api_key = "${var.datadog_api_key}"
  app_key = "${var.datadog_app_key}"
}
```

Both of the `datadog_api_key` and `datadog_app_key` are unique to the client.

### Module declaration example ###

```
module "datadog-my-integration" {
  source          = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/integrations.git//my/integration?ref={revision}"
  # define specific inputs according of the integration manual
}
```

The `//` is very important, it's a terraform specific syntax used to separate git url and folder path.
`my/integration` represents the path to an integration directory listed below.

### Integrations summary ###

- [cloud](https://git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/integrations/tree/master/cloud/)
	- [aws](https://git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/integrations/tree/master/cloud/aws/)
