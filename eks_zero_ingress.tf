module "eks_zero_nginx" {
  providers = {
    kustomization = kustomization.eks_zero
  }
  source  = "kbst.xyz/catalog/nginx/kustomization"
  version = "0.46.0-kbst.1"

  configuration = {
    apps = {}

    ops = {}

    loc = {}
  }
}

module "eks_zero_dns_zone" {
  providers = {
    aws        = aws.eks_zero
    kubernetes = kubernetes.eks_zero
  }

  source = "github.com/kbst/terraform-kubestack//aws/cluster/elb-dns?ref=v0.15.1-beta.1"

  ingress_service_name      = "ingress-nginx-controller"
  ingress_service_namespace = "ingress-nginx"

  metadata_fqdn = module.eks_zero.current_metadata["fqdn"]

  depends_on = [module.eks_zero, module.eks_zero_nginx]
}
