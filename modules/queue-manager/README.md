<!-- Update the title -->
# Deployable Module Template

<!-- Update the below text with the name of the module  -->

A thin wrapper around the [terraform-ibm-module-template](../../) module which includes a provider configuration meaning it can be deployed as is.
This is not intended to be called by one or more other modules since it contains a provider configuration, meaning it is not compatible with the `for_each`, `count`, and `depends_on` arguments. For more information see [Providers Within Modules](https://developer.hashicorp.com/terraform/language/modules/develop/providers).

<!-- The following content is automatically populated by the pre-commit hook -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0, <1.7.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.65.0, <2.0.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [ibm_mqcloud_queue_manager.mqcloud_queue_manager](https://registry.terraform.io/providers/ibm-cloud/ibm/latest/docs/resources/mqcloud_queue_manager) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The name of the app. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The name of the app. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the app. | `string` | n/a | yes |
| <a name="input_queue_manager_version"></a> [queue\_manager\_version](#input\_queue\_manager\_version) | The name of the app. | `string` | `"9.3.2_2"` | no |
| <a name="input_service_instance_guid"></a> [service\_instance\_guid](#input\_service\_instance\_guid) | The name of the app. | `string` | n/a | yes |
| <a name="input_size"></a> [size](#input\_size) | The name of the app. | `string` | `"xsmall"` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_administrator_api_endpoint_url"></a> [administrator\_api\_endpoint\_url](#output\_administrator\_api\_endpoint\_url) | URL to application. Depending on visibility this is accessible publicly or in the private network only. |
| <a name="output_available_upgrade_versions_uri"></a> [available\_upgrade\_versions\_uri](#output\_available\_upgrade\_versions\_uri) | URL to application that is only visible within the project. |
| <a name="output_connection_info_uri"></a> [connection\_info\_uri](#output\_connection\_info\_uri) | The name of the created code engine app. |
| <a name="output_date_created"></a> [date\_created](#output\_date\_created) | The unique identifier of the created code engine app. |
| <a name="output_href"></a> [href](#output\_href) | The unique identifier of the created code engine app. |
| <a name="output_id"></a> [id](#output\_id) | The unique identifier of the created code engine app. |
| <a name="output_queue_manager_id"></a> [queue\_manager\_id](#output\_queue\_manager\_id) | The unique identifier of the created code engine app. |
| <a name="output_rest_api_endpoint_url"></a> [rest\_api\_endpoint\_url](#output\_rest\_api\_endpoint\_url) | The unique identifier of the created code engine app. |
| <a name="output_status_uri"></a> [status\_uri](#output\_status\_uri) | The unique identifier of the created code engine app. |
| <a name="output_upgrade_available"></a> [upgrade\_available](#output\_upgrade\_available) | The unique identifier of the created code engine app. |
| <a name="output_web_console_url"></a> [web\_console\_url](#output\_web\_console\_url) | The unique identifier of the created code engine app. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
