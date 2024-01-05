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

module "instance_templates" {
  source         = "../../../modules/instance_templates_v001"
  PROJECT_ID     = "${var.PROJECT_ID}"
  default_region = "${var.default_region}"
  default_zone   = "${var.default_zone}"
  template_name  = "${var.template_name}"
  tag            = "${var.tag}"
  label          = "${var.label}"
  machine_type   = "${var.machine_type}"
  network        = "${var.network}"
  email          = "${var.email}"
  disk_size      = var.disk_size
  disk_type      = "${var.disk_type}"
}