########################################################################################################################
# Outputs
########################################################################################################################

output "connection_admin_channel_name" {
  description = "name"
  value       = data.external.connection.result.channel_0_name
}

output "connection_admin_host" {
  description = "name"
  value       = data.external.connection.result.channel_0_clientConnection_connection_0_host
}

output "connection_admin_port" {
  description = "name"
  value       = data.external.connection.result.channel_0_clientConnection_connection_0_port
}

output "connection_admin_queue_manager_name" {
  description = "name"
  value       = data.external.connection.result.channel_0_clientConnection_queueManager
}

output "connection_admin_cipherspec" {
  description = "name"
  value       = data.external.connection.result.channel_0_transmissionSecurity_cipherSpecification
}

output "connection_admin_type" {
  description = "name"
  value       = data.external.connection.result.channel_0_type
}

output "connection_app_channel_name" {
  description = "name"
  value       = data.external.connection.result.channel_1_name
}

output "connection_app_host" {
  description = "name"
  value       = data.external.connection.result.channel_1_clientConnection_connection_0_host
}

output "connection_appin_port" {
  description = "name"
  value       = data.external.connection.result.channel_1_clientConnection_connection_0_port
}

output "connection_app_queue_manager_name" {
  description = "name"
  value       = data.external.connection.result.channel_1_clientConnection_queueManager
}

output "connection_app_cipherspec" {
  description = "name"
  value       = data.external.connection.result.channel_1_transmissionSecurity_cipherSpecification
}

output "connection_app_type" {
  description = "name"
  value       = data.external.connection.result.channel_1_type
}
