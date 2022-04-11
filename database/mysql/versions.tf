terraform {
  required_version = ">= 0.12.31"

  required_providers {
    mysql = {
      source  = "terraform-providers/mysql"
      version = ">= 1.6.0"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 2.2"
    }
  }
}
