########################################################################################################################
# Input Variables
########################################################################################################################

variable "display_name" {
  description = "A displayable name for the queue manager."
  type        = string
}

variable "location" {
  description = "The locations in which the queue manager would be deployed."
  type        = string
}

variable "name" {
  description = "A queue manager name conforming to MQ restrictions. 1 to 48 characters matching regular expression '/^[a-zA-Z0-9._]*$/' ."
  type        = string
}

# version is reserved attribute on modules
variable "queue_manager_version" {
  description = "The MQ version of the queue manager. If null, use the latest available"
  type        = string
  default     = null
}

variable "service_instance_crn" {
  description = "The CRN that uniquely identifies the MQ on Cloud deployment service instance."
  type        = string
}

variable "size" {
  description = "The queue manager deployment sizes. Valid values are `xsmall`, `small`, `medium`, `large`."
  type        = string
  default     = "xsmall"
  validation {
    condition     = contains(["xsmall", "small", "medium", "large"], var.size)
    error_message = "The specified `size` is not a valid selection, choose from `xsmall`, `small`, `medium`, `large`."
  }
}
