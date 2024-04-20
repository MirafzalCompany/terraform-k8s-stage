resource "digitalocean_container_registry" "registry" {
  name                   = "mirafzal-company-registry"
  subscription_tier_slug = "starter"
  region                 = "ams3"
}