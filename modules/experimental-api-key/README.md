# MQ on Cloud API Key

This is an experimental module to extend the [application module](../application). This module uses the application create_api_key_uri to return an application user name and password.

[Learn more](https://cloud.ibm.com/docs/mqcloud?topic=mqcloud-users_and_apps)

This module is problematic in some environments. A temporary step during the provisioning of the key writes to a file. This file has to be retained from one terraform command to another. This means pipeline environments, such as IBM Cloud schematics, which use a clean environment for each run will fail after the first apply.

### Usage

```hcl
module "application_api_key" {
  source               = "terraform-ibm-modules/mq-cloud/ibm//modules/experimental-api-key"
  version              = "X.X.X"  # Replace "X.X.X" with a release version to lock into a specific release
  ibmcloud_api_key     = "IBM Cloud Api Key"   # pragma: allowlist secret
  key_name             = "my-application-key"
  href                 = module.<application>.href
}
```

<!-- The following content is automatically populated by the pre-commit hook -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 2.5.2 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [terraform_data.bootstrap_api_key](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |
| [local_sensitive_file.bootstrap_api_key](https://registry.terraform.io/providers/hashicorp/local/latest/docs/data-sources/sensitive_file) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_href"></a> [href](#input\_href) | The application href | `string` | n/a | yes |
| <a name="input_ibmcloud_api_key"></a> [ibmcloud\_api\_key](#input\_ibmcloud\_api\_key) | The IBM Cloud API key to deploy resources. | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | The name to give to the api key | `string` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_key"></a> [api\_key](#output\_api\_key) | MQ on Cloud application API key (sensitive) |
| <a name="output_api_key_id"></a> [api\_key\_id](#output\_api\_key\_id) | MQ on Cloud application API key id |
| <a name="output_api_key_name"></a> [api\_key\_name](#output\_api\_key\_name) | MQ on Cloud application API key name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
