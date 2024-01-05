resource "google_compute_network" "custom-net" {
  name                    = "${var.vpc_name}"
  # custom subnet mode
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet1" {
  private_ip_google_access = true
  name                     = "${var.vpc_name}-subnet1"
  network                  = google_compute_network.custom-net.self_link
  ip_cidr_range            = var.subnet_cidr
  region                   = var.default_region
}

resource "google_compute_router" "project-router" {
  name    = "${var.vpc_name}-nat-router"
  network = google_compute_network.custom-net.self_link
  region  = google_compute_subnetwork.subnet1.region
}
