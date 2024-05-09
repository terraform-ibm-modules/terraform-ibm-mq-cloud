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
#  default     = "lite"
#}

variable "tags" {
  type        = list(string)
  description = "The list of resource tags that you want to associate with your MQ on Cloud instance."
  default     = []
}

variable "existing_mq_instance_id" {
  type        = string
  description = "Ex"
  default     = null
}

########################################################################################################################
# Queue Manager Variables
########################################################################################################################

variable "queue_manager_name" {
  type        = string
  description = "ex"
}

variable "queue_manager_display_name" {
  description = "The name of the app."
  type        = string
}

variable "queue_manager_location" {
  description = "The name of the app."
  type        = string
}

variable "queue_manager_size" {
  description = "The name of the app."
  type        = string
  default     = "lite"
}

variable "queue_manager_version" {
  description = "The name of the app."
  type        = string
  default     = "9.3.2_2"
}


########################################################################################################################
# Input Variables
########################################################################################################################

variable "applications" {
  description = "A map of code engine domain mappings to be created."
  type = map(object({
    name = string
  }))
  default = {}
}

variable "keystore_certificates" {
  description = "A map of code engine domain mappings to be created."
  type = map(object({
    certificate = string
    label       = string
  }))
  default = {}
}

variable "truststore_certificates" {
  description = "A map of code engine domain mappings to be created."
  type = map(object({
    certificate = string
    label       = string
  }))
  default = {}
}

variable "users" {
  description = "A map of code engine domain mappings to be created."
  type = map(object({
    email = string
    name  = string
  }))
  default = {}
}
