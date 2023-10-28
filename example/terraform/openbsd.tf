locals {
  image = aws_ami.foo-openbsd-74-OBpuV.id
}

import {
  to = aws_ami.foo-openbsd-74-OBpuV
  id = "ami-0e839a12646c2f4e8"
}

resource "aws_ami" "foo-openbsd-74-OBpuV" {
  name = "foo-openbsd-74-OBpuV"
  root_device_name = "/dev/sda1"
  virtualization_type = "hvm"
  architecture = "x86_64"
  ebs_block_device {
    snapshot_id = aws_ebs_snapshot.foo-openbsd-74-OBpuV.id
    device_name = "/dev/sda1"
  }
  tags = {
    App = "foo"
    Name = "foo-openbsd-74-OBpuV"
    Os = "OpenBSD"
    OsArch = "amd64"
    OsVersion = "7.4"
  }
}

import {
  to = aws_ebs_snapshot.foo-openbsd-74-OBpuV
  id = "snap-05c2f4a862860398b"
}

resource "aws_ebs_snapshot" "foo-openbsd-74-OBpuV" {
  volume_id = "vol-ffffffff"
  tags = {
    App = "foo"
    Name = "foo-openbsd-74-OBpuV"
    Os = "OpenBSD"
    OsArch = "amd64"
    OsVersion = "7.4"
  }
}
