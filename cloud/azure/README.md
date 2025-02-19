# CLOUD Azure DataDog integrations

## How to use this module

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

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| datadog | >= 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [datadog_integration_azure.main](https://registry.terraform.io/providers/Datadog/datadog/latest/docs/resources/integration_azure) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| automute\_enabled | Silence monitors for expected Azure VM shutdowns. | `bool` | `false` | no |
| azure\_service\_principal | Azure Service Principal for Datadog integration. | <pre>object({<br>    client_id     = string<br>    client_secret = string<br>  })</pre> | n/a | yes |
| azure\_tenant\_id | Azure Tenant ID. | `string` | n/a | yes |
| cspm\_enabled | When enabled, Datadog’s Cloud Security Management product scans resource configurations monitored by this app registration. Note: This requires `resource_collection_enabled` to be set to `true`. | `bool` | `false` | no |
| custom\_metrics\_enabled | Enable custom metrics for Azure integration. | `bool` | `false` | no |
| filter\_tags | Filters tags to limit metrics collection for Datadog Azure integration. | `list(string)` | <pre>[<br>  "dd_monitoring:enabled"<br>]</pre> | no |
| resource\_collection\_enabled | When enabled, Datadog collects metadata and configuration info from cloud resources (such as compute instances, databases, and load balancers) monitored by this app registration/Service Principal. | `bool` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
## Related documentation

 - [DataDog documentation](https://docs.datadoghq.com/integrations/azure/#setup)
