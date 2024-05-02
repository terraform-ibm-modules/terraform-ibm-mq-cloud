########################################################################################################################
# Outputs
########################################################################################################################

output "id" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_application.mqcloud_application.id
}

output "application_id" {
  description = "URL to application. Depending on visibility this is accessible publicly or in the private network only."
  value       = resource.ibm_mqcloud_application.mqcloud_application.application_id
}

output "create_api_key_uri" {
  description = "URL to application that is only visible within the project."
  value       = resource.ibm_mqcloud_application.mqcloud_application.create_api_key_uri
}

output "href" {
  description = "The name of the created code engine app."
  value       = resource.ibm_mqcloud_application.mqcloud_application.href
}
