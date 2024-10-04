##############################################################################
# terraform-ibm-mq-cloud
#
# Create an MQ on Cloud truststore certificate
##############################################################################

locals {
  certificate_href = "${var.href}/download"
}

data "external" "certificate" {
  program = [
    "sh", "../../modules/experimental-certificate/curlly.sh"
  ]
  query = {
    apikey = var.ibmcloud_api_key
    href   = local.certificate_href
  }
}
