########################################################################################################################
# Input Variables
########################################################################################################################

variable "email" {
  description = "The email of the user."
  type        = string
}

variable "name" {
  description = "The shortname of the user that will be used as the IBM MQ administrator in interactions with a queue manager for this service instance."
  type        = string
}

variable "service_instance_crn" {
  description = "The CRN that uniquely identifies the MQ on Cloud deployment service instance."
  type        = string
}
