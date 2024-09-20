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
  default     = "us-south"
}

variable "prefix" {
  type        = string
  description = "Prefix to append to all resources created by this example"
  default     = "adv"
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
  description = "The CRN of an existing capacity service instance, if not specifed, a new capacity plan will be created"
}

variable "keystore_certificate" {
  type        = string
  description = "Base64 encoded string containing keystore certificate"
  default     = null
  sensitive   = true
}

variable "truststore_certificate" {
  type        = string
  description = "Base64 encoded string containing truststore certificate"
  default     = null
  sensitive   = true
}
