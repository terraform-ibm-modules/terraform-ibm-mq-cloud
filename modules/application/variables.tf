########################################################################################################################
# Input Variables
########################################################################################################################

variable "name" {
  description = "The name of the application."
  type        = string
}

variable "service_instance_guid" {
  description = "The GUID that uniquely identifies the MQ on Cloud service instance."
  type        = string
}
