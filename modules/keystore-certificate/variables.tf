########################################################################################################################
# Input Variables
########################################################################################################################

variable "certificate" {
  description = "A base64 encoded string contain a PEM certificate chain."
  type        = string
}

variable "label" {
  description = "The label to use for the certificate to be uploaded."
  type        = string
}

variable "queue_manager_id" {
  description = "The id of the queue manager."
  type        = string
}

variable "service_instance_guid" {
  description = "The GUID that uniquely identifies the MQ on Cloud service instance."
  type        = string
}
