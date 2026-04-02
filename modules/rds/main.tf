# -------- Security Group for RDS --------
resource "aws_security_group" "rds_sg" {
  name   = "rds-sg"
  vpc_id = var.vpc_id

  ingress {
    description     = "MySQL from EC2"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.allowed_ec2_sg]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

# -------- Subnet Group --------
resource "aws_db_subnet_group" "db_subnet" {
  name       = "rds-subnet-group"
  subnet_ids = var.private_subnet_ids
  tags       = var.tags
}

# -------- RDS Instance --------
resource "aws_db_instance" "mysql" {
  identifier              = "demo-mysql"
  engine                  = var.engine
  instance_class          = var.instance_class
  allocated_storage       = 20
  db_name                 = var.db_name
  username                = var.username
  password                = var.password
  db_subnet_group_name    = aws_db_subnet_group.db_subnet.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id] 
  publicly_accessible     = false
  skip_final_snapshot     = true

  tags = var.tags
}