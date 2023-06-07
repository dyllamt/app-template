# main.tf

provider "google" {
  credentials = file(var.service_account)
}

resource "google_project" "project" {
  name       = var.project_id
  project_id = var.project_id
}

resource "google_storage_bucket" "bucket" {
  name     = var.bucket_name
  location = var.region
  project  = google_project.project.project_id
}

resource "google_container_cluster" "cluster" {
  name     = var.cluster_name
  location = var.region

  project = google_project.project.project_id

  node_pool {
    name             = var.node_pool_name
    preemptible      = true
    initial_node_count = var.node_pool_size
    autoscaling {
      min_node_count = var.autoscaling_min_nodes
      max_node_count = var.autoscaling_max_nodes
    }
    management {
      auto_repair  = true
      auto_upgrade = true
    }
    node_config {
      machine_type = var.machine_type
    }
  }
}

resource "google_compute_global_address" "global_address" {
  name    = var.global_address_name
  project = google_project.project.project_id
}
