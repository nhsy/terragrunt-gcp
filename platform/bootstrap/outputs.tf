output "random_id" {
  value = random_id.this.hex
}

output "labels" {
  value = module.labels.rendered
}

output "gce_service_account_email" {
  value       = google_service_account.gce.email
  description = "GCE service account email"
}

output "kms_key_ring_name" {
  value       = google_kms_key_ring.key_ring.name
  description = "KMS key ring name"
}

output "kms_key_crypto_key_name" {
  value       = google_kms_crypto_key.crypto_key.name
  description = "KMS crypto key name"
}

output "kms_key" {
  value       = google_kms_crypto_key.crypto_key.self_link
  description = "KMS crypto key name"
}
