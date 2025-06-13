# Terraform MQ on Cloud Module

<!--
Update status and "latest release" badges:
  1. For the status options, see https://terraform-ibm-modules.github.io/documentation/#/badge-status
  2. Update the "latest release" badge to point to the correct module's repo. Replace "terraform-ibm-module-template" in two places.
-->

<!--
NOTE: This feature is incubating and ONLY available in eu-fr2 region for validation.
DO NOT mark this module as stable/supported BEFORE the feature is GA world wide.
-->
[![Stable (With quality checks)](https://img.shields.io/badge/Status-Stable%20(With%20quality%20checks)-green)](https://terraform-ibm-modules.github.io/documentation/#/badge-status)
[![latest release](https://img.shields.io/github/v/release/terraform-ibm-modules/terraform-ibm-mq-cloud?logo=GitHub&sort=semver)](https://github.com/terraform-ibm-modules/terraform-ibm-mq-cloud/releases/latest)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![Renovate enabled](https://img.shields.io/badge/renovate-enabled-brightgreen.svg)](https://renovatebot.com/)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)

<!--
Add a description of modules in this repo.
Expand on the repo short description in the .github/settings.yml file.

For information, see "Module names and descriptions" at
https://terraform-ibm-modules.github.io/documentation/#/implementation-guidelines?id=module-names-and-descriptions
-->

IBM MQ on IBM Cloud enables you to quickly and easily deploy queue managers in the cloud and connect your applications to them, providing reliable data transfer between different parts of your enterprise application landscape.

Use the terraform IBM module for MQ on Cloud manage MQ resources. Queue manager, User, Application and Certificate interfaces enable convenient management of MQ on Cloud resource lifecycles.

Information: The terraform IBM module for MQ on Cloud is incubating and NOT GA on IBM Cloud. The features demonstrated here
are incomplete, may not be in final form and may generate unpredicatable failures.

<!-- The following content is automatically populated by the pre-commit hook -->
<!-- BEGIN OVERVIEW HOOK -->
## Overview
* [terraform-ibm-mq-cloud](#terraform-ibm-mq-cloud)
* [Submodules](./modules)
    * [application](./modules/application)
    * [experimental-api-key](./modules/experimental-api-key)
    * [experimental-certificate](./modules/experimental-certificate)
    * [experimental-connection](./modules/experimental-connection)
    * [keystore-certificate](./modules/keystore-certificate)
    * [mq-instance](./modules/mq-instance)
    * [queue-manager](./modules/queue-manager)
    * [truststore-certificate](./modules/truststore-certificate)
    * [user](./modules/user)
* [Examples](./examples)
    * [Advanced example](./examples/advanced)
    * [Basic example](./examples/basic)
* [Contributing](#contributing)
<!-- END OVERVIEW HOOK -->


<!--
If this repo contains any reference architectures, uncomment the heading below and link to them.
(Usually in the `/reference-architectures` directory.)
See "Reference architecture" in the public documentation at
https://terraform-ibm-modules.github.io/documentation/#/implementation-guidelines?id=reference-architecture
-->
<!-- ## Reference architectures -->


<!-- Replace this heading with the name of the root level module (the repo name) -->
## terraform-ibm-mq-cloud

### Usage

<!--
Add an example of the use of the module in the following code block.

Use real values instead of "var.<var_name>" or other placeholder values
unless real values don't help users know what to change.
-->

```hcl
module "mq_on_cloud" {
  source            = "terraform-ibm-modules/mq-cloud/ibm"
  version           = "x.x.x" #
  resource_group_id = module.resource_group.resource_group_id

  name   = "${var.prefix}-mq-instance"
  region = "us-east"
  existing_mq_capacity_crn = "crn:<...>" # MQ on Cloud capacity instance crn

  queue_manager_display_name = "queue-manager"
  queue_manager_name         = "qm"
  queue_manager_size         = "xsmall"

  applications = {
    "application" = {
      name = "application"
    }
  }
  users = {
    "user" = {
      name  = "user"
      email = "user@example.com"
    }
  }
  keystore_certificates = {
    "ks-cert" = {
      certificate = "YmFzZTY0IGVuY29kZWQgY2VydGlmaWNhdGUK" # Base64 encoded certificate
      label       = "ks_cert_1"
    }
  }
  truststore_certificates = {
    "ts-cert" = {
      certificate = "YmFzZTY0IGVuY29kZWQgY2VydGlmaWNhdGUK" # Base64 encoded certificate
      label       = "ts_cert_1"
    }
  }

}
```

### Required IAM access policies

<!-- PERMISSIONS REQUIRED TO RUN MODULE
If this module requires permissions, uncomment the following block and update
the sample permissions, following the format.
Replace the sample Account and IBM Cloud service names and roles with the
information in the console at
Manage > Access (IAM) > Access groups > Access policies.
-->

<!--
You need the following permissions to run this module.

- Account Management
    - **Sample Account Service** service
        - `Editor` platform access
        - `Manager` service access
    - IAM Services
        - **Sample Cloud Service** service
            - `Administrator` platform access
-->

<!-- NO PERMISSIONS FOR MODULE
If no permissions are required for the module, uncomment the following
statement instead the previous block.
-->

<!-- No permissions are needed to run this module.-->


<!-- The following content is automatically populated by the pre-commit hook -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_application"></a> [application](#module\_application) | ./modules/application | n/a |
| <a name="module_keystore_certificate"></a> [keystore\_certificate](#module\_keystore\_certificate) | ./modules/keystore-certificate | n/a |
| <a name="module_mqcloud_instance"></a> [mqcloud\_instance](#module\_mqcloud\_instance) | ./modules/mq-instance | n/a |
| <a name="module_queue_manager"></a> [queue\_manager](#module\_queue\_manager) | ./modules/queue-manager | n/a |
| <a name="module_truststore_certificate"></a> [truststore\_certificate](#module\_truststore\_certificate) | ./modules/truststore-certificate | n/a |
| <a name="module_user"></a> [user](#module\_user) | ./modules/user | n/a |

### Resources

No resources.

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_applications"></a> [applications](#input\_applications) | A map of IBM MQ on Cloud applications to be created. | <pre>map(object({<br/>    name = string<br/>  }))</pre> | `{}` | no |
| <a name="input_existing_mq_capacity_crn"></a> [existing\_mq\_capacity\_crn](#input\_existing\_mq\_capacity\_crn) | The CRN of an existing capacity service instance, if not specifed, a new capacity plan will be created | `string` | `null` | no |
| <a name="input_keystore_certificates"></a> [keystore\_certificates](#input\_keystore\_certificates) | A map of IBM MQ on Cloud keystore certificates to be created. | <pre>map(object({<br/>    certificate = string<br/>    label       = string<br/>  }))</pre> | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | The name to give the MQ on Cloud instance. | `string` | n/a | yes |
| <a name="input_queue_manager_display_name"></a> [queue\_manager\_display\_name](#input\_queue\_manager\_display\_name) | A displayable name for the queue manager. | `string` | n/a | yes |
| <a name="input_queue_manager_location"></a> [queue\_manager\_location](#input\_queue\_manager\_location) | The location in which the queue manager will be deployed. Defaults to using the first location in the created service instance | `string` | `null` | no |
| <a name="input_queue_manager_name"></a> [queue\_manager\_name](#input\_queue\_manager\_name) | A queue manager name conforming to MQ restrictions. 1 to 48 characters matching regular expression '/^[a-zA-Z0-9.\_]*$/' . | `string` | n/a | yes |
| <a name="input_queue_manager_size"></a> [queue\_manager\_size](#input\_queue\_manager\_size) | The queue manager deployment sizes. Valid values are `xsmall`, `small`, `medium`, `large` . | `string` | `"xsmall"` | no |
| <a name="input_queue_manager_version"></a> [queue\_manager\_version](#input\_queue\_manager\_version) | The MQ version of the queue manager. If null, use the latest available | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | The region to provision the MQ on Cloud instance to. | `string` | n/a | yes |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | The ID of the resource group to provision the MQ on Cloud instance to. | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | An MQ on Cloud subscsription plan id for customers who have purchased a subscription through an IBM sales representative | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The list of resource tags that you want to associate with your MQ on Cloud instance. | `list(string)` | `[]` | no |
| <a name="input_truststore_certificates"></a> [truststore\_certificates](#input\_truststore\_certificates) | A map of IBM MQ on Cloud truststore certificates to be created. | <pre>map(object({<br/>    certificate = string<br/>    label       = string<br/>  }))</pre> | `{}` | no |
| <a name="input_users"></a> [users](#input\_users) | A map of IBM MQ on Cloud users to be created. | <pre>map(object({<br/>    email = string<br/>    name  = string<br/>  }))</pre> | `{}` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_queue_manager_id"></a> [queue\_manager\_id](#output\_queue\_manager\_id) | The ID of the MQ on Cloud queue manager |
| <a name="output_queue_manager_options"></a> [queue\_manager\_options](#output\_queue\_manager\_options) | Queue manager options for the MQ on Cloud deployment service instance |
| <a name="output_service_instance_capacity_crn"></a> [service\_instance\_capacity\_crn](#output\_service\_instance\_capacity\_crn) | The CRN of the MQ on Cloud capacity service instance |
| <a name="output_service_instance_capacity_guid"></a> [service\_instance\_capacity\_guid](#output\_service\_instance\_capacity\_guid) | The GUID of the MQ on Cloud capacity service instance |
| <a name="output_service_instance_deployment_crn"></a> [service\_instance\_deployment\_crn](#output\_service\_instance\_deployment\_crn) | The CRN of the MQ on Cloud deployment service instance |
| <a name="output_service_instance_deployment_guid"></a> [service\_instance\_deployment\_guid](#output\_service\_instance\_deployment\_guid) | The GUID of the MQ on Cloud deployment service instance |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- Leave this section as is so that your module has a link to local development environment set-up steps for contributors to follow -->
## Contributing

You can report issues and request features for this module in GitHub issues in the module repo. See [Report an issue or request a feature](https://github.com/terraform-ibm-modules/.github/blob/main/.github/SUPPORT.md).

To set up your local development environment, see [Local development setup](https://terraform-ibm-modules.github.io/documentation/#/local-dev-setup) in the project documentation.
