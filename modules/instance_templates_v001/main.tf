resource "google_compute_instance_template" "default" {
  name        = "${var.template_name}"

  tags = var.tag

  labels = {
    environment = "${var.label}"
  }

  machine_type         = "${var.machine_type}"
  can_ip_forward       = false

  scheduling {
    automatic_restart   = false
  }

  // Create a new boot disk from an image
  disk {
    source_image      = "debian-cloud/debian-9"
    auto_delete       = true
    boot              = true
  }

  // Use an existing disk resource
  disk {
    // Instance Templates reference disks by name, not self link
    source      = google_compute_disk.pv.name
    auto_delete = false
    boot        = false
  }

  network_interface {
    network = "${var.network}"
    subnetwork = "${var.network}-subnet1"
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = var.email
    scopes = ["cloud-platform"]
  }
}

resource "google_compute_disk" "pv" {
  name  = "${var.template_name}-disk"
  image = data.google_compute_image.my_image.self_link
  size  = var.disk_size
  type  = "${var.disk_type}"
  zone  = "${var.default_zone}"
}

data "google_compute_image" "my_image" {
  family  = "debian-9"
  project = "debian-cloud"
}