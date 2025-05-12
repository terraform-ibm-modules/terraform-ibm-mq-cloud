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
  description = "Prefix to add to all resources created by this deployable architecture. To not use any prefix value, you can set this value to `null` or an empty string."
}

variable "existing_resource_group_name" {
  type        = string
  description = "The name of the existing resource group in which to provision resources to."
  default     = "Default"
  nullable    = false
}

variable "resource_tags" {
  type        = list(string)
  description = "A list of tags to associate with any MQ on Cloud instances created."
  default     = []
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
  default     = "mqcloud"
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

########################################################################################################################
# MQ on Cloud application
########################################################################################################################

variable "application_name" {
  type        = string
  description = "The name to be given to the application."
  default     = null
}

variable "existing_application_name" {
  type        = string
  description = "The name of an existing application."
  default     = null
}

########################################################################################################################
# MQ on Cloud user
########################################################################################################################

variable "user_name" {
  type        = string
  description = "The name to be given to the user."
  default     = null
}

variable "user_email" {
  type        = string
  description = "The email address to given to the new user."
  default     = null
}

########################################################################################################################
# Secrets Manager - in which to store the queue manager certificate and optionally store application keys
########################################################################################################################

variable "existing_secrets_manager_crn" {
  type        = string
  description = "The CRN of a secrets manager to store secrets.name of an existing application."
  default     = null
}

variable "secrets_manager_endpoint_type" {
  type        = string
  description = "The type of endpoint to use for communicating with the provided Secrets Manager instance. Possible values are `public` or `private`. Applies only if `existing_secrets_manager_crn` is set."
  default     = "private"
  validation {
    condition     = contains(["public", "private"], var.secrets_manager_endpoint_type)
    error_message = "The secrets_manager_endpoint_type value must be 'public' or 'private'."
  }
}

variable "existing_secret_group_id" {
  type        = string
  description = "The ID of an existing secret group to store any new secrets in."
  default     = null
}

variable "secret_group_name" {
  type        = string
  description = "The name of a secret group to create to store any new secrets in."
  default     = null
}
