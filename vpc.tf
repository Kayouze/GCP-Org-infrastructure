resource "google_compute_network" "vpc_network" {
  name                    = "bauhaus-global"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "us_subnet" {
  name          = "bauhaus-us"
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.self_link

    # Adding secondary IP ranges for GKE pods and services
  secondary_ip_range {
    range_name    = "pods"           
    ip_cidr_range = "10.1.0.0/16"     
  }

  secondary_ip_range {
    range_name    = "services"       
    ip_cidr_range = "10.2.0.0/20"    
  }
}

resource "google_compute_subnetwork" "europe_subnet" {
  name          = "bauhaus-de"
  ip_cidr_range = "10.0.1.0/24"
  region        = "europe-west1"
  network       = google_compute_network.vpc_network.self_link
}

resource "google_compute_firewall" "allow_http_https" {
  name    = "allow-http-https"
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.vpc_network.self_link


  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-https-allowed"]
}
