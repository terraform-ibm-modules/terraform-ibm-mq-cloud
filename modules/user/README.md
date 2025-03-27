# MQ on Cloud user

IBM MQ on Cloud makes a distinction between Administrators and Applications - which in IAM terminology are equivalent to Users and Service IDs. Both these entities are capable of accessing an IBM MQ queue manager but they are in different groups and have different access rights.

Administrators are given an IAM access policy which automatically adds them to the standard mqm group for all queue managers in their service instance, and therefore they have full administrator access rights.

[Learn more](https://cloud.ibm.com/docs/mqcloud?topic=mqcloud-users_and_apps)

### Usage

```hcl
module "user" {
  source               = "terraform-ibm-modules/mq-cloud/ibm//modules/user"
  version              = "X.X.X"  # Replace "X.X.X" with a release version to lock into a specific release
  service_instance_crn = "crn:<...>" # MQ on Cloud deployment instance crn
  name                 = "user"
  email                = "user@example.com"
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
| [ibm_mqcloud_user.user](https://registry.terraform.io/providers/ibm-cloud/ibm/latest/docs/resources/mqcloud_user) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_email"></a> [email](#input\_email) | The email of the user. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The shortname of the user that will be used as the IBM MQ administrator in interactions with a queue manager for this service instance. | `string` | n/a | yes |
| <a name="input_service_instance_crn"></a> [service\_instance\_crn](#input\_service\_instance\_crn) | The CRN that uniquely identifies the MQ on Cloud deployment service instance. | `string` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_href"></a> [href](#output\_href) | The URL for the user details. |
| <a name="output_id"></a> [id](#output\_id) | The unique identifier of the user. |
| <a name="output_user_id"></a> [user\_id](#output\_user\_id) | The ID of the user which was allocated on creation, and can be used for delete calls |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
