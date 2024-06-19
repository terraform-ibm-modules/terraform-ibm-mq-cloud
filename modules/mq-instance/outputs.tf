########################################################################################################################
# Outputs
########################################################################################################################

output "capacity_crn" {
  description = "The CRN of the created MQ on Cloud capacity instance."
  value       = var.existing_mq_capacity_guid != null ? null : resource.ibm_resource_instance.mqcloud_capacity[0].crn
}

output "capacity_guid" {
  description = "The unique identifier of the created MQ on Cloud capacity instance."
  value       = var.existing_mq_capacity_guid != null ? null : resource.ibm_resource_instance.mqcloud_capacity[0].guid
}

output "deployment_crn" {
  description = "The CRN of the created MQ on Cloud deployment instance."
  value       = resource.ibm_resource_instance.mqcloud_deployment.crn
}

output "deployment_guid" {
  description = "The unique identifier of the created MQ on Cloud deployment instance."
  value       = resource.ibm_resource_instance.mqcloud_deployment.guid
}

output "queue_manager_options" {
  description = "The deployment service instance queue manager options."
  value       = data.ibm_mqcloud_queue_manager_options.options
}
