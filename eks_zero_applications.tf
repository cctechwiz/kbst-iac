module "application_custom_manifests" {
  providers = {
    kustomization = kustomization.eks_zero
  }

  source  = "kbst.xyz/catalog/custom-manifests/kustomization"
  version = "0.1.0"

  configuration = {
    apps = {

      resources = [
        "${path.root}/manifests/applications/namespace.yaml",
        "${path.root}/manifests/applications/app-go-prom.yaml"
      ]

      common_labels = {
        "env" = terraform.workspace
      }
    }
    ops = {}
    loc = {}
  }

}
