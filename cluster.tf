data "ns_connection" "cluster" {
  name     = "cluster"
  contract = "cluster/gcp/k8s:gke"
}

locals {
  cluster_endpoint          = data.ns_connection.cluster.outputs.cluster_endpoint
  cluster_ca_certificate    = data.ns_connection.cluster.outputs.cluster_ca_certificate
  cluster_default_namespace = data.ns_connection.cluster.outputs.default_namespace
}

// See https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config#example-usage-configure-kubernetes-provider-with-oauth2-access-token
data "google_client_config" "provider" {}

provider "kubernetes" {
  host                   = "https://${local.cluster_endpoint}"
  token                  = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(local.cluster_ca_certificate)
}
