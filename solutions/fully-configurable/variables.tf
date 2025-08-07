########################################################################################################################
# Input variables
########################################################################################################################

variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud API key to deploy resources."
  sensitive   = true
}

variable "secrets_manager_ibmcloud_api_key" {
  type        = string
  description = "API key to authenticate on Secrets Manager instance. If null the ibmcloud_api_key will be used."
  default     = null
}

variable "provider_visibility" {
  description = "Set the visibility value for the IBM terraform provider. Supported values are `public`, `private`, `public-and-private`. [Learn more](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/guides/custom-service-endpoints)."
  type        = string
  default     = "public" # forcing provider visibility to public due to temporary provider problem

  validation {
    condition     = contains(["public", "private", "public-and-private"], var.provider_visibility)
    error_message = "Invalid visibility option. Allowed values are 'public', 'private', or 'public-and-private'."
  }
}

variable "region" {
  type        = string
  description = "The region to provision all resources in. [Learn more](https://terraform-ibm-modules.github.io/documentation/#/region) about how to select different regions for different services."
  default     = "us-east"

  validation {
    condition     = contains(["eu-gb", "us-east"], var.region)
    error_message = "Invalid value for `region`, valid values for MQ on Cloud offering are: `eu-gb`, `us-east`"
  }
}

variable "prefix" {
  type        = string
  nullable    = true
  description = "The prefix to be added to all resources created by this solution. To skip using a prefix, set this value to null or an empty string. The prefix must begin with a lowercase letter and may contain only lowercase letters, digits, and hyphens '-'. It should not exceed 16 characters, must not end with a hyphen('-'), and can not contain consecutive hyphens ('--'). Example: prod-0205-mq. [Learn more](https://terraform-ibm-modules.github.io/documentation/#/prefix.md)."

  validation {
    # - null and empty string is allowed
    # - Must not contain consecutive hyphens (--): length(regexall("--", var.prefix)) == 0
    # - Starts with a lowercase letter: [a-z]
    # - Contains only lowercase letters (a–z), digits (0–9), and hyphens (-)
    # - Must not end with a hyphen (-): [a-z0-9]
    condition = (var.prefix == null || var.prefix == "" ? true :
      alltrue([
        can(regex("^[a-z][-a-z0-9]*[a-z0-9]$", var.prefix)),
        length(regexall("--", var.prefix)) == 0
      ])
    )
    error_message = "Prefix must begin with a lowercase letter and may contain only lowercase letters, digits, and hyphens '-'. It must not end with a hyphen('-'), and cannot contain consecutive hyphens ('--')."
  }

  validation {
    # must not exceed 16 characters in length
    condition     = var.prefix == null || var.prefix == "" ? true : length(var.prefix) <= 16
    error_message = "Prefix must not exceed 16 characters."
  }
}

variable "existing_resource_group_name" {
  type        = string
  description = "The name of an existing resource group to provision the resources. If not provided the default resource group will be used."
  default     = null
  nullable    = true

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
  validation {
    condition     = var.queue_manager_name == null || can(regex("^([\\w_]+)\\w$", var.queue_manager_name))
    error_message = "The value of queue_manager_name, if not null, must contain only alphanumerical characters and \"_\" matching this regular expression ^([\\w_]+)\\w$ "
  }
  validation {
    condition     = var.existing_queue_manager_name == null && var.queue_manager_name == null ? false : true
    error_message = "The values of var.existing_queue_manager_name and var.queue_manager_name cannot be null at the same time."
  }
}

variable "existing_queue_manager_name" {
  type        = string
  description = "The name of an existing queue manager."
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
