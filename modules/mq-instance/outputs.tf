########################################################################################################################
# Outputs
########################################################################################################################

output "crn" {
  description = "The ID of the created code engine app."
  value       = resource.ibm_resource_instance.mqcloud.crn
}

output "guid" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_resource_instance.mqcloud.guid
}
