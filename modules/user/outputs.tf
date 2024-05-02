########################################################################################################################
# Outputs
########################################################################################################################

output "id" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_user.user.id
}

output "user_id" {
  description = "URL to application. Depending on visibility this is accessible publicly or in the private network only."
  value       = resource.ibm_mqcloud_user.user.user_id
}

output "href" {
  description = "URL to application that is only visible within the project."
  value       = resource.ibm_mqcloud_user.user.href
}
