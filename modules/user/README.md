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
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.67.0-beta0, <2.0.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [ibm_mqcloud_user.user](https://registry.terraform.io/providers/ibm-cloud/ibm/latest/docs/resources/mqcloud_user) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_email"></a> [email](#input\_email) | The email of the user. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The shortname of the user that will be used as the IBM MQ administrator in interactions with a queue manager for this service instance. | `string` | n/a | yes |
| <a name="input_service_instance_guid"></a> [service\_instance\_guid](#input\_service\_instance\_guid) | The GUID that uniquely identifies the MQ on Cloud service instance. | `string` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_href"></a> [href](#output\_href) | The URL for the user details. |
| <a name="output_id"></a> [id](#output\_id) | The unique identifier of the user. |
| <a name="output_user_id"></a> [user\_id](#output\_user\_id) | The ID of the user which was allocated on creation, and can be used for delete calls |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
