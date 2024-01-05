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
  region      = "${var.region}"
  zone        = "${var.location}"
}

module "gke" {
    source             = "../../../modules/gke_v002"
    PROJECT_ID         = "${var.PROJECT_ID}"
    cluster_name       = "${var.cluster_name}"
    location           = "${var.location}"
    vpc_name           = "${var.vpc_name}"
    region             = "${var.region}"
    subnet             = "${var.subnet}"
    pod_range          = "${var.pod_range}"
    service_range      = "${var.service_range}"
    master_range       = "${var.master_range}"
    min_master_version = "${var.min_master_version}"
}