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
