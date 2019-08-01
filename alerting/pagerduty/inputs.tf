variable "subdomain" {
  type        = string
  description = "Pagerduty subdomain for your organisation"
  default     = "claranet"
}

variable "api_token" {
  type        = string
  description = "Pagerduty API token"
}

variable "services" {
  type        = map(string)
  description = "Pagerduty service name and service key couple"
}
