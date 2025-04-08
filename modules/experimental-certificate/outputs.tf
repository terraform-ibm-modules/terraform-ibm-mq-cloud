########################################################################################################################
# Outputs
########################################################################################################################

output "certificate" {
  description = "The value of the requested certificate"
  value       = data.external.certificate.result.certificate
  sensitive   = true
}

output "errors" {
  description = "Diagnostics of any errors reported by during the lookup process"
  value       = data.external.certificate.result.errors
}
