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
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.67.0, <2.0.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [ibm_mqcloud_keystore_certificate.mqcloud_keystore_certificate](https://registry.terraform.io/providers/ibm-cloud/ibm/latest/docs/resources/mqcloud_keystore_certificate) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_certificate"></a> [certificate](#input\_certificate) | A base64 encoded string contain a PEM certificate chain. | `string` | n/a | yes |
| <a name="input_label"></a> [label](#input\_label) | The label to use for the certificate to be uploaded. | `string` | n/a | yes |
| <a name="input_queue_manager_id"></a> [queue\_manager\_id](#input\_queue\_manager\_id) | The id of the queue manager. | `string` | n/a | yes |
| <a name="input_service_instance_guid"></a> [service\_instance\_guid](#input\_service\_instance\_guid) | The GUID that uniquely identifies the MQ on Cloud service instance. | `string` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate_id"></a> [certificate\_id](#output\_certificate\_id) | Id of the certificate. |
| <a name="output_dns_names"></a> [dns\_names](#output\_dns\_names) | The list of DNS names. |
| <a name="output_dns_names_total_count"></a> [dns\_names\_total\_count](#output\_dns\_names\_total\_count) | The total count of dns names. |
| <a name="output_expiry"></a> [expiry](#output\_expiry) | Expiry date for the certificate. |
| <a name="output_fingerprint_sha256"></a> [fingerprint\_sha256](#output\_fingerprint\_sha256) | The SHA256 fingerprint for the certificate. |
| <a name="output_href"></a> [href](#output\_href) | The URL for this key store certificate. |
| <a name="output_id"></a> [id](#output\_id) | The unique identifier of the key store certificate. |
| <a name="output_is_default"></a> [is\_default](#output\_is\_default) | Indicates whether it is the queue manager's default certificate. |
| <a name="output_issued"></a> [issued](#output\_issued) | The date the certificate was issued. |
| <a name="output_issuer_cn"></a> [issuer\_cn](#output\_issuer\_cn) | The certificate issuer's common name. |
| <a name="output_issuer_dn"></a> [issuer\_dn](#output\_issuer\_dn) | The certificate issuer's distinguished name. |
| <a name="output_subject_cn"></a> [subject\_cn](#output\_subject\_cn) | The certificate subject's common name. |
| <a name="output_subject_dn"></a> [subject\_dn](#output\_subject\_dn) | The certificate subject's distinguished name. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
