########################################################################################################################
# Outputs
########################################################################################################################

# MQ on Cloud capacity instance
output "capacity_crn" {
  value       = var.existing_mq_capacity_crn
  description = "MQ on Cloud capacity service instance CRN"
}

# MQ on Cloud deployment instance
output "deployment_crn" {
  value       = local.mq_deployment_crn
  description = "MQ on Cloud deployment service instance CRN"
}

output "location" {
  value       = local.location
  description = "First location available on the MQ on Cloud deployment"
}

# MQ on Cloud queue manager

output "queue_manager_name" {
  value       = local.create_queue_manager ? var.queue_manager_name : var.existing_queue_manager_name
  description = "Queue manager name"
}

output "queue_manager_administrator_api_endpoint_url" {
  description = "The url through which to access the Admin REST APIs for this queue manager."
  value       = local.create_queue_manager ? module.queue_manager[0].administrator_api_endpoint_url : data.ibm_mqcloud_queue_manager.queue_manager[0].queue_managers[0].administrator_api_endpoint_url
}

output "queue_manager_available_upgrade_versions_uri" {
  description = "The uri through which the available versions to upgrade to can be found for this queue manager."
  value       = local.create_queue_manager ? module.queue_manager[0].available_upgrade_versions_uri : data.ibm_mqcloud_queue_manager.queue_manager[0].queue_managers[0].available_upgrade_versions_uri
}

output "queue_manager_connection_info_uri" {
  description = "The uri through which the CDDT for this queue manager can be obtained."
  value       = local.create_queue_manager ? module.queue_manager[0].connection_info_uri : data.ibm_mqcloud_queue_manager.queue_manager[0].queue_managers[0].connection_info_uri
}

output "queue_manager_date_created" {
  description = "RFC3339 formatted UTC date for when the queue manager was created."
  value       = local.create_queue_manager ? module.queue_manager[0].date_created : data.ibm_mqcloud_queue_manager.queue_manager[0].queue_managers[0].date_created
}

output "queue_manager_href" {
  description = "The URL for this queue manager."
  value       = local.create_queue_manager ? module.queue_manager[0].href : data.ibm_mqcloud_queue_manager.queue_manager[0].queue_managers[0].href
}

output "queue_manager_id" {
  description = "The ID of the queue manager which was allocated on creation, and can be used for delete calls."
  value       = local.create_queue_manager ? module.queue_manager[0].queue_manager_id : data.ibm_mqcloud_queue_manager.queue_manager[0].queue_managers[0].id
}

output "queue_manager_rest_api_endpoint_url" {
  description = "The url through which to access REST APIs for this queue manager."
  value       = local.create_queue_manager ? module.queue_manager[0].rest_api_endpoint_url : data.ibm_mqcloud_queue_manager.queue_manager[0].queue_managers[0].rest_api_endpoint_url
}

output "queue_manager_status_uri" {
  description = "The reference uri to get deployment status of the queue manager."
  value       = local.create_queue_manager ? module.queue_manager[0].status_uri : data.ibm_mqcloud_queue_manager.queue_manager[0].queue_managers[0].status_uri
}

output "queue_manager_upgrade_available" {
  description = "Describes whether an upgrade is available for this queue manager."
  value       = local.create_queue_manager ? module.queue_manager[0].upgrade_available : data.ibm_mqcloud_queue_manager.queue_manager[0].queue_managers[0].upgrade_available
}

output "queue_manager_web_console_url" {
  description = "The url through which to access the web console for this queue manager."
  value       = local.create_queue_manager ? module.queue_manager[0].web_console_url : data.ibm_mqcloud_queue_manager.queue_manager[0].queue_managers[0].web_console_url
}
