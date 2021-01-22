# Scaleway  Kapsule Terraform module

Terraform module which creates Kapsule resources on Scaleway

## Terraform versions

Terraform 0.13

## Usage

```hcl
module "kapsule" {
  source = "github.com/GekoCloud/terraform-scaleway-kapsule"

  name        = "my-kapsule"
  k8s_version = "1.17.5"
  cni         = "cilium"

  node_pools = {
    "default" = {
      "node_type" = "dev1_l"
      "size"      = 1
    }
  }
}
```

## Examples

* [Simple cluster](examples/simple-cluster)
* [Complete cluster](examples/complete-cluster)

## License

Apache 2 Licensed. See LICENSE for full details.