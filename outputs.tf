output "gateway_name" {
  value       = local.name
  description = "string ||| The name of the Gateway created in Kubernetes"
}

output "gateway_namespace" {
  value       = local.namespace
  description = "string ||| The Kubernetes namespace where the Gateway is launched"
}

output "gateway_ip_address" {
  value       = google_compute_global_address.static-ip.address
  description = "string ||| The IP Address of the Gateway"
}

output "certificate_map_name" {
  value       = local.certificate_map_name
  description = <<EOF
string ||| The name of the Certificate Map in Certificate Manager that is attached to the Gateway.
Certificates can be added to this map after the Gateway has been created.
EOF
}
