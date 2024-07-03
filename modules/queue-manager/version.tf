terraform {
  required_version = ">= 1.3.0, <1.7.0"
  required_providers {
    # Use "greater than or equal to" range in modules
    ibm = {
      source  = "ibm-cloud/ibm"
      version = ">= 1.67.0-beta1, <2.0.0"
    }
  }
}