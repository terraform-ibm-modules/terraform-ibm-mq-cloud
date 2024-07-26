########################################################################################################################
# Outputs
########################################################################################################################

output "id" {
  description = "The unique identifier of the queue manager."
  value       = resource.ibm_mqcloud_queue_manager.mqcloud_queue_manager.id
}

output "administrator_api_endpoint_url" {
  description = "The url through which to access the Admin REST APIs for this queue manager."
  value       = resource.ibm_mqcloud_queue_manager.mqcloud_queue_manager.administrator_api_endpoint_url
}

output "available_upgrade_versions_uri" {
  description = "The uri through which the available versions to upgrade to can be found for this queue manager."
  value       = resource.ibm_mqcloud_queue_manager.mqcloud_queue_manager.available_upgrade_versions_uri
}

output "connection_info_uri" {
  description = "The uri through which the CDDT for this queue manager can be obtained."
  value       = resource.ibm_mqcloud_queue_manager.mqcloud_queue_manager.connection_info_uri
}

output "date_created" {
  description = "RFC3339 formatted UTC date for when the queue manager was created."
  value       = resource.ibm_mqcloud_queue_manager.mqcloud_queue_manager.date_created
}

output "href" {
  description = "The URL for this queue manager."
  value       = resource.ibm_mqcloud_queue_manager.mqcloud_queue_manager.href
}

output "queue_manager_id" {
  description = "The ID of the queue manager which was allocated on creation, and can be used for delete calls."
  value       = resource.ibm_mqcloud_queue_manager.mqcloud_queue_manager.queue_manager_id
}

output "rest_api_endpoint_url" {
  description = "The url through which to access REST APIs for this queue manager."
  value       = resource.ibm_mqcloud_queue_manager.mqcloud_queue_manager.rest_api_endpoint_url
}

output "status_uri" {
  description = "The reference uri to get deployment status of the queue manager."
  value       = resource.ibm_mqcloud_queue_manager.mqcloud_queue_manager.status_uri
}

output "upgrade_available" {
  description = "Describes whether an upgrade is available for this queue manager."
  value       = resource.ibm_mqcloud_queue_manager.mqcloud_queue_manager.upgrade_available
}

output "web_console_url" {
  description = "The url through which to access the web console for this queue manager."
  value       = resource.ibm_mqcloud_queue_manager.mqcloud_queue_manager.web_console_url
}
