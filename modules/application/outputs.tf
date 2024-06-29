########################################################################################################################
# Outputs
########################################################################################################################

output "id" {
  description = "The unique identifier of the mqcloud_application."
  value       = resource.ibm_mqcloud_application.mqcloud_application.id
}

output "application_id" {
  description = "The ID of the application which was allocated on creation, and can be used for delete calls"
  value       = resource.ibm_mqcloud_application.mqcloud_application.application_id
}

output "create_api_key_uri" {
  description = "The URI to create a new apikey for the application."
  value       = resource.ibm_mqcloud_application.mqcloud_application.create_api_key_uri
}

output "href" {
  description = "The URL for this application."
  value       = resource.ibm_mqcloud_application.mqcloud_application.href
}
