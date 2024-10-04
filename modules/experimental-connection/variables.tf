########################################################################################################################
# Input Variables
########################################################################################################################

variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud API key to deploy resources"
  sensitive   = true
}

variable "href" {
  description = "The queue manager connection href"
  type        = string
}
