terraform {
  required_version = ">= 1.0"
  required_providers {
    helm = {
      version = "~> 2.2.0"
    }
  }
}

resource "helm_release" "cert_manager" {
  name             = "cert-manager"
  namespace        = "cert-manager"
  create_namespace = true
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  version          = "v1.1.0"
  set {
    name  = "installCRDs"
    value = "true"
  }
}
