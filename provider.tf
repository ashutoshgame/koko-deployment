provider "aws" {

  access_key = "AKIAQMCUO6O2DNJ3JNJI"
  secret_key = "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"
  region     = "ap-south-1"
}

######### Security Group ###################

resource "aws_security_group" "http_access" {
  name        = "http_access"
  description = "Allow HTTP inbound traffic"
  ingress {
    description = "HTTP Access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "http_access"
  }
}

################ EC2 Instance ##########################

resource "aws_instance" "kubernetes_instance" {
  ami             = "ami-0f5ee92e2d63afc18"
  instance_type   = "t3.xlarge"
  key_name        = "kube8"
  security_groups = ["http_access"]

  tags = {
    Name = "Kubernetes_machine"
  }
  provisioner "local-exec" {
    command = "echo 'Creation is successful.' >> creation.txt"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo 'Destruction is successful.' >> destruction.txt"
  }
  provisioner "file" {
    source      = "./kube8_installation.sh"
    destination = "/home/ubuntu/kube8_installation.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 777 ./kube8_installation.sh",
      "./kube8_installation.sh",

    ]

  }
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file("./kube8.pem")
    timeout     = "4m"
  }
}

# Output the public IP of the EC2 instance
output "public_ip" {
  value = aws_instance.kubernetes_instance.public_ip
}
