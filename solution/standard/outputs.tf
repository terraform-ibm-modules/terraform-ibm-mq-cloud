########################################################################################################################
# Outputs
########################################################################################################################

output "capacity_crn" {
  value       = local.mq_capacity_crn
  description = "MQ on Cloud capacity service instance CRN"
}

#output "deployment_crn" {
#  value       = local.mq_deployment_crn
#  description = "MQ on Cloud deployment service instance CRN"
#}

output "location" {
  value       = "temporary" #module.mqcloud_instance.queue_manager_options.locations[0]
  description = "First location available on the MQ on Cloud deployment"
}
