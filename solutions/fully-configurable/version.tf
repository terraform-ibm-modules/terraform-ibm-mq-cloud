terraform {
  required_version = ">= 1.9.0"

  # Renovate will pin the deployable architecture to the latest provider
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "2.0.2"
    }
  }
}
