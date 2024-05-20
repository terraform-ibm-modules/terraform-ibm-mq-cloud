########################################################################################################################
# Outputs
########################################################################################################################

output "service_instance_capacity_guid" {
  description = "Description of my output"
  value       = local.capacity_guid
}

output "service_instance_deployment_guid" {
  description = "Description of my output"
  value       = local.deployment_guid
}

output "queue_manager_id" {
  description = "Description of my output"
  value       = module.queue_manager.id
}
