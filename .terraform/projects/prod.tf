# main.tf

module "gcp_deployment" {
  source                = "../modules/deployment"
  service_account       = "KEY_HERE"
  project_id            = "prod"
  bucket_name           = "prod-storage-bucket"
  cluster_name          = "prod-cluster"
  node_pool_name        = "prod-node-pool"
  node_pool_size        = 3
  machine_type          = "n1-standard-2"
  autoscaling_min_nodes = 1
  autoscaling_max_nodes = 10
  global_address_name   = "prod-address"
}
