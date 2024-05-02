########################################################################################################################
# Input Variables
########################################################################################################################

variable "service_instance_guid" {
  description = "The name of the app."
  type        = string
}

variable "display_name" {
  description = "The name of the app."
  type        = string
}

variable "location" {
  description = "The name of the app."
  type        = string
}

variable "name" {
  description = "The name of the app."
  type        = string
}

variable "size" {
  description = "The name of the app."
  type        = string
  default     = "lite"
  validation {
    condition     = contains(["lite", "xsmall", "small", "medium", "large"], var.size)
    error_message = "The specified `size` is not a valid selection, choose from `lite`, `xsmall`, `small`, `medium`, `large`."
  }
}

# version is reserved attribute on modules
variable "queue_manager_version" {
  description = "The name of the app."
  type        = string
  default     = "9.3.2_2"
}
