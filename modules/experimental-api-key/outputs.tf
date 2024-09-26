########################################################################################################################
# Outputs
########################################################################################################################

output "api_key_name" {
  description = "name"
  value       = data.external.application_apikey.result.api_key_name
}

output "api_key_id" {
  description = "name"
  value       = data.external.application_apikey.result.api_key_id
}

output "api_key" {
  description = "name"
  value       = data.external.application_apikey.result.api_key
  sensitive   = true
}
