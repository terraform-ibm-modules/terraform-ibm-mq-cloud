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

#variable "service_plan" {
#  type        = string
#  description = "The MQ on Cloud plan to provision."
#  default     = "xsmall"
#}

variable "tags" {
  type        = list(string)
  description = "The list of resource tags that you want to associate with your MQ on Cloud instance."
  default     = []
}

variable "existing_mq_capacity_guid" {
  type        = string
  description = "The GUID of an existing capacity service instance, if not specifed, a new capacity plan will be created"
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
  description = "The locations in which the queue manager could be deployed."
  type        = string
}

variable "queue_manager_name" {
  type        = string
  description = "A queue manager name conforming to MQ restrictions. 1 to 48 characters matching regular expression '/^[a-zA-Z0-9._]*$/' ."
}

variable "queue_manager_size" {
  description = "The queue manager deployment sizes. Valid values are `xsmall`, `small`, `medium`, `large` ."
  type        = string
  default     = "xsmall"
}

variable "queue_manager_version" {
  description = "The MQ version of the queue manager."
  type        = string
  default     = "9.3.2_2"
}

########################################################################################################################
# Input Variables
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
