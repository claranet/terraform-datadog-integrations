variable "mysql_server_host" {
  description = "MySQL server host to connect to"
  type        = string
}

variable "mysql_server_port" {
  description = "MySQL server port"
  type        = number
  default     = "3306"
}

variable "connection_use_tls" {
  description = "Set if TLS should be used for db connection. One of `false`, `true`, or `skip-verify`. See https://www.terraform.io/docs/providers/mysql/index.html#tls"
  type        = string
  default     = "false"
}

variable "mysql_server_admin_login" {
  description = "MySQL server administrator login"
  type        = string
}

variable "mysql_server_admin_password" {
  description = "MySQL server administrator password"
  type        = string
}

variable "create_monitoring_user" {
  description = "`true` if the user used for monitoring should be created"
  type        = bool
  default     = true
}

variable "monitoring_user_login" {
  description = "MySQL user login for monitoring"
  type        = string
  default     = "datadog"
}

variable "monitoring_user_host" {
  description = "MySQL user host for monitoring"
  type        = string
  default     = "%"
}

