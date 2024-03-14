# Global

variable "suffix" {
  description = "Optional suffix for the integration name"
  type        = string
  default     = ""
}

# Ingest-Alerting Integration specific

variable "enabled" {
  description = "Whether the Webhook integration is enabled"
  type        = bool
  default     = true
}

variable "url" {
  description = "The ingest-alerting URL to use"
  type        = string
  default     = "https://ingest-alerting.fr.clara.net/splunk"
}

variable "token" {
  description = "The ingest-alerting JWT token to authentificate"
  type        = string
}

variable "additional_headers" {
  description = "Any additional headers to send"
  type        = map(any)
  default     = {}
}
