module "eks_zero" {
  providers = {
    aws = aws.eks_zero
  }

  source = "github.com/kbst/terraform-kubestack//aws/cluster?ref=v0.15.1-beta.1"

  configuration = {
    apps = {
      name_prefix = "kbst-tut"

      base_domain = "cctechwiz.com"

      cluster_instance_type    = "t3.small"
      cluster_desired_capacity = "1"
      cluster_min_size         = "1"
      cluster_max_size         = "3"

      cluster_availability_zones = "us-west-2a,us-west-2b,us-west-2c,us-west-2d"
    }

    ops = {}

    loc = {
      node_image = "ghcr.io/kbst/kind-eks-d:v1.21.2-kbst.0"
    }
  }
}
