# Create an admins policy in the admin namespace
resource "vault_policy" "admin_policy" {
  provider = vault.admin
  name   = "admins"
  policy = file("policies/admin-policy.hcl")
}

# Create an admins policy in the admin/education namespace
resource "vault_policy" "admin_policy_engineering" {
  provider = vault.engineering
  depends_on = [vault_namespace.engineering]
  name   = "admins"
  policy = file("policies/admin-policy.hcl")
}

# Create an admins policy in the admin/education/training namespace
resource "vault_policy" "admin_policy_dev" {
  provider = vault.engineering-dev
  depends_on = [vault_namespace.engineering-dev]
  name   = "admins"
  policy = file("policies/admin-policy.hcl")
}

# Create an admins policy in the admin/education/training namespace
resource "vault_policy" "admin_policy_training" {
  provider = vault.training
  depends_on = [vault_namespace.engineering-training]
  name   = "admins"
  policy = file("policies/admin-policy.hcl")
}

# Create admins policy in the admin/security namespace
resource "vault_policy" "admin_policy_security" {
  provider = vault.security
  depends_on = [vault_namespace.security]
  name   = "admins"
  policy = file("policies/admin-policy.hcl")
}

# Create admins policy in the admin/marketing namespace
resource "vault_policy" "admin_policy_marketing" {
  provider = vault.marketing
  depends_on = [vault_namespace.marketing]
  name   = "admins"
  policy = file("policies/admin-policy.hcl")
}


# Create an admins policy in the admin/test namespace
resource "vault_policy" "admin_policy_test" {
  provider = vault.test
  depends_on = [vault_namespace.test]
  name   = "admins"
  policy = file("policies/admin-policy.hcl")
}

# Create a tester policy in the admin/test namespace
resource "vault_policy" "tester_policy" {
  provider = vault.test
  depends_on = [vault_namespace.test]
  name   = "tester"
  policy = file("policies/tester.hcl")
}
