
provider "vault" {
  alias = "admin"
  namespace = "admin"
}

#--------------------------------------
# Create 'admin/eng' namespace
#--------------------------------------
resource "vault_namespace" "engineering" {
  provider = vault.admin
  path = "engineering"
}

provider "vault" {
  alias = "engineering"
  namespace = "admin/engineering"
}

#---------------------------------------------------
# Create 'admin/eng/training' namespace
#---------------------------------------------------
resource "vault_namespace" "engineering-training" {
  depends_on = [vault_namespace.engineering]
  provider = vault.engineering
  path = "training"
}

provider "vault" {
  alias = "training"
  namespace = "admin/engineering/training"
}

#-----------------------------------------------------------
# Create 'admin/eng/dev' namespace
#-----------------------------------------------------------
resource "vault_namespace" "engineering-dev" {
  depends_on = [vault_namespace.engineering]
  provider = vault.engineering
  path = "dev"
}

provider "vault" {
  alias = "engineering-dev"
  namespace = "admin/engineering/dev"
}

#--------------------------------------
# Create 'admin/security' namespace
#--------------------------------------
resource "vault_namespace" "security" {
  provider = vault.admin
  path = "security"
}

provider "vault" {
  alias = "security"
  namespace = "admin/security"
}

#--------------------------------------
# Create 'admin/marketing' namespace
#--------------------------------------
resource "vault_namespace" "marketing" {
  provider = vault.admin
  path = "marketing"
}

provider "vault" {
  alias = "marketing"
  namespace = "admin/marketing"
}