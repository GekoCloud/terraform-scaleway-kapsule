module "complete" {
  source = "../.."

  name                          = "my-complete-kapsule"
  k8s_version                   = "1.17.5"
  cni                           = "cilium"
  enable_dashboard              = true
  enable_cluster_autoscaler     = true
  scale_down_delay_after_add    = "5m"
  ignore_daemonsets_utilization = true
  node_pools = {
    "dev" = {
      "node_type"           = "DEV1_L"
      "size"                = 1
      "min_size"            = 1
      "max_size"            = 2
      "autoscaling"         = true
      "autohealing"         = true
      "wait_for_pool_ready" = true
      "tags"                = []
    }
    "gp" = {
      "node_type"           = "GP1-S"
      "size"                = 2
      "min_size"            = 2
      "max_size"            = 5
      "autoscaling"         = true
      "autohealing"         = false
      "wait_for_pool_ready" = true
      "tags"                = [ "gp" ]
    }
  }
}
