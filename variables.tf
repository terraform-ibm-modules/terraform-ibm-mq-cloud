########################################################################################################################
# Input Variables
########################################################################################################################

variable "resource_group_id" {
  type        = string
  description = "The ID of the resource group where the IBM MQ on Cloud instance is created."
}

variable "region" {
  type        = string
  description = "The IBM Cloud region where the IBM MQ on Cloud instance is created."
}

variable "name" {
  type        = string
  description = "The name to give the IBM MQ on Cloud instance."
}

variable "tags" {
  type        = list(string)
  description = "The list of resource tags to add to your IBM MQ on Cloud instance."
  default     = []
}

variable "existing_mq_capacity_crn" {
  type        = string
  description = "The CRN of an existing capacity service instance. If no CRN is specifiied, a new capacity plan is created."
  default     = null
}

variable "subscription_id" {
  type        = string
  description = "An IBM MQ on Cloud subscription plan ID for customers who purchased a subscription through an IBM sales representative."
  default     = null
}

########################################################################################################################
# Queue Manager Variables
########################################################################################################################

variable "queue_manager_display_name" {
  description = "A displayable name for the queue manager."
  type        = string
}

variable "queue_manager_location" {
  description = "The location in which the queue manager is deployed. Defaults to using the first location in the created service instance."
  type        = string
  default     = null
}

variable "queue_manager_name" {
  type        = string
  description = "A queue manager name conforming to IBM MQ on Cloud restrictions. 1 to 48 characters matching regular expression `'/^[a-zA-Z0-9._]*$/'` ."
}

variable "queue_manager_size" {
  description = "The queue manager deployment sizes. Valid values are `xsmall`, `small`, `medium`, or `large` ."
  type        = string
  default     = "xsmall"
}

variable "queue_manager_version" {
  description = "The IBM MQ on Cloud version of the queue manager. If set to `null`, the latest available version is used."
  type        = string
  default     = null
}

########################################################################################################################
# Resource Variables
########################################################################################################################

variable "applications" {
  description = "A map of IBM MQ on Cloud applications to be created."
  type = map(object({
    name = string
  }))
  default = {}
}

variable "keystore_certificates" {
  description = "A map of IBM MQ on Cloud keystore certificates to be created."
  type = map(object({
    certificate = string
    label       = string
  }))
  default = {}
}

variable "truststore_certificates" {
  description = "A map of IBM MQ on Cloud truststore certificates to be created."
  type = map(object({
    certificate = string
    label       = string
  }))
  default = {}
}

variable "users" {
  description = "A map of IBM MQ on Cloud users to be created."
  type = map(object({
    email = string
    name  = string
  }))
  default = {}
}
