# OpenBSD image builder
[![Tests](https://github.com/rootmos/openbsd/actions/workflows/tests.yaml/badge.svg?branch=main)](https://github.com/rootmos/openbsd/actions/workflows/tests.yaml)

An [OpenBSD](https://www.openbsd.org/) image builder, or: a love letter to OpenBSD and [Qemu](https://www.qemu.org/) made with blood sweat and tears.

## Design goals
* configuration-less playground for reluctant hackers
* audit-trail: specification controls everything
* run in unprivileged mode
* minimal dependencies: newish python (>=3.11) and qemu (optionally [signify](https://man.openbsd.org/signify) and socat)
* cloud friendly (AWS)
* stable over time: convenient (read doable) to add new versions
