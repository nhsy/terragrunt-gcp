data "google_compute_zones" "available" {
  region = var.region
  status = "UP"
}

resource "random_shuffle" "zone" {
  input        = data.google_compute_zones.available.names
  result_count = 1
}

data "google_compute_image" "centos7" {
  family  = "centos-7"
  project = "centos-cloud"
}

data "google_compute_default_service_account" "this" {}

