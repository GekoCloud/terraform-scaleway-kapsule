resource "scaleway_k8s_cluster_beta" "this" {
  name              = var.name
  description       = var.description
  version           = var.k8s_version
  cni               = var.cni
  enable_dashboard  = var.enable_dashboard
  ingress           = var.ingress
  tags              = var.tags
  feature_gates     = var.feature_gates
  admission_plugins = var.admission_plugins
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

resource "scaleway_k8s_pool_beta" "this" {
  for_each    = var.node_pools

  cluster_id          = scaleway_k8s_cluster_beta.this.id
  name                = each.key
  node_type           = each.value.node_type
  size                = each.value.size
  min_size            = lookup(each.value, "min_size", "1")
  max_size            = lookup(each.value, "max_size", each.value.size)
  tags                = lookup(each.value, "tags", [])
  placement_group_id  = lookup(each.value, "placement_group_id", null)
  autoscaling         = lookup(each.value, "autoscaling", false)
  autohealing         = lookup(each.value, "autohealing", false)
  container_runtime   = lookup(each.value, "container_runtime", "docker")
  region              = lookup(each.value, "region", null)
  wait_for_pool_ready = lookup(each.value, "wait_for_pool_ready", false)
}
