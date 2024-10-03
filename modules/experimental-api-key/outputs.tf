########################################################################################################################
# Outputs
########################################################################################################################

output "api_key_name" {
  description = "MQ on Cloud application API key name"
  value       = local.api_key_name
}

output "api_key_id" {
  description = "MQ on Cloud application API key id"
  value       = local.api_key_id
}

output "api_key" {
  description = "MQ on Cloud application API key (sensitive)"
  value       = local.api_key
  sensitive   = true
}
