resource "google_compute_ha_vpn_gateway" "ha_gateway1" {
  region   = "us-central1"
  name     = "ha-vpn-1"
  network  = google_compute_network.network1.id
}

resource "google_compute_network" "network1" {
  name                    = "network1"
  auto_create_subnetworks = false
}

