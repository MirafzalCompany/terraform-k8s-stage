resource "digitalocean_kubernetes_cluster" "k8s" {
  name         = "mirafzal-company-stage-k8s"
  region       = "ams3"
  version      = "1.29.1-do.0"
  auto_upgrade = true
  node_pool {
    name       = "worker-nodes"
    size       = "s-4vcpu-8gb"
    node_count = 3
    auto_scale = true
    min_nodes  = 3
    max_nodes  = 4
  }
}

output "kubeconfig" {
  value = digitalocean_kubernetes_cluster.k8s.kube_config[0].raw_config
  sensitive = true
}

# resource "digitalocean_container_registry_docker_credentials" "registry_credentials" {
#   registry_name = "mirafzal-company-registry"
# }
#
# data "digitalocean_kubernetes_cluster" "k8s" {
#   name = "mirafzal-company-stage-k8s"
# }
#
# provider "kubernetes" {
#   host  = data.digitalocean_kubernetes_cluster.k8s.endpoint
#   token = data.digitalocean_kubernetes_cluster.k8s.kube_config[0].token
#   cluster_ca_certificate = base64decode(
#     data.digitalocean_kubernetes_cluster.k8s.kube_config[0].cluster_ca_certificate
#   )
# }
#
# resource "kubernetes_secret" "registry_secret" {
#   metadata {
#     name = "mirafzal-company-registry"
#   }
#
#   data = {
#     ".dockerconfigjson" = digitalocean_container_registry_docker_credentials.registry_credentials.docker_credentials
#   }
#
#   type = "kubernetes.io/dockerconfigjson"
# }