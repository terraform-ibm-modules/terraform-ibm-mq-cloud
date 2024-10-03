##############################################################################
# terraform-ibm-mq-cloud
#
# Create an MQ on Cloud application api key
##############################################################################

locals {
  api_key_href = "${var.href}/api_key"
}

# terraform_data is as a do-nothing container for arbitrary actions taken by a provisioner.
# Redirect standard output to a file
resource "terraform_data" "bootstrap_api_key" {
  triggers_replace = []

  provisioner "local-exec" {
    command = "../../modules/experimental-api-key/curlly.sh \"${var.ibmcloud_api_key}\" \"${var.key_name}\" \"${local.api_key_href}\" > bootstrap_api_key.txt"
  }
}

# Sensitively read output
data "local_sensitive_file" "bootstrap_api_key" {
  filename = "bootstrap_api_key.txt"

  depends_on = [resource.terraform_data.bootstrap_api_key]
}

# Find values in JSON, retaining sensitive on api_key
locals {
  api_key      = regexall("(.*api_key\":\")([0-9a-zA-Z_]*)", data.local_sensitive_file.bootstrap_api_key.content)[0][1]
  api_key_id   = nonsensitive(regexall("(.*api_key_id\":\")([0-9a-fApiKey-]*)", data.local_sensitive_file.bootstrap_api_key.content)[0][1])
  api_key_name = nonsensitive(regexall("(.*api_key_name\":\")([0-9a-zA-Z-_]*)", data.local_sensitive_file.bootstrap_api_key.content)[0][1])
}
