resource "scaleway_k8s_cluster_beta" "this" {
  name              = var.name
  description       = var.description
  version           = var.version
  cni               = var.cni
  enable_dashboard  = var.enable_dashboard
  ingress           = var.ingress
  tags              = var.tags
  feature_gates     = var.feature_gates
  admission_plugins = var.admission_plugins
  default_pool      = var.default_pool
  region            = var.region
  organization_id   = var.organization_id

  dynamic "autoscaler_config" {
    for_each = var.enable_cluster_autoscaler ? [1] : []

    content {
      disable_scale_down              = var.disable_scale_down
      scale_down_delay_after_add      = var.scale_down_delay_after_add
      scale_down_unneeded_time        = var.scale_down_unneeded_time
      estimator                       = var.estimator
      expander                        = var.expander
      ignore_daemonsets_utilization   = var.ignore_daemonsets_utilization
      balance_similar_node_groups     = var.balance_similar_node_groups
      expendable_pods_priority_cutoff = var.expendable_pods_priority_cutoff
    }
  }

  dynamic "auto_upgrade" {
    for_each = var.enable_auto_upgrade ? [1] : []

    content {
      enable                          = var.enable_auto_upgrade
      maintenance_window_start_hour   = var.maintenance_window_start_hour
      maintenance_window_day          = var.maintenance_window_day
    }
  }
}


