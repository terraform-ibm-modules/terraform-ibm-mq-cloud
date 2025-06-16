########################################################################################################################
# Provider config
########################################################################################################################

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  visibility       = var.provider_visibility
  region           = var.region
}

provider "ibm" {
  ibmcloud_api_key = local.sm_ibmcloud_api_key
  visibility       = var.provider_visibility
  region           = local.sm_region
  alias            = "ibm-sm"
}
