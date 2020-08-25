terraform {
  required_version = ">= 0.12.26"

  required_providers {
    datadog = {
      source = "terraform-providers/datadog"
    }

    google = {
      source = "hashicorp/google"
    }

    random = {
      source = "hashicorp/random"
    }
  }
}
