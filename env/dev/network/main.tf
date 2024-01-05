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

module "network" {
  source            = "../../../modules/vpc_v001"
  PROJECT_ID        = "${var.PROJECT_ID}"
  default_region    = "${var.default_region}"
  default_zone      = "${var.default_zone}"
  vpc_name          = "${var.vpc_name}"
  subnet_cidr       = "${var.subnet_cidr}"
}