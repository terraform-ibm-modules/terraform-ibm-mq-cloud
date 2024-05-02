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

# The service does not support terraform on the `lite` plan
# To list plans:
# ibmcloud catalog service mqcloud
# lite, default, custom, reserved-capacity, reserved-deployment
variable "service_plan" {
  type        = string
  description = "The MQ on Cloud plan to provision."
  default     = "custom"
  #validation {
  #  condition     = contains(["lite", "default", "custom", "reservered-capacity", "reserved-deployment"], var.service_plan)
  #  error_message = "The specified service_plan is not a valid selection!"
  #}
}

variable "tags" {
  type        = list(string)
  description = "The list of resource tags that you want to associate with your MQ on Cloud instance."
  default     = []
}
