# MQ on Cloud queue manager connection information

A queue manager is service that hosts MQ queues and channels. The queue manager ensures messages are processed from the right queue or routes requests to another queue manager. This module is a data source for the queue manager connection information. It returns connection information for 'CLOUD.ADMIN.SVRCONN' and 'CLOUD.APP.SVRCONN' channels.

### Usage

```hcl
module "experimental_connection" {
  source           = "terraform-ibm-modules/mq-cloud/ibm//modules/experimental-connection"
  version          = "X.X.X"  # Replace "X.X.X" with a release version to lock into a specific release
  ibmcloud_api_key = "IBM Cloud Api Key"   # pragma: allowlist secret
  href             = local.queue_manager_href
}
```

<!-- The following content is automatically populated by the pre-commit hook -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_external"></a> [external](#requirement\_external) | >= 2.3.4 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [external_external.connection](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_href"></a> [href](#input\_href) | The queue manager connection href | `string` | n/a | yes |
| <a name="input_ibmcloud_api_key"></a> [ibmcloud\_api\_key](#input\_ibmcloud\_api\_key) | The IBM Cloud API key to deploy resources | `string` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_connection_admin_channel_name"></a> [connection\_admin\_channel\_name](#output\_connection\_admin\_channel\_name) | Channel name of the admin channel |
| <a name="output_connection_admin_cipherspec"></a> [connection\_admin\_cipherspec](#output\_connection\_admin\_cipherspec) | Cipher specification of the admin channel |
| <a name="output_connection_admin_host"></a> [connection\_admin\_host](#output\_connection\_admin\_host) | Host name of the admin channel |
| <a name="output_connection_admin_port"></a> [connection\_admin\_port](#output\_connection\_admin\_port) | Port of of the admin channel |
| <a name="output_connection_admin_queue_manager_name"></a> [connection\_admin\_queue\_manager\_name](#output\_connection\_admin\_queue\_manager\_name) | Queue manager name of the admin channel |
| <a name="output_connection_admin_type"></a> [connection\_admin\_type](#output\_connection\_admin\_type) | Connection type of the admin channel |
| <a name="output_connection_app_channel_name"></a> [connection\_app\_channel\_name](#output\_connection\_app\_channel\_name) | Channel name of the application channel |
| <a name="output_connection_app_cipherspec"></a> [connection\_app\_cipherspec](#output\_connection\_app\_cipherspec) | Cipher specification of the application channel |
| <a name="output_connection_app_host"></a> [connection\_app\_host](#output\_connection\_app\_host) | Host name of the application channel |
| <a name="output_connection_app_port"></a> [connection\_app\_port](#output\_connection\_app\_port) | Port of the application channel |
| <a name="output_connection_app_queue_manager_name"></a> [connection\_app\_queue\_manager\_name](#output\_connection\_app\_queue\_manager\_name) | Queue manager name of the application channel |
| <a name="output_connection_app_type"></a> [connection\_app\_type](#output\_connection\_app\_type) | Connection type of the application channel |
| <a name="output_errors"></a> [errors](#output\_errors) | Diagnostics of any errors reported by during the lookup process |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
