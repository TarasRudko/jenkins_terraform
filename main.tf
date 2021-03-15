terraform {
  backend "gcs" {
    bucket = "ruta2-303211-tfstate-abc"
    credentials = "./creds/serviceaccount.json"
  }
}
