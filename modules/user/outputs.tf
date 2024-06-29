########################################################################################################################
# Outputs
########################################################################################################################

output "id" {
  description = "The unique identifier of the user."
  value       = resource.ibm_mqcloud_user.user.id
}

output "href" {
  description = "The URL for the user details."
  value       = resource.ibm_mqcloud_user.user.href
}

output "user_id" {
  description = "The ID of the user which was allocated on creation, and can be used for delete calls"
  value       = resource.ibm_mqcloud_user.user.user_id
}
