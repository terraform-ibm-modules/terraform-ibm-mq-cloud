terraform {
  required_version = ">= 1.9.0"
  required_providers {
    # Use "greater than or equal to" range in modules
    local = {
      source  = "hashicorp/local"
      version = ">= 2.5.2"
    }
  }
}
