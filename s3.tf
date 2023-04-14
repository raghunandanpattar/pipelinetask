resource "aws_s3_bucket" "raghus-bucket-89511" {
  bucket = "raghus-bucket-89511"
  acl = "private"

   versioning {
    enabled = true
   }
}