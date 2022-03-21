terraform {
  required_version = ">= 0.12.31"

  required_providers {
    datadog = {
      source  = "Datadog/datadog"
      version = ">= 3.0.0"
    }
  }
}
