# CLOUD GCP DataDog integrations

## How to use this module

```hcl
module "datadog-integrations-cloud-gcp" {
  source      = "claranet/integrations/datadog//cloud/gcp"
  version     = "{revision}"

  gcp_service_account_id = var.gcp_service_account_id
  gcp_project_id         = var.gcp_project_id
}

```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| gcp\_project\_id | GCP project id for use with the Datadog GCP integration | `string` | n/a | yes |
| gcp\_service\_account\_id | GCP service account id for use with the Datadog GCP integration | `string` | `""` | no |
| host\_filters | Filters to include or exclude metrics retrieved from the Datadog GCP integration | `list` | <pre>[<br>  "dd_monitoring:enabled"<br>]<br></pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| google\_client\_id | The client id used in the service\_account created, if gcp\_service\_account\_id was not provided |
| google\_service\_account\_email | The email of the service\_account created, if gcp\_service\_account\_id was not provided |
| google\_service\_account\_key\_id | The id of the service\_account key just created |

## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/google_cloud_platform/#setup](https://docs.datadoghq.com/integrations/google_cloud_platform/#setup)

## Requirements

**WARNING:** This module uses google_project_iam_member which is not compatible with IAM permissions set externally and authoritatively managed with google_project_iam_policy.

You need to **install by hand** datadog web interface the **Google Cloud Platform integration**. You'll then need to create by hand the api and app key to be able to fill its in the terraform.tfvars.

You need to configure your GCP provider.
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
