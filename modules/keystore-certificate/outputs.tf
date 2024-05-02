########################################################################################################################
# Outputs
########################################################################################################################

output "id" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_keystore_certificate.mqcloud_keystore_certificate.id
}

output "certificate_id" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_keystore_certificate.mqcloud_keystore_certificate.certificate_id
}

output "certificate_type" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_keystore_certificate.mqcloud_keystore_certificate.certificate_type
}

output "dns_names" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_keystore_certificate.mqcloud_keystore_certificate.dns_names
}

output "dns_names_total_count" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_keystore_certificate.mqcloud_keystore_certificate.dns_names_total_count
}

output "expiry" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_keystore_certificate.mqcloud_keystore_certificate.expiry
}

output "fingerprint_sha256" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_keystore_certificate.mqcloud_keystore_certificate.fingerprint_sha256
}

output "href" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_keystore_certificate.mqcloud_keystore_certificate.href
}

output "is_default" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_keystore_certificate.mqcloud_keystore_certificate.is_default
}

output "issued" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_keystore_certificate.mqcloud_keystore_certificate.issued
}

output "issuer_cn" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_keystore_certificate.mqcloud_keystore_certificate.issuer_cn
}

output "issuer_dn" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_keystore_certificate.mqcloud_keystore_certificate.issuer_dn
}

output "subject_cn" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_keystore_certificate.mqcloud_keystore_certificate.subject_cn
}

output "subject_dn" {
  description = "The unique identifier of the created code engine app."
  value       = resource.ibm_mqcloud_keystore_certificate.mqcloud_keystore_certificate.subject_dn
}
