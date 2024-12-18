resource "google_compute_instance" "bauhaus-us-vm" {
  name         = "bauhaus-us"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.us_subnet.self_link
    network_ip = null
    access_config {} 
  }

  tags = ["http-https-allowed"]
}

resource "google_compute_instance" "bahaus-europe-vm" {
  name         = "bauhaus-europe"
  machine_type = "e2-micro"
  zone         = "europe-west1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.europe_subnet.self_link
    network_ip = null
    access_config {} 
  }

  tags = ["http-https-allowed"]
}
    