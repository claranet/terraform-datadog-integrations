# DATABASE MYSQL DataDog integrations

## How to use this module

```hcl
module "datadog-integrations-database-mysql" {
  source      = "claranet/integrations/datadog//database/mysql"
  version     = "{revision}"

  mysql_server_host           = var.mysql_host
  mysql_server_admin_login    = var.mysql_admin_login
  mysql_server_admin_password = var.mysql_admin_password
}

```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_mysql"></a> [mysql](#requirement\_mysql) | >= 1.6.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_mysql.datadog-integration"></a> [mysql.datadog-integration](#provider\_mysql.datadog-integration) | >= 1.6.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 2.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [mysql_grant.datadog_base](https://registry.terraform.io/providers/terraform-providers/mysql/latest/docs/resources/grant) | resource |
| [mysql_grant.datadog_perf](https://registry.terraform.io/providers/terraform-providers/mysql/latest/docs/resources/grant) | resource |
| [mysql_user.datadog](https://registry.terraform.io/providers/terraform-providers/mysql/latest/docs/resources/user) | resource |
| [random_password.datadog](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_connection_use_tls"></a> [connection\_use\_tls](#input\_connection\_use\_tls) | Set if TLS should be used for db connection. One of `false`, `true`, or `skip-verify`. See https://www.terraform.io/docs/providers/mysql/index.html#tls | `string` | `"false"` | no |
| <a name="input_create_monitoring_user"></a> [create\_monitoring\_user](#input\_create\_monitoring\_user) | `true` if the user used for monitoring should be created | `bool` | `true` | no |
| <a name="input_monitoring_user_host"></a> [monitoring\_user\_host](#input\_monitoring\_user\_host) | MySQL user host for monitoring | `string` | `"%"` | no |
| <a name="input_monitoring_user_login"></a> [monitoring\_user\_login](#input\_monitoring\_user\_login) | MySQL user login for monitoring | `string` | `"datadog"` | no |
| <a name="input_mysql_server_admin_login"></a> [mysql\_server\_admin\_login](#input\_mysql\_server\_admin\_login) | MySQL server administrator login | `string` | n/a | yes |
| <a name="input_mysql_server_admin_password"></a> [mysql\_server\_admin\_password](#input\_mysql\_server\_admin\_password) | MySQL server administrator password | `string` | n/a | yes |
| <a name="input_mysql_server_host"></a> [mysql\_server\_host](#input\_mysql\_server\_host) | MySQL server host to connect to | `string` | n/a | yes |
| <a name="input_mysql_server_port"></a> [mysql\_server\_port](#input\_mysql\_server\_port) | MySQL server port | `number` | `"3306"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_monitoring_user_host"></a> [monitoring\_user\_host](#output\_monitoring\_user\_host) | Monitoring user password |
| <a name="output_monitoring_user_login"></a> [monitoring\_user\_login](#output\_monitoring\_user\_login) | Monitoring user login |
| <a name="output_monitoring_user_password"></a> [monitoring\_user\_password](#output\_monitoring\_user\_password) | Monitoring user password if created by the module |
## Related documentation

DataDog documentation: [https://docs.datadoghq.com/integrations/mysql/](https://docs.datadoghq.com/integrations/mysql/)

## Purpose

This module prepares a MySQL server for use with Datadog.

See [https://docs.datadoghq.com/integrations/mysql/#prepare-mysql](https://docs.datadoghq.com/integrations/mysql/#prepare-mysql)
