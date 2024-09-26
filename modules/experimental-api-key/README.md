# MQ on Cloud API Key

This is an experimental module to extend the [application module](../application). This module uses the application create_api_key_uri to return an application user name and password.

[Learn more](https://cloud.ibm.com/docs/mqcloud?topic=mqcloud-users_and_apps)

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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_external"></a> [external](#requirement\_external) | >= 2.3.4 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [external_external.application_apikey](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_href"></a> [href](#input\_href) | The application href | `string` | n/a | yes |
| <a name="input_ibmcloud_api_key"></a> [ibmcloud\_api\_key](#input\_ibmcloud\_api\_key) | The IBM Cloud API key to deploy resources. | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | The name to give to the api key | `string` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_key"></a> [api\_key](#output\_api\_key) | name |
| <a name="output_api_key_id"></a> [api\_key\_id](#output\_api\_key\_id) | name |
| <a name="output_api_key_name"></a> [api\_key\_name](#output\_api\_key\_name) | name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
