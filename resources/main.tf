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
  cidr_ipv4         = aws_vpc_security_group_egress_rule.allow_all_traffic_ipv4.cidr_ipv4
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}
 

resource "aws_vpc_security_group_ingress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_ports_firewall_roboshop.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_ports_firewall_roboshop.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


## FRONTEND DEV EC2 INSTANCE


resource "aws_instance" "frontend-dev" {
  ami           = "ami-00adafae70b8029d8"
  instance_type = "t3.small"
  security_groups = [aws_security_group.allow_ports_firewall_roboshop.name]
  key_name     = "aws-helpag"
  tags = {
    Name = "frontend-dev"
  }
}

resource "aws_route53_record" "frontend-dev" {
  zone_id = "Z01214421PKKTLXAI5VN5"
  name    = "frontend-dev"
  type    = "A"
  ttl     = 300
  records = [aws_instance.frontend-dev.public_ip]
}

## MONGODB DEV EC2 INSTANCE 

resource "aws_instance" "mongodb-dev" {
  ami           = "ami-00adafae70b8029d8"
  instance_type = "t3.small"
  security_groups = [aws_security_group.allow_ports_firewall_roboshop.name]
  key_name     = "aws-helpag"
  tags = {
    Name = "mongodb-dev"
  }
}

resource "aws_route53_record" "mongodb-dev" {
  zone_id = "Z01214421PKKTLXAI5VN5"
  name    = "mongodb-dev"
  type    = "A"
  ttl     = 300
  records = [aws_instance.mongodb-dev.public_ip]
}

## CATALOGUE DEV EC2 INSTANCE

resource "aws_instance" "catalogue-dev" {
  ami           = "ami-00adafae70b8029d8"
  instance_type = "t3.small"
  security_groups = [aws_security_group.allow_ports_firewall_roboshop.name]
  key_name     = "aws-helpag"
  tags = {
    Name = "catalogue-dev"
  }
}

resource "aws_route53_record" "catalogue-dev" {
  zone_id = "Z01214421PKKTLXAI5VN5"
  name    = "catalogue-dev"
  type    = "A"
  ttl     = 300
  records = [aws_instance.catalogue-dev.public_ip]
}


##  REDIS DEV EC2 INSTANCE

resource "aws_instance" "redis-dev" {
  ami           = "ami-00adafae70b8029d8"
  instance_type = "t3.small"
  security_groups = [aws_security_group.allow_ports_firewall_roboshop.name]
  key_name     = "aws-helpag"
  tags = {
    Name = "redis-dev"
  }
}

resource "aws_route53_record" "redis-dev" {
  zone_id = "Z01214421PKKTLXAI5VN5"
  name    = "redis-dev"
  type    = "A"
  ttl     = 300
  records = [aws_instance.redis-dev.public_ip]
}

## USER DEV EC2 INSTANCE


resource "aws_instance" "user-dev" {
  ami           = "ami-00adafae70b8029d8"
  instance_type = "t3.small"
  security_groups = [aws_security_group.allow_ports_firewall_roboshop.name]
  key_name     = "aws-helpag"
  tags = {
    Name = "user-dev"
  }
}

resource "aws_route53_record" "user-dev" {
  zone_id = "Z01214421PKKTLXAI5VN5"
  name    = "user-dev"
  type    = "A"
  ttl     = 300
  records = [aws_instance.user-dev.public_ip]
}


## CART DEV EC2 INSTANCE

resource "aws_instance" "cart-dev" {
  ami           = "ami-00adafae70b8029d8"
  instance_type = "t3.small"
  security_groups = [aws_security_group.allow_ports_firewall_roboshop.name]
  key_name     = "aws-helpag"
  tags = {
    Name = "cart-dev"
  }
}

resource "aws_route53_record" "cart-dev" {
  zone_id = "Z01214421PKKTLXAI5VN5"
  name    = "cart-dev"
  type    = "A"
  ttl     = 300
  records = [aws_instance.cart-dev.public_ip]
}


## MYSQL DEV EC2 INSTANCE

resource "aws_instance" "mysql-dev" {
  ami           = "ami-00adafae70b8029d8"
  instance_type = "t3.small"
  security_groups = [aws_security_group.allow_ports_firewall_roboshop.name]
  key_name     = "aws-helpag"
  tags = {
    Name = "mysql-dev"
  }
}

resource "aws_route53_record" "mysql-dev" {
  zone_id = "Z01214421PKKTLXAI5VN5"
  name    = "mysql-dev"
  type    = "A"
  ttl     = 300
  records = [aws_instance.mysql-dev.public_ip]
}

## SHIPPING DEV EC2 INSTANCE


resource "aws_instance" "shipping-dev" {
  ami           = "ami-00adafae70b8029d8"
  instance_type = "t3.small"
  security_groups = [aws_security_group.allow_ports_firewall_roboshop.name]
  key_name     = "aws-helpag"
  tags = {
    Name = "shipping-dev"
  }
}

resource "aws_route53_record" "shipping-dev" {
  zone_id = "Z01214421PKKTLXAI5VN5"
  name    = "shipping-dev"
  type    = "A"
  ttl     = 300
  records = [aws_instance.shipping-dev.public_ip]
}

## RABBITMQ DEV EC2 INSTANCE

resource "aws_instance" "rabbitmq-dev" {
  ami           = "ami-00adafae70b8029d8"
  instance_type = "t3.small"
  security_groups = [aws_security_group.allow_ports_firewall_roboshop.name]
  key_name     = "aws-helpag"
  tags = {
    Name = "rabbitmq-dev"
  }
}

resource "aws_route53_record" "rabbitmq-dev" {
  zone_id = "Z01214421PKKTLXAI5VN5"
  name    = "rabbitmq-dev"
  type    = "A"
  ttl     = 300
  records = [aws_instance.rabbitmq-dev.public_ip]
}


## PAYMENT DEV EC2 INSTANCE

resource "aws_instance" "payment-dev" {
  ami           = "ami-00adafae70b8029d8"
  instance_type = "t3.small"
  security_groups = [aws_security_group.allow_ports_firewall_roboshop.name]
  key_name     = "aws-helpag"
  tags = {
    Name = "payment-dev"
  }
}

resource "aws_route53_record" "payment-dev" {
  zone_id = "Z01214421PKKTLXAI5VN5"
  name    = "payment-dev"
  type    = "A"
  ttl     = 300
  records = [aws_instance.payment-dev.public_ip]
}


## End of Terraform configuration for AWS resources
