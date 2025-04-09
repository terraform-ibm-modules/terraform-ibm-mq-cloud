########################################################################################################################
# Outputs
########################################################################################################################

output "connection_admin_channel_name" {
  description = "Channel name of the admin channel"
  value       = can(data.external.connection.result.channel_0_name) ? data.external.connection.result.channel_0_name : null
}

output "connection_admin_host" {
  description = "Host name of the admin channel"
  value       = can(data.external.connection.result.channel_0_clientConnection_connection_0_host) ? data.external.connection.result.channel_0_clientConnection_connection_0_host : null
}

output "connection_admin_port" {
  description = "Port of of the admin channel"
  value       = can(data.external.connection.result.channel_0_clientConnection_connection_0_port) ? data.external.connection.result.channel_0_clientConnection_connection_0_port : null
}

output "connection_admin_queue_manager_name" {
  description = "Queue manager name of the admin channel"
  value       = can(data.external.connection.result.channel_0_clientConnection_queueManager) ? data.external.connection.result.channel_0_clientConnection_queueManager : null
}

output "connection_admin_cipherspec" {
  description = "Cipher specification of the admin channel"
  value       = can(data.external.connection.result.channel_0_transmissionSecurity_cipherSpecification) ? data.external.connection.result.channel_0_transmissionSecurity_cipherSpecification : null
}

output "connection_admin_type" {
  description = "Connection type of the admin channel"
  value       = can(data.external.connection.result.channel_0_type) ? data.external.connection.result.channel_0_type : null
}

output "connection_app_channel_name" {
  description = "Channel name of the application channel"
  value       = can(data.external.connection.result.channel_1_name) ? data.external.connection.result.channel_1_name : null
}

output "connection_app_host" {
  description = "Host name of the application channel"
  value       = can(data.external.connection.result.channel_1_clientConnection_connection_0_host) ? data.external.connection.result.channel_1_clientConnection_connection_0_host : null
}

output "connection_app_port" {
  description = "Port of the application channel"
  value       = can(data.external.connection.result.channel_1_clientConnection_connection_0_port) ? data.external.connection.result.channel_1_clientConnection_connection_0_port : null
}

output "connection_app_queue_manager_name" {
  description = "Queue manager name of the application channel"
  value       = can(data.external.connection.result.channel_1_clientConnection_queueManager) ? data.external.connection.result.channel_1_clientConnection_queueManager : null
}

output "connection_app_cipherspec" {
  description = "Cipher specification of the application channel"
  value       = can(data.external.connection.result.channel_1_transmissionSecurity_cipherSpecification) ? data.external.connection.result.channel_1_transmissionSecurity_cipherSpecification : null
}

output "connection_app_type" {
  description = "Connection type of the application channel"
  value       = can(data.external.connection.result.channel_1_type) ? data.external.connection.result.channel_1_type : null
}

output "errors" {
  description = "Diagnostics of any errors reported by during the lookup process"
  value       = can(data.external.connection.result.status_code) ? data.external.connection.result : null
}
