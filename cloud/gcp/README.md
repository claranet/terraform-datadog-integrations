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

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.0.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 1.2 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | >= 3.0.0 |
| <a name="provider_google"></a> [google](#provider\_google) | >= 1.2 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 2.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [datadog_integration_gcp.integration](https://registry.terraform.io/providers/Datadog/datadog/latest/docs/resources/integration_gcp) | resource |
| [google_project_iam_member.datadog_service_account_membership](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.datadog_service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_key.sak](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_key) | resource |
| [random_id.service_account_name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [google_service_account.datadog_service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/service_account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | GCP project id for use with the Datadog GCP integration | `string` | n/a | yes |
| <a name="input_gcp_service_account_id"></a> [gcp\_service\_account\_id](#input\_gcp\_service\_account\_id) | GCP service account id for use with the Datadog GCP integration | `string` | `""` | no |
| <a name="input_host_filters"></a> [host\_filters](#input\_host\_filters) | Filters to include or exclude metrics retrieved from the Datadog GCP integration | `list` | <pre>[<br>  "dd_monitoring:enabled"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_google_client_id"></a> [google\_client\_id](#output\_google\_client\_id) | The client id used in the service\_account created, if gcp\_service\_account\_id was not provided |
| <a name="output_google_service_account_email"></a> [google\_service\_account\_email](#output\_google\_service\_account\_email) | The email of the service\_account created, if gcp\_service\_account\_id was not provided |
| <a name="output_google_service_account_key_id"></a> [google\_service\_account\_key\_id](#output\_google\_service\_account\_key\_id) | The id of the service\_account key just created |
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
