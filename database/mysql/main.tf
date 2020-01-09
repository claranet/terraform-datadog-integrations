provider "mysql" {
  alias = "datadog-integration"

  endpoint = format("%s:%s", var.mysql_server_host, var.mysql_server_port)
  username = var.mysql_server_admin_login
  password = var.mysql_server_admin_password

  tls = var.connection_use_tls
}
