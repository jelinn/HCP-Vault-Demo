# Enable kv-v2 secrets engine in the engineering namespace
resource "vault_mount" "kv-v2" {
  depends_on = [vault_namespace.engineering]
  provider = vault.engineering
  path = "kv-v2"
  type = "kv-v2"
}

# Enable kv-v2 secrets engine in the 'admin/test' namespace at 'secret' path
resource "vault_mount" "secret" {
  depends_on = [vault_namespace.dev]
  provider = vault.dev
  path = "secret"
  type = "kv-v2"
}

# Enable Transit secrets engine at 'transit' in the 'admin/engineering' namespace
resource "vault_mount" "transit" {
  depends_on = [vault_namespace.engineering]
  provider = vault.engineering
  path = "transit"
  type = "transit"
}

