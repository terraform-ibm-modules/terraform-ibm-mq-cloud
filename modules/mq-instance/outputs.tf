########################################################################################################################
# Outputs
########################################################################################################################

output "capacity_crn" {
  description = "The CRN of the created MQ on Cloud capacity instance."
  value       = resource.ibm_resource_instance.mqcloud_capacity.crn
}

output "capacity_guid" {
  description = "The unique identifier of the created MQ on Cloud capacity instance."
  value       = resource.ibm_resource_instance.mqcloud_capacity.guid
}

output "deployment_crn" {
  description = "The CRN of the created MQ on Cloud deployment instance."
  value       = resource.ibm_resource_instance.mqcloud_deployment.crn
}

output "deployment_guid" {
  description = "The unique identifier of the created MQ on Cloud deployment instance."
  value       = resource.ibm_resource_instance.mqcloud_deployment.guid
}
