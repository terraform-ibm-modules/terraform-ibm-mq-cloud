########################################################################################################################
# Outputs
########################################################################################################################

# MQ on Cloud capacity instance
output "capacity_crn" {
  value       = var.existing_mq_capacity_crn
  description = "MQ on Cloud capacity service instance CRN"
}

# MQ on Cloud deployment instance
output "deployment_crn" {
  value       = local.mq_deployment_crn
  description = "MQ on Cloud deployment service instance CRN"
}

output "location" {
  value       = local.location
  description = "First location available on the MQ on Cloud deployment"
}

# MQ on Cloud queue manager

output "queue_manager_name" {
  value       = local.create_queue_manager ? var.queue_manager_name : var.existing_queue_manager_name
  description = "Queue manager name"
}

output "queue_manager_id" {
  value       = local.create_queue_manager ? module.queue_manager[0].id : data.ibm_mqcloud_queue_manager.queue_manager[0].id
  description = "Queue manager ID"
}

# REVIEWER CHECK!!! Should all queue manager fields be output since this is a Deployable Architecture
