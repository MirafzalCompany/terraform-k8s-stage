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
