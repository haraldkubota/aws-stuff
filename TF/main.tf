data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "ssh_and_web_sg" {
  name        = "ssh-and-web-sg"
  description = "Allow incoming and outgoing traffic on port 22, 80 and 443"
  vpc_id      = data.aws_vpc.default.id
  ingress {
    description = "SSH ingress"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH ingress"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "my_ec2" {
  ami           = var.ec2_ami
  instance_type = var.ec2_type
  key_name      = var.ssh_key_name
  vpc_security_group_ids = [
    aws_security_group.ssh_and_web_sg.id
  ]
  associate_public_ip_address = true
  tags = {
    Name = "${var.name_prefix}-MyEC2",
    Env  = "${var.environment}"
  }
}

resource "cloudflare_dns_record" "ec2_qw2_dns_record" {
  zone_id = "${var.cloudflare_dns_id}"
  comment = "My EC2 Instance"
  content = aws_instance.my_ec2.public_ip
  name    = "myec2"
  proxied = false
  ttl     = 300
  type    = "A"
}


output "instance_ips" {
  value = aws_instance.my_ec2.public_dns
}
