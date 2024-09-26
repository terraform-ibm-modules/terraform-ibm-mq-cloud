##############################################################################
# terraform-ibm-mq-cloud
#
# Create an MQ on Cloud application api key
##############################################################################

locals {
  api_key_href = "${var.href}/api_key"
}

data "external" "application_apikey" {
  program = [
    "sh", "../../modules/experimental-api-key/curlly.sh",
  ]
  query = {
    apikey   = var.ibmcloud_api_key
    key_name = var.key_name
    href     = local.api_key_href
  }
}
