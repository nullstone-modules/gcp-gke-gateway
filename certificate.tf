data "ns_connection" "certificate" {
  name     = "certificate"
  contract = "block/gcp/certificate-manager"
}

locals {
  certificate_map_name = data.ns_connection.certificate.outputs.certificate_map_name
}
