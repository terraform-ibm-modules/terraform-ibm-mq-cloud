########################################################################################################################
# Outputs
########################################################################################################################

output "service_instance_guid" {
  description = "Description of my output"
  value       = local.mqcloud_guid
}

output "queue_manager_id" {
  description = "Description of my output"
  value       = module.queue_manager.id
}
