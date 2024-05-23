<!-- Update this title with a descriptive name. Use sentence case. -->
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
[![Incubating (Not yet consumable)](https://img.shields.io/badge/status-Incubating%20(Not%20yet%20consumable)-red)](https://terraform-ibm-modules.github.io/documentation/#/badge-status)
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

TODO: Replace this with a description of the modules in this repo.

Information: MQ on Cloud is incubating and NOT GA on IBM Cloud. The features demonstrated here
are incomplete and may not be in final form and will generate unpredicatable failures.

<!-- The following content is automatically populated by the pre-commit hook -->
<!-- BEGIN OVERVIEW HOOK -->
## Overview
* [terraform-ibm-mq-cloud](#terraform-ibm-mq-cloud)
* [Submodules](./modules)
    * [application](./modules/application)
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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0, <1.7.0 |

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
| <a name="input_applications"></a> [applications](#input\_applications) | A map of IBM MQ on Cloud applications to be created. | <pre>map(object({<br>    name = string<br>  }))</pre> | `{}` | no |
| <a name="input_existing_mq_capacity_guid"></a> [existing\_mq\_capacity\_guid](#input\_existing\_mq\_capacity\_guid) | The GUID of an existing capacity service instance, if not specifed, a new capacity plan will be created | `string` | `null` | no |
| <a name="input_keystore_certificates"></a> [keystore\_certificates](#input\_keystore\_certificates) | A map of IBM MQ on Cloud keystore certificates to be created. | <pre>map(object({<br>    certificate = string<br>    label       = string<br>  }))</pre> | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | The name to give the MQ on Cloud instance. | `string` | n/a | yes |
| <a name="input_queue_manager_display_name"></a> [queue\_manager\_display\_name](#input\_queue\_manager\_display\_name) | A displayable name for the queue manager. | `string` | n/a | yes |
| <a name="input_queue_manager_location"></a> [queue\_manager\_location](#input\_queue\_manager\_location) | The locations in which the queue manager could be deployed. | `string` | n/a | yes |
| <a name="input_queue_manager_name"></a> [queue\_manager\_name](#input\_queue\_manager\_name) | A queue manager name conforming to MQ restrictions. 1 to 48 characters matching regular expression '/^[a-zA-Z0-9.\_]*$/' . | `string` | n/a | yes |
| <a name="input_queue_manager_size"></a> [queue\_manager\_size](#input\_queue\_manager\_size) | The queue manager deployment sizes. Valid values are `xsmall`, `small`, `medium`, `large` . | `string` | `"xsmall"` | no |
| <a name="input_queue_manager_version"></a> [queue\_manager\_version](#input\_queue\_manager\_version) | The MQ version of the queue manager. | `string` | `"9.3.2_2"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region to provision the MQ on Cloud instance to. | `string` | n/a | yes |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | The ID of the resource group to provision the MQ on Cloud instance to. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The list of resource tags that you want to associate with your MQ on Cloud instance. | `list(string)` | `[]` | no |
| <a name="input_truststore_certificates"></a> [truststore\_certificates](#input\_truststore\_certificates) | A map of IBM MQ on Cloud truststore certificates to be created. | <pre>map(object({<br>    certificate = string<br>    label       = string<br>  }))</pre> | `{}` | no |
| <a name="input_users"></a> [users](#input\_users) | A map of IBM MQ on Cloud users to be created. | <pre>map(object({<br>    email = string<br>    name  = string<br>  }))</pre> | `{}` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_queue_manager_id"></a> [queue\_manager\_id](#output\_queue\_manager\_id) | Description of my output |
| <a name="output_service_instance_capacity_guid"></a> [service\_instance\_capacity\_guid](#output\_service\_instance\_capacity\_guid) | Description of my output |
| <a name="output_service_instance_deployment_guid"></a> [service\_instance\_deployment\_guid](#output\_service\_instance\_deployment\_guid) | Description of my output |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- Leave this section as is so that your module has a link to local development environment set-up steps for contributors to follow -->
## Contributing

You can report issues and request features for this module in GitHub issues in the module repo. See [Report an issue or request a feature](https://github.com/terraform-ibm-modules/.github/blob/main/.github/SUPPORT.md).

To set up your local development environment, see [Local development setup](https://terraform-ibm-modules.github.io/documentation/#/local-dev-setup) in the project documentation.
