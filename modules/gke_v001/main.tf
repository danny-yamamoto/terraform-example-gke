# Define agentpool and cluster
resource "google_container_cluster" "k8s" {
  name               = var.cluster_name
  location           = var.location
  initial_node_count = 1
  network            = var.vpc_name
  subnetwork         = var.subnet
  min_master_version = var.min_master_version

  private_cluster_config {
    enable_private_endpoint = "false"
    enable_private_nodes    = "true"
    master_ipv4_cidr_block  = var.master_range
  }

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = var.pod_range
    services_ipv4_cidr_block = var.service_range
  }

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }

  node_config {
    machine_type = "e2-medium"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    labels = {
      agentpool = "agentpool"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.full_control",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append",
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/bigquery",
    ]
  }
}

resource "google_compute_router" "project-router" {
  name    = "${var.cluster_name}-nat-router"
  network = var.vpc_name
  region  = var.region
}

resource "google_container_node_pool" "pool-hoge" {
  name       = "pool-hoge"
  location   = var.location
  cluster    = google_container_cluster.k8s.name
  node_count = 1

  autoscaling {
    max_node_count = 1
    min_node_count = 1
  }

  node_config {
    preemptible  = false
    machine_type = "e2-standard-4"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    labels = {
      agentpool = "hoge"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.full_control",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append",
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/bigquery",
    ]
  }
}