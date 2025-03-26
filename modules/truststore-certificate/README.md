# MQ on Cloud trust store certificate

The trust store is used to trust certificates from MQ clients and other queue managers that connect to the queue manager.

[Learn more](https://cloud.ibm.com/docs/mqcloud?topic=mqcloud-mqoc_qm_certs#cert_policy_mqoc_qm_certs)

### Usage

```hcl
module "truststore_certificate" {
  source               = "terraform-ibm-modules/mq-cloud/ibm//modules/struststore-certificate"
  version              = "X.X.X"  # Replace "X.X.X" with a release version to lock into a specific release
  service_instance_crn = "crn:<...>" # MQ on Cloud deployment instance crn
  certificate          = "YmFzZTY0IGVuY29kZWQgY2VydGlmaWNhdGUK" # Base64 encoded certificate
  label                = ["label-1", "label-2"]
  queue_manager_id     = "11111111-1111-1111-1111-111111111111/11111111111111111111111111111111" # MQ on Cloud queue manager id
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
| [ibm_mqcloud_truststore_certificate.mqcloud_truststore_certificate](https://registry.terraform.io/providers/ibm-cloud/ibm/latest/docs/resources/mqcloud_truststore_certificate) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_certificate"></a> [certificate](#input\_certificate) | A base64 encoded string contain a PEM certificate chain. | `string` | n/a | yes |
| <a name="input_label"></a> [label](#input\_label) | The label to use for the certificate to be uploaded. | `string` | n/a | yes |
| <a name="input_queue_manager_id"></a> [queue\_manager\_id](#input\_queue\_manager\_id) | The id of the queue manager. | `string` | n/a | yes |
| <a name="input_service_instance_crn"></a> [service\_instance\_crn](#input\_service\_instance\_crn) | The CRN that uniquely identifies the MQ on Cloud deployment service instance. | `string` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate_id"></a> [certificate\_id](#output\_certificate\_id) | Id of the certificate. |
| <a name="output_expiry"></a> [expiry](#output\_expiry) | Expiry date for the certificate. |
| <a name="output_fingerprint_sha256"></a> [fingerprint\_sha256](#output\_fingerprint\_sha256) | The SHA256 fingerprint for the certificate. |
| <a name="output_href"></a> [href](#output\_href) | The URL for this trust store certificate. |
| <a name="output_id"></a> [id](#output\_id) | The unique identifier of the trusted store certificate. |
| <a name="output_issued"></a> [issued](#output\_issued) | The date the certificate was issued. |
| <a name="output_issuer_cn"></a> [issuer\_cn](#output\_issuer\_cn) | The certificate issuer's common name. |
| <a name="output_issuer_dn"></a> [issuer\_dn](#output\_issuer\_dn) | The certificate issuer's distinguished name. |
| <a name="output_subject_cn"></a> [subject\_cn](#output\_subject\_cn) | The certificate subject's common name. |
| <a name="output_subject_dn"></a> [subject\_dn](#output\_subject\_dn) | The certificate subject's distinguished name. |
| <a name="output_trusted"></a> [trusted](#output\_trusted) | Indicates whether a certificate is trusted. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
