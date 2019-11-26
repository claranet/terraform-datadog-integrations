# ALERTING PAGERDUTY DataDog integrations

## How to use this module

```
module "datadog-integrations-alerting-pagerduty" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/integrations.git//alerting/pagerduty?ref={revision}"

  services  = var.pagerduty_services
}

```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| api\_token | Pagerduty API token | string | `""` | no |
| services | Pagerduty service name and service key couple | map(string) | n/a | yes |
| subdomain | Pagerduty subdomain for your organisation | string | `"claranet"` | no |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/pagerduty/](https://docs.datadoghq.com/integrations/pagerduty/)
Pagerduty documentation [https://www.pagerduty.com/docs/guides/datadog-integration-guide/](https://www.pagerduty.com/docs/guides/datadog-integration-guide/)

## Requirements

**WARNING:** tested with Datadog provider 2.3.0 and no manual action seems needed to apply this module but Pagerduty integration
may need first be manually enabled in [the Datadog web console](https://myaccount.datadoghq.com/account/settings#integrations/pagerduty)

You need to configure your Pagerduty services into a map like:

```
variable "pagerduty_services" {
  default = {
    Public_Cloud_FR_-_Team_-_Client_HNO    = "98765432198765432198765432198765"
    Public_Cloud_FR_-_Team_-_Client_HO     = "12345678912345678912345678912345"
  }
}

```

Values could be set from your `terraform.tfvars`.
