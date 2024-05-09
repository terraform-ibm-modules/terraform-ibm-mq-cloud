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
| [ibm_mqcloud_user.user](https://registry.terraform.io/providers/ibm-cloud/ibm/latest/docs/resources/mqcloud_user) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_email"></a> [email](#input\_email) | The name of the app. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the app. | `string` | n/a | yes |
| <a name="input_service_instance_guid"></a> [service\_instance\_guid](#input\_service\_instance\_guid) | The name of the app. | `string` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_href"></a> [href](#output\_href) | URL to application that is only visible within the project. |
| <a name="output_id"></a> [id](#output\_id) | The unique identifier of the created code engine app. |
| <a name="output_user_id"></a> [user\_id](#output\_user\_id) | URL to application. Depending on visibility this is accessible publicly or in the private network only. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
