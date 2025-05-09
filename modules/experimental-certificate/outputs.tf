########################################################################################################################
# Outputs
########################################################################################################################

output "certificate" {
  description = "The value of the requested certificate"
  value       = can(data.external.certificate.result.certificate) ? data.external.certificate.result.certificate : null
  sensitive   = true
}

output "errors" {
  description = "Diagnostics of any errors reported by during the lookup process"
  value       = can(data.external.certificate.result.status_code) ? data.external.certificate.result : null
}
