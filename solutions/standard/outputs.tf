########################################################################################################################
# Outputs
########################################################################################################################

# MQ on Cloud capacity instance
output "capacity_crn" {
  description = "MQ on Cloud capacity service instance CRN."
  value       = var.existing_mq_capacity_crn
}

# MQ on Cloud deployment instance
output "deployment_crn" {
  description = "MQ on Cloud deployment service instance CRN."
  value       = local.mq_deployment_crn
}

output "location" {
  description = "First location available on the MQ on Cloud deployment."
  value       = local.location
}

# MQ on Cloud queue manager

output "queue_manager_name" {
  description = "Queue manager name."
  value       = local.queue_manager_name
}

output "queue_manager_administrator_api_endpoint_url" {
  description = "The url through which to access the Admin REST APIs for this queue manager."
  value       = local.queue_manager_administrator_api_endpoint_url
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
  value       = local.queue_manager_href
}

output "queue_manager_id" {
  description = "The ID of the queue manager which was allocated on creation, and can be used for delete calls."
  value       = local.queue_manager_id
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

output "connection_admin_channel_name" {
  description = "The queue manager admin channel name"
  value       = module.experimental_connection.connection_admin_channel_name
}

output "connection_admin_host" {
  description = "The queue manager admin channel host name"
  value       = module.experimental_connection.connection_admin_host
}

output "connection_admin_port" {
  description = "The queue manager admin channel port"
  value       = module.experimental_connection.connection_admin_port
}

output "connection_admin_queue_manager_name" {
  description = "The admin channel queue manager name"
  value       = module.experimental_connection.connection_admin_queue_manager_name
}

output "connection_admin_cipherspec" {
  description = "The admin channel ciper specification"
  value       = module.experimental_connection.connection_admin_cipherspec
}

output "connection_admin_type" {
  description = "The admin channel type"
  value       = module.experimental_connection.connection_admin_type
}

output "connection_app_channel_name" {
  description = "The queue manager application channel name."
  value       = module.experimental_connection.connection_app_channel_name
}

output "connection_app_host" {
  description = "The queue manager application channel host name."
  value       = module.experimental_connection.connection_app_host
}

output "connection_app_port" {
  description = "The queue manager application channel port."
  value       = module.experimental_connection.connection_app_port
}

output "connection_app_queue_manager_name" {
  description = "The application channel queue manager name."
  value       = module.experimental_connection.connection_app_queue_manager_name
}

output "connection_app_cipherspec" {
  description = "The application channel ciper specification."
  value       = module.experimental_connection.connection_app_cipherspec
}

output "connection_app_type" {
  description = "The application channel type."
  value       = module.experimental_connection.connection_app_type
}

# MQ on Cloud application

output "application_id" {
  description = "The unique identifier of the mqcloud_application."
  value       = local.application_id
}

output "application_create_api_key_uri" {
  description = "The URI to create a new apikey for the application."
  value       = local.application_create_api_key_uri
}

output "application_href" {
  description = "The URL for this application."
  value       = local.application_href
}

# MQ on Cloud trust store certificates

output "truststore_certificate" {
  description = "The queue manager issuer certificate."
  value       = module.experimental_certificate.certificate
  sensitive   = true
}

output "truststore_certificate_errors" {
  description = "Errors relating to fetching issuer certificate."
  value       = module.experimental_certificate.errors
}

output "truststore_root_certificate" {
  description = "The queue manager root CA certificate."
  value       = module.experimental_certificate_root.certificate
  sensitive   = true
}

output "truststore_root_certificate_errors" {
  description = "Errors relating to fetching queue manager root CA certificate."
  value       = module.experimental_certificate_root.errors
}

########################################################################################################################
# Secrets
########################################################################################################################

# Ideally a CRN would be used, but secrets groups do not have them
output "secret_group_id" {
  description = "The ID of the secret group containing the MQ secrets."
  value       = var.existing_secrets_manager_crn != null && var.existing_secret_group_id == null ? module.secret_group[0].secret_group_id : null
}

output "secret_issuer_certificate_crn" {
  description = "The issue CA certificate secret CRN."
  value       = var.existing_secrets_manager_crn != null ? module.certificate_secret[0].secret_crn : null
}

output "secret_issuer_certificate_name" {
  description = "The issue CA certificate secret name."
  value       = var.existing_secrets_manager_crn != null ? local.certificate_secret_name : null
}

output "secret_root_cert_crn" {
  description = "The root CA certificate secret CRN."
  value       = var.existing_secrets_manager_crn != null ? module.root_certificate_secret[0].secret_crn : null
}

output "secret_root_cert_name" {
  description = "The root CA certificate secret name."
  value       = var.existing_secrets_manager_crn != null ? local.root_certificate_secret_name : null
}
