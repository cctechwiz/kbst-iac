module "eks_zero_prometheus" {
  providers = {
    kustomization = kustomization.eks_zero
  }
  source  = "kbst.xyz/catalog/prometheus/kustomization"
  version = "0.51.1-kbst.0"
}
