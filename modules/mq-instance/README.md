# MQ on Cloud service instance

MQ on Cloud requires two service instances.

- `reserved-capacity`: A single tenant service instance that provides MQ on Cloud capacity. Incubating versions of this module require the capacity instance to be manually created and the GUID passed into the module.
- `reserved-deployment`: A service instance to create a `location` in which to create queue managers.

Note: The MQ on Cloud Terraform provider access is restricted to users of the reserved deployment plan.

### Usage

```hcl
module "mqcloud_instance" {
  source                   = "terraform-ibm-modules/mq-cloud/ibm//modules/mq-instance"
  version                  = "X.X.X"  # Replace "X.X.X" with a release version to lock into a specific release
  name                     = "deployment-instance"
  region                   = "us-east"
  resource_group_id        = var.resource_group_id
  existing_mq_capacity_crn = "crn:<...>" # MQ on Cloud capacity instance crn
  tags                     = [ "tag-1", "tag-2" ]
}
```

<!-- The following content is automatically populated by the pre-commit hook -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.79.0, <2.0.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [ibm_resource_instance.mqcloud_capacity](https://registry.terraform.io/providers/ibm-cloud/ibm/latest/docs/resources/resource_instance) | resource |
| [ibm_resource_instance.mqcloud_deployment](https://registry.terraform.io/providers/ibm-cloud/ibm/latest/docs/resources/resource_instance) | resource |
| [ibm_mqcloud_queue_manager_options.options](https://registry.terraform.io/providers/ibm-cloud/ibm/latest/docs/data-sources/mqcloud_queue_manager_options) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_existing_mq_capacity_crn"></a> [existing\_mq\_capacity\_crn](#input\_existing\_mq\_capacity\_crn) | The CRN of an existing capacity service instance, if not specified, a new capacity plan will be created. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name to give the MQ on Cloud instance. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region to provision the MQ on Cloud instance to. | `string` | n/a | yes |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | The ID of the resource group to provision the MQ on Cloud instance to. | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The MQ on Cloud subscription id. Required if `existing_mq_capacity_crn` is not specified. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The list of resource tags that you want to associate with your MQ on Cloud instance. | `list(string)` | `[]` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_capacity_crn"></a> [capacity\_crn](#output\_capacity\_crn) | The CRN of the MQ on Cloud capacity instance. |
| <a name="output_capacity_guid"></a> [capacity\_guid](#output\_capacity\_guid) | The QUID of the created MQ on Cloud capacity instance. |
| <a name="output_deployment_crn"></a> [deployment\_crn](#output\_deployment\_crn) | The CRN of the created MQ on Cloud deployment instance. |
| <a name="output_deployment_guid"></a> [deployment\_guid](#output\_deployment\_guid) | The QUID of the created MQ on Cloud deployment instance. |
| <a name="output_queue_manager_options"></a> [queue\_manager\_options](#output\_queue\_manager\_options) | The deployment service instance queue manager options. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
