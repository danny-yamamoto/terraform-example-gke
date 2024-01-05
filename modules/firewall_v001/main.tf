resource "google_compute_firewall" "firewall-a" {
  name          = "${var.vpc_name}-rule-a"
  network       = var.vpc_name
  direction     = "INGRESS"
  source_ranges = var.source_ranges_a

  allow {
    protocol = "tcp"
  }
}