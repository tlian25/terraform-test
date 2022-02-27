terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}


provider "google" {
  credentials = file(var.credentials_file)
  project     = var.project
  region      = var.region
  zone        = var.zone
}



module "compute-instance" {
  source = "./modules/compute-instance"

}


module "vpc-network" {
  source = "./modules/vpc-network"
}


module "cos" {
  source = "./modules/cos"
  bucket_name = "txl-test-bucket"

  tags = {
    Terraform = "true"
    Environment = "dev"
    Foo = "bar"
  }
}

