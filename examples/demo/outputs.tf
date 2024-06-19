########################################################################################################################
# Outputs
########################################################################################################################

output "result" {
  value       = data.external.location.result
  description = "Result (JSON) from external location call"
}

output "deployment" {
  value       = module.mqcloud_instance.deployment_guid
  description = "Deployment UID"
}

output "location" {
  value       = module.mqcloud_instance.queue_manager_options #.locations[0]
  description = "First location available on the MQ on Cloud deployment"
}
