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
| [ibm_resource_instance.mqcloud_capacity](https://registry.terraform.io/providers/ibm-cloud/ibm/latest/docs/resources/resource_instance) | resource |
| [ibm_resource_instance.mqcloud_deployment](https://registry.terraform.io/providers/ibm-cloud/ibm/latest/docs/resources/resource_instance) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_existing_mq_capacity_guid"></a> [existing\_mq\_capacity\_guid](#input\_existing\_mq\_capacity\_guid) | The GUID of an existing capacity service instance, if not specifed, a new capacity plan will be created | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name to give the MQ on Cloud instance. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region to provision the MQ on Cloud instance to. | `string` | n/a | yes |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | The ID of the resource group to provision the MQ on Cloud instance to. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The list of resource tags that you want to associate with your MQ on Cloud instance. | `list(string)` | `[]` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_capacity_crn"></a> [capacity\_crn](#output\_capacity\_crn) | The CRN of the created MQ on Cloud capacity instance. |
| <a name="output_capacity_guid"></a> [capacity\_guid](#output\_capacity\_guid) | The unique identifier of the created MQ on Cloud capacity instance. |
| <a name="output_deployment_crn"></a> [deployment\_crn](#output\_deployment\_crn) | The CRN of the created MQ on Cloud deployment instance. |
| <a name="output_deployment_guid"></a> [deployment\_guid](#output\_deployment\_guid) | The unique identifier of the created MQ on Cloud deployment instance. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
