###
# Allow IAP access for SSH access
###
resource "google_compute_firewall" "remote_mgmt_iap_ingress_allow" {
  name        = format("remote-mgmt-iap-%s", var.random_id)
  network     = module.vpc.name
  description = "Allow inbound connections from iap"
  direction   = "INGRESS"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
  }

  source_ranges = var.iap_source_cidrs
}

# allow SSH access to bastion
resource "google_compute_firewall" "remote_ssh_ingress_allow" {
  name        = format("remote-ssh-%s", var.random_id)
  network     = module.vpc.name
  description = "Allow remote inbound SSH"
  direction   = "INGRESS"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = distinct(concat(var.mgmt_source_cidr, local.workstation_ip))
  target_tags   = ["bastion"]
}
