########################################################################################################################
# Outputs
########################################################################################################################

output "options" {
  value       = module.mq_on_cloud.queue_manager_options
  description = "Queue manager options for the MQ on Cloud deployment"
}
