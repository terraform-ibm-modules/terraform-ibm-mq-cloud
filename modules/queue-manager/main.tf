##############################################################################
# terraform-ibm-mq-cloud
#
# Create an MQ on Cloud queue manager
##############################################################################

resource "ibm_mqcloud_queue_manager" "mqcloud_queue_manager" {
  display_name          = var.display_name
  location              = var.location
  name                  = var.name
  service_instance_guid = var.service_instance_guid
  size                  = var.size
  version               = var.queue_manager_version
}
