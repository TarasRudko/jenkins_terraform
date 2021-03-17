variable "cluster" {
  type        = string
  description = "GKE cluster name to deploy"
  default     = "jenkins-test"
}

variable "project" {
  type        = string
  description = "The name of the GCP project to create the resources in"
  default     = "ruta2-303211"
}

variable "region" {
  type        = string
  description = "Google Cloud Region to deploy the stack"
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "Google Cloud Zone to deploy the stack"
  default     = "us-central1-c"
}
