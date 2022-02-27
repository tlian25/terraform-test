variable "bucket_name" {
  description = "Name of COS bucket. Must be unique."
  type        = string
}

variable "tags" {
  description = "Tags to be set on the bucket."
  type        = map(string)
  default     = {}
}

variable "region" {
  description = "Google Cloud Region"
  type        = string
  default     = "us-central1"
}