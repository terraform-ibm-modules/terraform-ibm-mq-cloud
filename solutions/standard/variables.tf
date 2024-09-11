########################################################################################################################
# Input variables
########################################################################################################################

variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud API key to deploy resources."
  sensitive   = true
}

variable "region" {
  type        = string
  description = "Region to provision new resources created by this solution."
  default     = "us-east"
}

variable "prefix" {
  type        = string
  description = "Prefix to add to all resources created by this solution."
  default     = null
}

variable "resource_group_name" {
  type        = string
  description = "The name of a new or an existing resource group to provision the MQ on Cloud resources in. If a prefix input variable is specified, the prefix is added to the name in the `<prefix>-<name>` format."
}

variable "use_existing_resource_group" {
  type        = bool
  description = "Whether to use an existing resource group."
  default     = false
}

########################################################################################################################
# MQ on Cloud capacity instance
########################################################################################################################

variable "existing_mq_capacity_crn" {
  type        = string
  description = "The CRN of an existing MQ on Cloud capacity service instance."
}

########################################################################################################################
# MQ on Cloud deployment instance
########################################################################################################################

variable "deployment_name" {
  type        = string
  description = "The name to be given to the MQ on Cloud deployment instance."
  default     = null
}

variable "existing_mq_deployment_crn" {
  type        = string
  description = "The CRN of an existing MQ on Cloud deployment service instance. If no value is specified, a new instance is created."
  default     = null
}

########################################################################################################################
# MQ on Cloud queue manager
########################################################################################################################

variable "queue_manager_name" {
  type        = string
  description = "The name to be given to the queue manager."
  default     = null
}

variable "queue_manager_display_name" {
  type        = string
  description = "The display name to be given to the queue manager."
  default     = null
}

variable "queue_manager_size" {
  description = "The queue manager sizes. Valid values are `xsmall`, `small`, `medium`, `large`."
  type        = string
  default     = "xsmall"
  validation {
    condition     = contains(["xsmall", "small", "medium", "large"], var.queue_manager_size)
    error_message = "The specified `size` is not a valid selection, choose from `xsmall`, `small`, `medium`, `large`."
  }
}

variable "existing_queue_manager_name" {
  type        = string
  description = "The name of an existing queue manager."
  default     = null
}
