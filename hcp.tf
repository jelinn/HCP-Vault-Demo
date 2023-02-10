resource "hcp_hvn" "primary_cluster_hvn" {
  hvn_id         = var.primary_cluster_hvn
  cloud_provider = var.cloud_provider
  region         = var.primary_region
  cidr_block     = var.primary_cluster_hvn_cidr
}

resource "hcp_vault_cluster" "primary_cluster" {
  hvn_id     = hcp_hvn.primary_cluster_hvn.hvn_id
  cluster_id = var.primary_cluster_id
  tier       = var.tier
  public_endpoint = true
}

resource "hcp_hvn" "secondary_cluster_hvn" {
  hvn_id         = var.secondary_cluster_hvn
  cloud_provider = var.cloud_provider
  region         = var.secondary_region
  cidr_block     = var.secondary_cluster_hvn_cidr
}

resource "hcp_vault_cluster" "secondary_cluster" {
  hvn_id          = hcp_hvn.secondary_cluster_hvn.hvn_id
  cluster_id      = var.secondary_cluster_id
  tier            = var.tier
  primary_link    = hcp_vault_cluster.primary_cluster.self_link
  paths_filter    = ["do-not-replicate-namespace", "replicate-namespace/do-not-replicate-secrets"]
  public_endpoint = true
}
