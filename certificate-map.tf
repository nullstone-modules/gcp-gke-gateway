data "ns_connection" "certificate_map" {
  name     = "certificate-map"
  contract = "datastore/gcp/tls:certificate-map"
}

locals {
  certificate_map_name = data.ns_connection.certificate_map.outputs.certificate_map_name
}
