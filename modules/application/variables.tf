########################################################################################################################
# Input Variables
########################################################################################################################

variable "name" {
  description = "The name of the application."
  type        = string
}

variable "service_instance_crn" {
  description = "The CRN that uniquely identifies the MQ on Cloud deployment service instance."
  type        = string
}
