provider "aws" {
  access_key = "AKIAQMCUO6O2DNJ3JNJI"
  secret_key = "mGglGDHi72XSg9ZNr7MHyBzvlTTxuI85RmIBxGg/"
  region = "ap-south-1"  # Update with your desired AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-0f5ee92e2d63afc18"  # Update with your desired AMI ID
  instance_type = "t2.micro"  # Update with your desired instance type

  tags = {
    Name = "example-instance"
  }
}