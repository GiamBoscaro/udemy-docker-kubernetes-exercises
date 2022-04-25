# ES 4 - Reverse Proxy

The frontend code runs on the browser, so it is external to the cluster. But the proxy code runs inside the cluster, so nginx can use the Kubernetes CoreDNS domains.