########################################################################################################################
# Outputs
########################################################################################################################

output "id" {
  description = "The unique identifier of the key store certificate."
  value       = resource.ibm_mqcloud_keystore_certificate.mqcloud_keystore_certificate.id
}

output "certificate_id" {
  description = "Id of the certificate."
  value       = resource.ibm_mqcloud_keystore_certificate.mqcloud_keystore_certificate.certificate_id
}

# Will always be "key_store"
#output "certificate_type" {
#  description = "The type of certificate."
#  value       = resource.ibm_mqcloud_keystore_certificate.mqcloud_keystore_certificate.certificate_type
#}

output "dns_names" {
  description = "The list of DNS names."
  value       = resource.ibm_mqcloud_keystore_certificate.mqcloud_keystore_certificate.dns_names
}

output "dns_names_total_count" {
  description = "The total count of dns names."
  value       = resource.ibm_mqcloud_keystore_certificate.mqcloud_keystore_certificate.dns_names_total_count
}

output "expiry" {
  description = "Expiry date for the certificate."
  value       = resource.ibm_mqcloud_keystore_certificate.mqcloud_keystore_certificate.expiry
}

output "fingerprint_sha256" {
  description = "The SHA256 fingerprint for the certificate."
  value       = resource.ibm_mqcloud_keystore_certificate.mqcloud_keystore_certificate.fingerprint_sha256
}

output "href" {
  description = "The URL for this key store certificate."
  value       = resource.ibm_mqcloud_keystore_certificate.mqcloud_keystore_certificate.href
}

output "is_default" {
  description = "Indicates whether it is the queue manager's default certificate."
  value       = resource.ibm_mqcloud_keystore_certificate.mqcloud_keystore_certificate.is_default
}

output "issued" {
  description = "The date the certificate was issued."
  value       = resource.ibm_mqcloud_keystore_certificate.mqcloud_keystore_certificate.issued
}

output "issuer_cn" {
  description = "The certificate issuer's common name."
  value       = resource.ibm_mqcloud_keystore_certificate.mqcloud_keystore_certificate.issuer_cn
}

output "issuer_dn" {
  description = "The certificate issuer's distinguished name."
  value       = resource.ibm_mqcloud_keystore_certificate.mqcloud_keystore_certificate.issuer_dn
}

output "subject_cn" {
  description = "The certificate subject's common name."
  value       = resource.ibm_mqcloud_keystore_certificate.mqcloud_keystore_certificate.subject_cn
}

output "subject_dn" {
  description = "The certificate subject's distinguished name."
  value       = resource.ibm_mqcloud_keystore_certificate.mqcloud_keystore_certificate.subject_dn
}
