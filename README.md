Datadog Integrations
====================

Purpose
-------

This repository is used to store all datadog integrations configurations :

* [aws](https://git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/integrations/tree/master/cloud/aws/)

How to use a module
-------------------

```
module "datadog-my-integration" {
  source          = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/integrations.git//my/integration?ref={revision}"
  # define specific inputs according of the integration manual
}
```
`my/integration` represents the path to an integration directory listed above

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations](https://docs.datadoghq.com/integrations)
