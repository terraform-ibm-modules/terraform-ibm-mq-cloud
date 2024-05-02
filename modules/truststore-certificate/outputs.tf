########################################################################################################################
# Outputs
########################################################################################################################

output "id" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_truststore_certificate.mqcloud_truststore_certificate.id
}

output "certificate_id" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_truststore_certificate.mqcloud_truststore_certificate.certificate_id
}

output "certificate_type" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_truststore_certificate.mqcloud_truststore_certificate.certificate_type
}

output "expiry" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_truststore_certificate.mqcloud_truststore_certificate.expiry
}

output "fingerprint_sha256" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_truststore_certificate.mqcloud_truststore_certificate.fingerprint_sha256
}

output "href" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_truststore_certificate.mqcloud_truststore_certificate.href
}

output "issued" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_truststore_certificate.mqcloud_truststore_certificate.issued
}

output "issuer_cn" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_truststore_certificate.mqcloud_truststore_certificate.issuer_cn
}

output "issuer_dn" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_truststore_certificate.mqcloud_truststore_certificate.issuer_dn
}

output "subject_cn" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_truststore_certificate.mqcloud_truststore_certificate.subject_cn
}

output "subject_dn" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_truststore_certificate.mqcloud_truststore_certificate.subject_dn
}

output "trusted" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_truststore_certificate.mqcloud_truststore_certificate.trusted
}
