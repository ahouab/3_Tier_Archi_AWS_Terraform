resource "aws_s3_bucket" "example" {
  bucket = "${var.bucket_name}-${terraform.workspace}"

  tags = {
    Name = "${var.bucket_name}-${terraform.workspace}"
  }
}
