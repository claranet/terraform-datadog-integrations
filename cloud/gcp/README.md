# CLOUD GCP DataDog integrations

## How to use this module

```
module "datadog-integrations-cloud-gcp" {
  source = "git::ssh://git@github.com/claranet/terraform-datadog-integrations.git//cloud/gcp?ref={revision}"

  gcp_service_account_id = var.gcp_service_account_id
  gcp_project_id         = var.gcp_project_id
}

```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| gcp\_project\_id | GCP project id for use with the Datadog GCP integration | string | n/a | yes |
| gcp\_service\_account\_id | GCP service account id for use with the Datadog GCP integration | string | n/a | yes |
| host\_filters | Filters to include or exclude metrics retrieved from the Datadog GCP integration | list | `[ "dd_monitoring:enabled" ]` | no |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/google_cloud_platform/#setup](https://docs.datadoghq.com/integrations/google_cloud_platform/#setup)

## Requirements

**WARNING:** The GCP integration has to first be manually enabled in [the Datadog web console](https://myaccount.datadoghq.com/account/settings#integrations/google-cloud-platform)

You need to configure you GCP provider.
Credentials could be set in your `terraform.tfvars`.

```
variable "gcp_project" {
  type = string
}

provider "google" {
  version = "~> 2.10.0"

  project = var.gcp_project
}
```
