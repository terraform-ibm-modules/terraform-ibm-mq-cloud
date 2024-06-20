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
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.67.0-beta1, <2.0.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [ibm_mqcloud_queue_manager.mqcloud_queue_manager](https://registry.terraform.io/providers/ibm-cloud/ibm/latest/docs/resources/mqcloud_queue_manager) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | A displayable name for the queue manager. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The locations in which the queue manager would be deployed. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | A queue manager name conforming to MQ restrictions. 1 to 48 characters matching regular expression '/^[a-zA-Z0-9.\_]*$/' . | `string` | n/a | yes |
| <a name="input_queue_manager_version"></a> [queue\_manager\_version](#input\_queue\_manager\_version) | The MQ version of the queue manager. | `string` | `"9.3.2_2"` | no |
| <a name="input_service_instance_guid"></a> [service\_instance\_guid](#input\_service\_instance\_guid) | The GUID that uniquely identifies the MQ on Cloud service instance. | `string` | n/a | yes |
| <a name="input_size"></a> [size](#input\_size) | The queue manager deployment sizes. Valid values are `xsmall`, `small`, `medium`, `large`. | `string` | `"xsmall"` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_administrator_api_endpoint_url"></a> [administrator\_api\_endpoint\_url](#output\_administrator\_api\_endpoint\_url) | The url through which to access the Admin REST APIs for this queue manager. |
| <a name="output_available_upgrade_versions_uri"></a> [available\_upgrade\_versions\_uri](#output\_available\_upgrade\_versions\_uri) | The uri through which the available versions to upgrade to can be found for this queue manager. |
| <a name="output_connection_info_uri"></a> [connection\_info\_uri](#output\_connection\_info\_uri) | The uri through which the CDDT for this queue manager can be obtained. |
| <a name="output_date_created"></a> [date\_created](#output\_date\_created) | RFC3339 formatted UTC date for when the queue manager was created. |
| <a name="output_href"></a> [href](#output\_href) | The URL for this queue manager. |
| <a name="output_id"></a> [id](#output\_id) | The unique identifier of the queue manager. |
| <a name="output_queue_manager_id"></a> [queue\_manager\_id](#output\_queue\_manager\_id) | The ID of the queue manager which was allocated on creation, and can be used for delete calls. |
| <a name="output_rest_api_endpoint_url"></a> [rest\_api\_endpoint\_url](#output\_rest\_api\_endpoint\_url) | The url through which to access REST APIs for this queue manager. |
| <a name="output_status_uri"></a> [status\_uri](#output\_status\_uri) | The reference uri to get deployment status of the queue manager. |
| <a name="output_upgrade_available"></a> [upgrade\_available](#output\_upgrade\_available) | Describes whether an upgrade is available for this queue manager. |
| <a name="output_web_console_url"></a> [web\_console\_url](#output\_web\_console\_url) | The url through which to access the web console for this queue manager. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
