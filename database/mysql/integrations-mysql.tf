resource "random_password" "datadog" {
  count = var.create_monitoring_user ? 1 : 0

  length  = 32
  special = false
}

resource "mysql_user" "datadog" {
  count = var.create_monitoring_user ? 1 : 0

  provider = mysql.datadog-integration

  user               = var.monitoring_user_login
  host               = var.monitoring_user_host
  plaintext_password = join("", random_password.datadog.*.result)
}

resource "mysql_grant" "datadog_base" {
  provider = mysql.datadog-integration

  user       = var.monitoring_user_login
  host       = var.monitoring_user_host
  database   = "*"
  privileges = ["REPLICATION CLIENT", "PROCESS"]

  depends_on = [mysql_user.datadog]
}

resource "mysql_grant" "datadog_perf" {
  provider = mysql.datadog-integration

  user       = var.monitoring_user_login
  host       = var.monitoring_user_host
  database   = "performance_schema"
  privileges = ["SELECT"]

  depends_on = [mysql_user.datadog]
}
