// Enforces TLS 1.2+ on the Gateway's HTTPS listener.
resource "google_compute_ssl_policy" "this" {
  name            = local.resource_name
  min_tls_version = "TLS_1_2"
  profile         = "RESTRICTED"
}

resource "kubernetes_manifest" "gateway_policy" {
  manifest = {
    apiVersion = "networking.gke.io/v1"
    kind       = "GCPGatewayPolicy"

    metadata = {
      name      = local.resource_name
      namespace = local.namespace
      labels    = local.labels
    }

    spec = {
      default = {
        sslPolicy = google_compute_ssl_policy.this.name
      }

      targetRef = {
        group = "gateway.networking.k8s.io"
        kind  = "Gateway"
        name  = local.resource_name
      }
    }
  }
}
