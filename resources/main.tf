# Terraform configuration for AWS resources
# Security group, EC2 instance, and Route 53 record for the frontend application 

resource "aws_security_group" "allow_ports_firewall_roboshop" {
  name        = "allow_ports_firewall_roboshop"
  description = "Allow roboshop firewall inbound traffic and all outbound traffic"
  vpc_id      = "vpc-0fcbf944165ec4597"
  tags = {
    Name = "allow_ports_firewall_roboshop"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ports_firewall_roboshop" {
  security_group_id = aws_security_group.allow_ports_firewall_roboshop.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_ports_firewall_roboshop.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.allow_ports_firewall_roboshop.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


resource "aws_instance" "frontend" {
  ami           = "ami-00adafae70b8029d8"
  instance_type = "t3.small"
  security_groups = [aws_security_group.allow_ports_firewall_roboshop.id]
  key_name     = "aws-helpag"
  tags = {
    Name = "frontend-dev"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z01214421PKKTLXAI5VN5"
  name    = "frontend-dev"
  type    = "A"
  ttl     = 300
  records = [aws_instance.frontend.public_ip]
}