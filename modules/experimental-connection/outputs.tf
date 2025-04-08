########################################################################################################################
# Outputs
########################################################################################################################

output "connection_admin_channel_name" {
  description = "Channel name of the admin channel"
  value       = data.external.connection.result.channel_0_name
}

output "connection_admin_host" {
  description = "Host name of the admin channel"
  value       = data.external.connection.result.channel_0_clientConnection_connection_0_host
}

output "connection_admin_port" {
  description = "Port of of the admin channel"
  value       = data.external.connection.result.channel_0_clientConnection_connection_0_port
}

output "connection_admin_queue_manager_name" {
  description = "Queue manager name of the admin channel"
  value       = data.external.connection.result.channel_0_clientConnection_queueManager
}

output "connection_admin_cipherspec" {
  description = "Cipher specification of the admin channel"
  value       = data.external.connection.result.channel_0_transmissionSecurity_cipherSpecification
}

output "connection_admin_type" {
  description = "Connection type of the admin channel"
  value       = data.external.connection.result.channel_0_type
}

output "connection_app_channel_name" {
  description = "Channel name of the application channel"
  value       = data.external.connection.result.channel_1_name
}

output "connection_app_host" {
  description = "Host name of the application channel"
  value       = data.external.connection.result.channel_1_clientConnection_connection_0_host
}

output "connection_app_port" {
  description = "Port of the application channel"
  value       = data.external.connection.result.channel_1_clientConnection_connection_0_port
}

output "connection_app_queue_manager_name" {
  description = "Queue manager name of the application channel"
  value       = data.external.connection.result.channel_1_clientConnection_queueManager
}

output "connection_app_cipherspec" {
  description = "Cipher specification of the application channel"
  value       = data.external.connection.result.channel_1_transmissionSecurity_cipherSpecification
}

output "connection_app_type" {
  description = "Connection type of the application channel"
  value       = data.external.connection.result.channel_1_type
}

output "errors" {
  description = "Diagnostics of any errors reported by during the lookup process"
  value       = data.external.connection.result.errors
}
