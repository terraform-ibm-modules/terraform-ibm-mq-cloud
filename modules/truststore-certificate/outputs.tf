########################################################################################################################
# Outputs
########################################################################################################################

output "id" {
  description = "The unique identifier of the trusted store certificate."
  value       = resource.ibm_mqcloud_truststore_certificate.mqcloud_truststore_certificate.id
}

output "certificate_id" {
  description = "Id of the certificate."
  value       = resource.ibm_mqcloud_truststore_certificate.mqcloud_truststore_certificate.certificate_id
}

# Will always be "trusted_store"
#output "certificate_type" {
#  description = "The type of certificate."
#  value       = resource.ibm_mqcloud_truststore_certificate.mqcloud_truststore_certificate.certificate_type
#}

output "expiry" {
  description = "Expiry date for the certificate."
  value       = resource.ibm_mqcloud_truststore_certificate.mqcloud_truststore_certificate.expiry
}

output "fingerprint_sha256" {
  description = "The SHA256 fingerprint for the certificate."
  value       = resource.ibm_mqcloud_truststore_certificate.mqcloud_truststore_certificate.fingerprint_sha256
}

output "href" {
  description = "The URL for this trust store certificate."
  value       = resource.ibm_mqcloud_truststore_certificate.mqcloud_truststore_certificate.href
}

output "issued" {
  description = "The date the certificate was issued."
  value       = resource.ibm_mqcloud_truststore_certificate.mqcloud_truststore_certificate.issued
}

output "issuer_cn" {
  description = "The certificate issuer's common name."
  value       = resource.ibm_mqcloud_truststore_certificate.mqcloud_truststore_certificate.issuer_cn
}

output "issuer_dn" {
  description = "The certificate issuer's distinguished name."
  value       = resource.ibm_mqcloud_truststore_certificate.mqcloud_truststore_certificate.issuer_dn
}

output "subject_cn" {
  description = "The certificate subject's common name."
  value       = resource.ibm_mqcloud_truststore_certificate.mqcloud_truststore_certificate.subject_cn
}

output "subject_dn" {
  description = "The certificate subject's distinguished name."
  value       = resource.ibm_mqcloud_truststore_certificate.mqcloud_truststore_certificate.subject_dn
}

output "trusted" {
  description = "Indicates whether a certificate is trusted."
  value       = resource.ibm_mqcloud_truststore_certificate.mqcloud_truststore_certificate.trusted
}
