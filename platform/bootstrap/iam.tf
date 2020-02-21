###
# Create gce service account for compute instances
###
resource "google_service_account" "gce" {
  account_id   = local.gce_service_account
  display_name = "GCE service account"
  project      = var.project_id
}

###
# Assign gce service account permissions
###
resource "google_project_iam_member" "gce" {
  for_each = toset([
    "roles/logging.logWriter",
    "roles/monitoring.metricWriter",
    "roles/monitoring.viewer"
  ])
  project = var.project_id
  role    = each.value
  member  = format("serviceAccount:%s", google_service_account.gce.email)
}

###
# Assign iap permission to iam user
###
resource "google_project_iam_binding" "iap" {
  members = [format("user:%s", data.google_client_openid_userinfo.this.email)
  ]
  role = "roles/iap.tunnelResourceAccessor"
}
