variable "subdomain" {
  default = "claranet"
}

variable "api_token" {
  type = string
}

variable "services" {
  type = map(string)
}
