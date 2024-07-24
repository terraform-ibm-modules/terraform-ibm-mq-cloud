# Deployable MQ on Cloud Application

### Usage

```hcl
module "application" {
  source                = "terraform-ibm-modules/mq-cloud/ibm//modules/application"
  version               = "X.X.X"  # Replace "X.X.X" with a release version to lock into a specific release
  service_instance_guid = "11111111-1111-1111-1111-111111111111" # MQ on Cloud deployment instance guid
  name                  = "application"
}
```

<!-- The following content is automatically populated by the pre-commit hook -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0, <1.7.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.67.0, <2.0.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [ibm_mqcloud_application.mqcloud_application](https://registry.terraform.io/providers/ibm-cloud/ibm/latest/docs/resources/mqcloud_application) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | The name of the application. | `string` | n/a | yes |
| <a name="input_service_instance_guid"></a> [service\_instance\_guid](#input\_service\_instance\_guid) | The GUID that uniquely identifies the MQ on Cloud service instance. | `string` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_application_id"></a> [application\_id](#output\_application\_id) | The ID of the application which was allocated on creation, and can be used for delete calls |
| <a name="output_create_api_key_uri"></a> [create\_api\_key\_uri](#output\_create\_api\_key\_uri) | The URI to create a new apikey for the application. |
| <a name="output_href"></a> [href](#output\_href) | The URL for this application. |
| <a name="output_id"></a> [id](#output\_id) | The unique identifier of the mqcloud\_application. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
