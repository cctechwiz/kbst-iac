module "eks_zero" {
  providers = {
    aws = aws.eks_zero
  }

  source = "github.com/kbst/terraform-kubestack//aws/cluster?ref=v0.15.1-beta.1"

  configuration = {
    # apps environment
    apps = {
      # Set name_prefix used to generate the cluster_name
      # [name_prefix]-[workspace]-[region]
      # e.g. name_prefix = kbst becomes: `kbst-apps-eu-west-1`
      # for small orgs the name works well
      # for bigger orgs consider department or team names
      name_prefix = ""

      # Set the base_domain used to generate the FQDN of the cluster
      # [cluster_name].[provider_name].[base_domain]
      # e.g. kbst-apps-eu-west-1.aws.infra.example.com
      base_domain = ""

      cluster_instance_type    = "t3.small"
      cluster_desired_capacity = "1"
      cluster_min_size         = "1"
      cluster_max_size         = "3"

      # Comma-separated list of zone names to deploy worker nodes in
      # EKS requires a min. of 2 zones
      # Must match region set in provider
      # e.g. cluster_availability_zones = "eu-west-1a,eu-west-1b,eu-west-1c"
      # FIXME: Use actual list when TF 0.12 finally supports heterogeneous maps
      cluster_availability_zones = ""
    }

    # ops environment, inherits from apps
    ops = {}

    # loc environment, inherits from apps
    loc = {
      node_image = "ghcr.io/kbst/kind-eks-d:v1.21.2-kbst.0"
    }
  }
}
