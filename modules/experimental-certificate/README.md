# MQ on Cloud trust store certificate download

The trust store is used to trust certificates from MQ clients and other queue managers that connect to the queue manager.

[Learn more](https://cloud.ibm.com/docs/mqcloud?topic=mqcloud-mqoc_qm_certs#cert_policy_mqoc_qm_certs)

This module downloads the provided certificates certificate file.

### Usage

```hcl
# Source a certificate
data "ibm_mqcloud_truststore_certificate" "certificate" {
  label                 = "LetsEncryptIssuingCA"
  queue_manager_id      = local.queue_manager_id
  service_instance_guid = local.override_guid
}

# Download the certificate from the certificates href
module "experimental_certificate" {
  source           = "terraform-ibm-modules/mq-cloud/ibm//modules/experimental-certificate"
  version          = "X.X.X"  # Replace "X.X.X" with a release version to lock into a specific release
  ibmcloud_api_key = "IBM Cloud Api Key"   # pragma: allowlist secret
  href             = data.ibm_mqcloud_truststore_certificate.certificate.trust_store[0].href
}
```

<!-- The following content is automatically populated by the pre-commit hook -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_external"></a> [external](#requirement\_external) | >= 2.3.4 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [external_external.certificate](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_href"></a> [href](#input\_href) | The truststore certificates href | `string` | n/a | yes |
| <a name="input_ibmcloud_api_key"></a> [ibmcloud\_api\_key](#input\_ibmcloud\_api\_key) | The IBM Cloud API key to deploy resources | `string` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate"></a> [certificate](#output\_certificate) | name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
