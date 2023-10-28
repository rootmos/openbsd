# OpenBSD image builder
[![Tests](https://github.com/rootmos/openbsd/actions/workflows/tests.yaml/badge.svg?branch=main)](https://github.com/rootmos/openbsd/actions/workflows/tests.yaml)

An [OpenBSD](https://www.openbsd.org/) image builder.

Or a love letter to OpenBSD made with blood sweat and tears.

Or one way tame [Qemu](https://www.qemu.org/) and [autoinstall](https://man.openbsd.org/autoinstall.8) using [Python's asyncio](https://docs.python.org/3/library/asyncio.html).

## TL;DR
```shell
./openbsd build disk.img
./openbsd ssh disk.img
```

## Design goals
* Configuration-less: playground for reluctant hackers
* Audit-trail friendly: the specification file controls everything
* Run in unprivileged mode: no more sudo
* Minimal dependencies: newish Python (>=3.11) and Qemu, i.e. no pip only standand library
  - optionally [signify](https://man.openbsd.org/signify) and socat
* Cloud friendly: upload and register the images as AWS AMIs
* Stable over time: convenient (read: doable) to add new versions (or old versions?)
