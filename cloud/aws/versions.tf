terraform {
  required_version = ">= 1.11"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0.0"
    }
    datadog = {
      source  = "Datadog/datadog"
      version = ">= 3.0.0"
    }
  }
}
