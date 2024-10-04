########################################################################################################################
# Input Variables
########################################################################################################################

variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud API key to deploy resources."
  sensitive   = true
}

variable "href" {
  description = "The application href"
  type        = string
}

variable "key_name" {
  description = "The name to give to the api key"
  type        = string

  # This is the same as API call validation to catch the error at terraform plan
  validation {
    condition = alltrue([
      can(length(var.key_name) >= 1),
      can(length(var.key_name) <= 12),
      can(regex("^[a-z][-a-z0-9]*$", var.key_name))
    ])
    error_message = "key_name ${var.key_name} should match regex ^[a-z][-a-z0-9]*$ and be 12 or less characters"
  }
}
