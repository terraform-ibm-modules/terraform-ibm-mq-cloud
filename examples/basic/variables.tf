########################################################################################################################
# Input variables
########################################################################################################################

variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud API Key"
  sensitive   = true
}

variable "region" {
  type        = string
  description = "Region to provision all resources created by this example"
  default     = "us-east"
}

variable "prefix" {
  type        = string
  description = "Prefix to append to all resources created by this example"
  default     = "basic"
}

variable "resource_group" {
  type        = string
  description = "The name of an existing resource group to provision resources in to. If not set a new resource group will be created using the prefix variable"
  default     = null
}

variable "resource_tags" {
  type        = list(string)
  description = "Optional list of tags to be added to created resources"
  default     = []
}

variable "existing_mq_capacity_crn" {
  type        = string
  description = "The CRN of an existing capacity service instance, if not specified, a new capacity plan will be created"
  default     = null
}

variable "subscription_id" {
  type        = string
  description = "An MQ on Cloud subscsription plan id for customers who have purchased a subscription through an IBM sales representative"
  default     = null
}

# tflint 0.55.1 has an issue https://github.com/terraform-linters/tflint/issues/2243
# Remove certificate features until it is resolved
#variable "keystore_certificate" {
#  type        = string
#  description = "Base64 encoded string containing keystore certificate"
#  default     = null
#  sensitive   = true
#}

#variable "truststore_certificate" {
#  type        = string
#  default     = null
#  description = "Base64 encoded string containing truststore certificate"
#  sensitive   = true
#}
