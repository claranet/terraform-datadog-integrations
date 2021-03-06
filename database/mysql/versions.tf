terraform {
  required_version = ">= 0.12.26"

  required_providers {
    mysql = {
      source  = "terraform-providers/mysql"
      version = ">= 1.6.0"
    }

    random = {
      source = "hashicorp/random"
    }
  }
}
