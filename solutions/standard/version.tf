terraform {
  required_version = ">= 1.3.0"

  # Renovate will pin the deployable architecture to the latest provider
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "1.75.2"
    }
  }
}
