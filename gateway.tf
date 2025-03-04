locals {
  name      = local.resource_name
  namespace = local.cluster_default_namespace
}

resource "kubernetes_manifest" "gateway" {
  manifest = {
    apiVersion = "gateway.networking.k8s.io/v1beta1"
    kind       = "Gateway"

    metadata = {
      name      = local.resource_name
      namespace = local.namespace
      labels    = local.labels

      annotations = {
        "networking.gke.io/certmap" = local.certificate_map_name
      }
    }

    spec = {
      gatewayClassName = "gke-l7-global-external-managed"

      listeners = [
        {
          name     = "https"
          protocol = "HTTPS"
          port     = 443

          allowedRoutes = {
            namespaces = {
              from = "All"
            }
          }
        }
      ]

      addresses = [
        {
          type  = "NamedAddress"
          value = google_compute_global_address.static-ip.name
        }
      ]
    }
  }
}