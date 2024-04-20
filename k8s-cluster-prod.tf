# resource "digitalocean_kubernetes_cluster" "k8s-prod" {
#   name         = "mirafzal-company-prod-k8s"
#   region       = "ams3"
#   version      = "1.29.1-do.0"
#   auto_upgrade = false
#   ha = true
#   node_pool {
#     name       = "worker-nodes"
#     size       = "s-4vcpu-8gb"
#     node_count = 3
#     auto_scale = true
#     min_nodes  = 3
#     max_nodes  = 4
#   }
# }
#
# output "kubeconfig-prod" {
#   value = digitalocean_kubernetes_cluster.k8s.kube_config[0].raw_config
#   sensitive = true
# }
