resource "aws_instance" "app" {
  ami = local.image
  instance_type = "t2.nano"

  security_groups = [ aws_security_group.sg.name ]

  tags = {
    Name = "foo"
    GitRepo = var.git-repo
  }
}

resource "aws_security_group" "sg" {
  name = "${var.prefix}sg"

  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol = "tcp"
    from_port = 80
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    GitRepo = var.git-repo
  }
}
