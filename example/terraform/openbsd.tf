locals {
  image = aws_ami.openbsd-74-8CFGY.id
}
import {
  to = aws_ami.openbsd-74-8CFGY
  id = "ami-0bd2c5ad553ff64d7"
}

resource "aws_ami" "openbsd-74-8CFGY" {
  name = "foo-openbsd-74-8CFGY"
  root_device_name = "/dev/sda1"
  virtualization_type = "hvm"
  architecture = "x86_64"
  ebs_block_device {
    snapshot_id = aws_ebs_snapshot.openbsd-74-8CFGY.id
    device_name = "/dev/sda1"
  }
  tags = {
    Name = "foo-openbsd-74-8CFGY"
    Os = "OpenBSD"
    OsArch = "amd64"
    OsVersion = "7.4"
  }
}

import {
  to = aws_ebs_snapshot.openbsd-74-8CFGY
  id = "snap-061e9659b32cb8492"
}

resource "aws_ebs_snapshot" "openbsd-74-8CFGY" {
  volume_id = "vol-ffffffff"
  tags = {
    Name = "foo-openbsd-74-8CFGY"
    Os = "OpenBSD"
    OsArch = "amd64"
    OsVersion = "7.4"
  }
}
