output "csr_content" {
  description = "Certificate Signing Request."
  value       = data.local_file.csr_file.content
}

output "csr_sha512" {
  description = "SHA512 Digest of the Certificate Signing Request."
  value       = data.local_file.csr_file.content_sha512
}

output "key_content" {
  description = "Certificate Private key."
  value       = data.local_sensitive_file.key.content
  sensitive   = true
}

output "key_password" {
  description = "Password of the Certificate Private Key."
  value       = random_password.key_password.result
  sensitive   = true
}

output "key_sha512" {
  description = "SHA512 digest of the Certificate Private key."
  value       = data.local_sensitive_file.key.content_sha512
  sensitive   = true
}
