# gcp-gke-gateway

Creates a standalone Kubernetes Gateway using GCP Load Balancers.

This does not route traffic to any backends.
Use capabilities and other blocks to route traffic from this Gateway to a backend.

## HTTPS

This module creates a Gateway that is listening via `HTTPS:443` on the public internet through a newly-created static IP address.
In order to support this, this module requires a `certificate-map` connection that contains a GCP Certificate Map.

While the Certificate Map must exist at creation of this Gateway, additional SSL Certificates may be added to the Certificate Map after the Gateway is created.
