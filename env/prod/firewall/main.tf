terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.84.0"
    }
  }
}

provider "google" {
  credentials = "${var.GOOGLE_CREDENTIALS}"
  project     = "${var.PROJECT_ID}"
  region      = "${var.default_region}"
  zone        = "${var.default_zone}"
}

module "firewall" {
  source            = "../../../modules/firewall_v001"
  vpc_name          = "${var.vpc_name}"
  source_ranges_a   = "${var.source_ranges_iap}"
}