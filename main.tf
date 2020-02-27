provider "aws" {
  region = var.region
}

resource "aws_key_pair" "terraform-keys2" {
  key_name = "tf-keys2"
  public_key = file("${path.root}/tf-keys2.pub")
}
