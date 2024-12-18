terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = "kayuze1st"
  credentials = file("kayuze1st-816fd8514c87.json")
}
