########################################################################################################################
# Provider config
########################################################################################################################

provider "ibm" {
  ibmcloud_api_key      = var.ibmcloud_api_key
  visibility            = var.provider_visibility
  region                = var.region
  private_endpoint_type = (var.provider_visibility == "private" && var.region == "ca-mon") ? "vpe" : null
}

provider "ibm" {
  ibmcloud_api_key      = local.sm_ibmcloud_api_key
  visibility            = var.provider_visibility
  region                = local.sm_region
  alias                 = "ibm-sm"
  private_endpoint_type = (var.provider_visibility == "private" && local.sm_region == "ca-mon") ? "vpe" : null
}
