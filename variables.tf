variable "name" {
  type        = string
  description = "(Required) The name for the Kubernetes cluster."
}

variable "description" {
  default     = null
  type        = string
  description = "(Optional) A description for the Kubernetes cluster."
}

variable "k8s_version" {
  type        = string
  description = "(Required) The version of the Kubernetes cluster."
}

variable "cni" {
  type        = string
  description = "(Required) The Container Network Interface (CNI) for the Kubernetes cluster. ~> Important: Updates to this field will recreate a new resource."
}

variable "enable_dashboard" {
  default     = false
  type        = bool
  description = "(Defaults to false) Enables the Kubernetes dashboard for the Kubernetes cluster. ~> Important: Updates to this field will recreate a new resource."
}

variable "ingress" {
  default     = null
  type        = string
  description = "(Defaults to none) The ingress controller to be deployed on the Kubernetes cluster. ~> Important: Updates to this field will recreate a new resource."
}

variable "tags" {
  default     = []
  type        = list
  description = "(Optional) The tags associated with the Kubernetes cluster."
}

variable "enable_autoscaler_config" {
  default     = false
  type        = bool
  description = "(Optional) Enables the Kubernetes cluster autoscaler."
}

variable "disable_scale_down" {
  default     = false
  type        = bool
  description = "(Defaults to false) Disables the scale down feature of the autoscaler."
}

variable "scale_down_delay_after_add" {
  default     = "10m"
  type        = string
  description = "(Defaults to 10m) How long after scale up that scale down evaluation resumes."
}

variable "scale_down_unneeded_time" {
  default     = "10m"
  type        = string
  description = "(Default to 10m) How long a node should be unneeded before it is eligible for scale down."
}

variable "estimator" {
  default     = "binpacking"
  type        = string
  description = "(Defaults to binpacking) Type of resource estimator to be used in scale up."
}

variable "expander" {
  default     = "random"
  type        = string
  description = "(Default to random) Type of node group expander to be used in scale up."
}

variable "ignore_daemonsets_utilization" {
  default     = false
  type        = bool
  description = "(Defaults to false) Ignore DaemonSet pods when calculating resource utilization for scaling down."
}

variable "balance_similar_node_groups" {
  default     = false
  type        = bool
  description = "(Defaults to false) Detect similar node groups and balance the number of nodes between them."
}

variable "expendable_pods_priority_cutoff" {
  default     = "-10"
  type        = string
  description = "(Defaults to -10) Pods with priority below cutoff will be expendable. They can be killed without any consideration during scale down and they don't cause scale up. Pods with null priority (PodPriority disabled) are non expendable."
}

variable "enable_auto_upgrade" {
  default     = false
  type        = bool
  description = "(Optional) Set to true to enable Kubernetes patch version auto upgrades. ~> Important: When enabling auto upgrades, the version field take a minor version like x.y (ie 1.18)."
}

variable "maintenance_window_start_hour" {
  default     = null
  type        = string
  description = "(Optional) The start hour (UTC) of the 2-hour auto upgrade maintenance window (0 to 23)."
}

variable "maintenance_window_day" {
  default     = null
  type        = string
  description = "(Optional) The day of the auto upgrade maintenance window (monday to sunday, or any)."
}

variable "feature_gates" {
  default     = []
  type        = list
  description = "(Optional) The list of feature gates to enable on the cluster."
}

variable "admission_plugins" {
  default     = []
  type        = list
  description = "(Optional) The list of admission plugins to enable on the cluster."
}

variable "region" {
  default     = null
  type        = string
  description = "(Defaults to provider region) The region in which the cluster should be created."
}

variable "organization_id" {
  default     = null
  type        = string
  description = "(Defaults to provider organization_id) The ID of the organization the cluster is associated with."
}
