# resource "aws_db_subnet_group" "this" {
#   name       = "${var.db_name}-subnet-group"
#   subnet_ids = var.subnet_ids
# }
resource "aws_subnet" "main" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}
resource "aws_db_subnet_group" "this" {
  name       = "${var.db_name}-subnet-group"
  subnet_ids = [aws_subnet.main.id]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "this" {
  identifier        = var.db_name
  engine            = var.engine
  instance_class    = var.instance_class
  allocated_storage = 20
  username          = var.username
  password          = var.password
  db_subnet_group_name = aws_db_subnet_group.this.name
  skip_final_snapshot  = true
  publicly_accessible  = false
}

