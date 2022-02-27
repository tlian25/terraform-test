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


## Refactor to modules

module "vpc-network" {
  source = "./modules/vpc-network"
}


module "compute-instance" {
  source = "./modules/compute-instance"

  # From vpc-network outputs
  vpc_network_name = module.vpc-network.vpc_network_name

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

