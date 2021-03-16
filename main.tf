terraform {
  backend "gcs" {
    bucket = "ruta2-303211-tfstate-abc"
    credentials = "./creds/serviceaccount.json"
  }
}

terraform {
  required_version = ">= 0.14"
  required_providers {
    google      = "~> 3.55.0"
    google-beta = "~> 3.55.0"
  }
}

provider "google" {
  region  = var.region
  project = var.project
}

provider "google-beta" {
  region  = var.region
  project = var.project
}
