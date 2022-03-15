terraform {
  required_version = ">= 0.12.31"

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }

    datadog = {
      source  = "Datadog/datadog"
      version = ">= 3.0.0"
    }
  }
}
