module "simple" {
  source = "../.."

  name        = "my-simple-kapsule"
  k8s_version = "1.17.5"
  cni         = "cilium"

  node_pools = {
    "default" = {
      "node_type" = "DEV1_L"
      "size"      = 1
    }
  }
}
