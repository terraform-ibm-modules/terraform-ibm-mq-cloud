# MQ on Cloud Application

IBM MQ on Cloud makes a distinction between Administrators and Applications - which in IAM terminology are equivalent to Users and Service IDs. Both these entities are capable of accessing an IBM MQ queue manager but they are in different groups and have different access rights.

Applications are given an IAM access policy which automatically adds them to the `mqwriters` group - this group gives applications permission to read/write to queues in the queue manager, but does not give them administration privileges.

[Learn more](https://cloud.ibm.com/docs/mqcloud?topic=mqcloud-users_and_apps)

### Usage

```hcl
module "application" {
  source               = "terraform-ibm-modules/mq-cloud/ibm//modules/application"
  version              = "X.X.X"  # Replace "X.X.X" with a release version to lock into a specific release
  service_instance_crn = "crn:<...>" # MQ on Cloud deployment instance crn
  name                 = "application"
}
```

<!-- The following content is automatically populated by the pre-commit hook -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
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
| <a name="input_service_instance_crn"></a> [service\_instance\_crn](#input\_service\_instance\_crn) | The CRN that uniquely identifies the MQ on Cloud deployment service instance. | `string` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_application_id"></a> [application\_id](#output\_application\_id) | The ID of the application which was allocated on creation, and can be used for delete calls |
| <a name="output_create_api_key_uri"></a> [create\_api\_key\_uri](#output\_create\_api\_key\_uri) | The URI to create a new apikey for the application. |
| <a name="output_href"></a> [href](#output\_href) | The URL for this application. |
| <a name="output_id"></a> [id](#output\_id) | The unique identifier of the mqcloud\_application. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
