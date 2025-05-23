terraform {
  required_version = ">= 0.12.31"

  required_providers {
    datadog = {
      source  = "Datadog/datadog"
      version = ">= 3.0.0"
    }

    google = {
      source  = "hashicorp/google"
      version = ">= 1.2"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 2.2"
    }
  }
}
