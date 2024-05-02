##############################################################################
# terraform-ibm-mq-cloud
#
# Create an MQ on Cloud SaaS instance
##############################################################################

resource "ibm_resource_instance" "mqcloud" {
  location          = var.region
  name              = var.name
  plan              = var.service_plan
  resource_group_id = var.resource_group_id
  service           = "mqcloud"
  tags              = var.tags
}
