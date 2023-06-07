# variables.tf

variable "service_account" {
  description = "Path to the service account key file"
}

variable "project_id" {
  description = "The ID of the GCP project"
}

variable "region" {
  description = "The region where the bucket and cluster will be located"
  default     = "us-central1"
}

variable "bucket_name" {
  description = "The name of the storage bucket"
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
}

variable "node_pool_name" {
  description = "The name of the node pool"
}

variable "node_pool_size" {
  description = "The initial number of nodes in the node pool"
  default     = 1
}

variable "machine_type" {
  description = "The machine type for the nodes"
  default     = "n1-standard-1"
}

variable "autoscaling_min_nodes" {
  description = "The minimum number of nodes in the node pool autoscaling"
  default     = 1
}

variable "autoscaling_max_nodes" {
  description = "The maximum number of nodes in the node pool autoscaling"
  default     = 5
}

variable "global_address_name" {
  description = "The name of the global compute address"
}
