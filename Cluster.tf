resource "google_container_cluster" "primary_cluster" {
  name     = "bauhaus-cluster" 
  location = "us-central1"        

  network    = google_compute_network.vpc_network.name
  subnetwork = google_compute_subnetwork.us_subnet.name

  remove_default_node_pool = true 
  initial_node_count       = 1    

  networking_mode = "VPC_NATIVE"   

  ip_allocation_policy {
    cluster_secondary_range_name  = "pods"
    services_secondary_range_name = "services"
  }

  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  cluster    = google_container_cluster.primary_cluster.name   
  location   = google_container_cluster.primary_cluster.location

  node_count = 2  

  node_config {
    machine_type = "e2-medium"    

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      env = "production"  
    }

    metadata = {
      disable-legacy-endpoints = "true"   
    }

    disk_size_gb = 50   
    disk_type    = "pd-standard"   
  }

  management {
    auto_upgrade = true 
    auto_repair  = true   
  }
}
