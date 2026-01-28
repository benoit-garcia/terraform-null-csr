terraform {
  required_version = ">= 1.5.6"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.6.2"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.4"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.8.1"
    }
  }
}
