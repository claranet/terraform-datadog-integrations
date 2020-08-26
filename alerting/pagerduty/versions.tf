terraform {
  required_version = ">= 0.12.26"

  required_providers {
    datadog = {
      source  = "terraform-providers/datadog"
      version = ">= 2.1.0"
    }
  }
}
