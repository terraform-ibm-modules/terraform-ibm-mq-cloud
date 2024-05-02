##############################################################################
# terraform-ibm-mq-cloud
#
# Create an MQ on Cloud user
##############################################################################

resource "ibm_mqcloud_user" "user" {
  email                 = var.email
  name                  = var.name
  service_instance_guid = var.service_instance_guid
}
