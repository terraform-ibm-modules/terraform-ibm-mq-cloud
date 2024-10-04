##############################################################################
# terraform-ibm-mq-cloud
#
# Lookup an MQ on Cloud queue manager connection information
##############################################################################

locals {
  connection_href = "${var.href}/connection_info"
}

data "external" "connection" {
  program = [
    "sh", "../../modules/experimental-connection/curlly.sh"
  ]
  query = {
    apikey = var.ibmcloud_api_key
    href   = local.connection_href
  }
}
