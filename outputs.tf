output "vault_primary_public" {
    value = hcp_vault_cluster.primary_cluster.vault_public_endpoint_url
}

output "vault_primary_private" {
    value = hcp_vault_cluster.primary_cluster.vault_private_endpoint_url
}

output "vault_secondary_public" {
    value = hcp_vault_cluster.secondary_cluster.vault_public_endpoint_url
}

output "vault_secondary_private" {
    value = hcp_vault_cluster.secondary_cluster.vault_private_endpoint_url
}

output "hvn_id" {
    value = hcp_hvn.primary_cluster_hvn.id
}

