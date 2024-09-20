########################################################################################################################
# Outputs
########################################################################################################################

output "service_instance_capacity_crn" {
  description = "The CRN of the MQ on Cloud capacity service instance"
  value       = local.capacity_crn
}

output "service_instance_capacity_guid" {
  description = "The GUID of the MQ on Cloud capacity service instance"
  value       = local.capacity_guid
}

output "service_instance_deployment_crn" {
  description = "The CRN of the MQ on Cloud deployment service instance"
  value       = local.deployment_crn
}

output "service_instance_deployment_guid" {
  description = "The GUID of the MQ on Cloud deployment service instance"
  value       = local.deployment_guid
}

output "queue_manager_id" {
  description = "The ID of the MQ on Cloud queue manager"
  value       = module.queue_manager.id
}

output "queue_manager_options" {
  value       = module.mqcloud_instance.queue_manager_options
  description = "Queue manager options for the MQ on Cloud deployment service instance"
}
