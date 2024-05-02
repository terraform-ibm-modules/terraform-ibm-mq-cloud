########################################################################################################################
# Outputs
########################################################################################################################

output "id" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_queue_manager.mqcloud_queue_manager.id
}

output "administrator_api_endpoint_url" {
  description = "URL to application. Depending on visibility this is accessible publicly or in the private network only."
  value       = resource.ibm_mqcloud_queue_manager.mqcloud_queue_manager.administrator_api_endpoint_url
}

output "available_upgrade_versions_uri" {
  description = "URL to application that is only visible within the project."
  value       = resource.ibm_mqcloud_queue_manager.mqcloud_queue_manager.available_upgrade_versions_uri
}

output "connection_info_uri" {
  description = "The name of the created code engine app."
  value       = resource.ibm_mqcloud_queue_manager.mqcloud_queue_manager.connection_info_uri
}

output "date_created" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_queue_manager.mqcloud_queue_manager.date_created
}

output "href" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_queue_manager.mqcloud_queue_manager.href
}

output "queue_manager_id" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_queue_manager.mqcloud_queue_manager.queue_manager_id
}

output "rest_api_endpoint_url" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_queue_manager.mqcloud_queue_manager.rest_api_endpoint_url
}

output "status_uri" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_queue_manager.mqcloud_queue_manager.status_uri
}

output "upgrade_available" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_queue_manager.mqcloud_queue_manager.upgrade_available
}

output "web_console_url" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_queue_manager.mqcloud_queue_manager.web_console_url
}
