resource "google_storage_bucket" "txl-test-bucket" {
  name          = var.bucket_name
  location      = var.region
  force_destroy = true
  storage_class               = "STANDARD"
}