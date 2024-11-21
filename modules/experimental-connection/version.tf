terraform {
  required_version = ">= 1.3.0"
  required_providers {
    # Use "greater than or equal to" range in modules
    external = {
      source  = "hashicorp/external"
      version = ">= 2.3.4"
    }
  }
}
