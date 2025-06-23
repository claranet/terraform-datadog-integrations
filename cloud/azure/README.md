# CLOUD AZURE DataDog integrations

## How to use this module

```hcl
module "datadog-integrations-cloud-azure" {
  source      = "claranet/integrations/datadog//cloud/azure"
  version     = "{revision}"

  azure_tenant_id = data.azurerm_subscription.main.tenant_id

  azure_service_principal = {
    client_id     = module.sp.app_id
    client_secret = module.sp.secret_key
  }
}

```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | >= 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [datadog_integration_azure.main](https://registry.terraform.io/providers/Datadog/datadog/latest/docs/resources/integration_azure) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_automute_enabled"></a> [automute\_enabled](#input\_automute\_enabled) | Silence monitors for expected Azure VM shutdowns. | `bool` | `false` | no |
| <a name="input_azure_service_principal"></a> [azure\_service\_principal](#input\_azure\_service\_principal) | Azure Service Principal for Datadog integration. | <pre>object({<br>    client_id     = string<br>    client_secret = string<br>  })</pre> | n/a | yes |
| <a name="input_azure_tenant_id"></a> [azure\_tenant\_id](#input\_azure\_tenant\_id) | Azure Tenant ID. | `string` | n/a | yes |
| <a name="input_cspm_enabled"></a> [cspm\_enabled](#input\_cspm\_enabled) | When enabled, Datadog’s Cloud Security Management product scans resource configurations monitored by this app registration. Note: This requires `resource_collection_enabled` to be set to `true`. | `bool` | `false` | no |
| <a name="input_custom_metrics_enabled"></a> [custom\_metrics\_enabled](#input\_custom\_metrics\_enabled) | Enable custom metrics for Azure integration. | `bool` | `false` | no |
| <a name="input_filter_tags"></a> [filter\_tags](#input\_filter\_tags) | Filters tags to limit metrics collection for Datadog Azure integration. | `list(string)` | <pre>[<br>  "dd_monitoring:enabled"<br>]</pre> | no |
| <a name="input_resource_collection_enabled"></a> [resource\_collection\_enabled](#input\_resource\_collection\_enabled) | When enabled, Datadog collects metadata and configuration info from cloud resources (such as compute instances, databases, and load balancers) monitored by this app registration/Service Principal. | `bool` | `null` | no |

## Outputs

No outputs.
## Related documentation

 - [DataDog documentation](https://docs.datadoghq.com/integrations/azure/#setup)

## Usage with Azure Service Principal TF module

```hcl
data "azurerm_subscription" "main" {}

module "sp" {
  source  = "claranet/service-principal/azurerm"
  version = "x.x.x"

  display_name = "claranet-tools"
  owners       = data.azuread_users.owners.object_ids

  scope_assignment = [
    {
      scope     = data.azurerm_subscription.main.id
      role_name = "Reader"
    },
  ]

  groups_member = {
    (data.azuread_group.readers.display_name) = data.azuread_group.readers.object_id
  }
}

module "datadog-integrations-cloud-azure" {
  source      = "claranet/integrations/datadog//cloud/azure"
  version     = "{revision}"

  azure_tenant_id = data.azurerm_subscription.main.tenant_id

  azure_service_principal = {
    client_id     = module.sp.app_id
    client_secret = module.sp.secret_key
  }
}

```
