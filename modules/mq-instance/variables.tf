########################################################################################################################
# Input Variables
########################################################################################################################

variable "resource_group_id" {
  type        = string
  description = "The ID of the resource group to provision the MQ on Cloud instance to."
}

variable "region" {
  type        = string
  description = "The region to provision the MQ on Cloud instance to."
}

variable "name" {
  type        = string
  description = "The name to give the MQ on Cloud instance."
}

variable "tags" {
  type        = list(string)
  description = "The list of resource tags that you want to associate with your MQ on Cloud instance."
  default     = []
}

variable "existing_mq_capacity_crn" {
  type        = string
  description = "The CRN of an existing capacity service instance, if not specified, a new capacity plan will be created."
  default     = null

  validation {
    condition     = (var.existing_mq_capacity_crn != null && var.subscription_id == null) || (var.existing_mq_capacity_crn == null && var.subscription_id != null)
    error_message = "Exactly one of 'existing_mq_capacity_crn' or 'subscription_id' is required."
  }
}

variable "subscription_id" {
  type        = string
  description = "The MQ on Cloud subscription id. Required if `existing_mq_capacity_crn` is not specified."
  default     = null
}
