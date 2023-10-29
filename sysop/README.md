# Sysop

A tiny remote system management server.

Dependencies: netcat and a hash function.

## Raison d'être
OpenBSD does not configure QEMU's power button.
(I assume it's [this driver](https://man.openbsd.org/acpibtn.4) if one feels up to some hacking.)
Which is fine, in my real use case running on AWS EC2 the power-off button works out-of-the-box.
(I assume OpenBSD plays nicer with Xen.)
However after many forceful shutdowns (Ctrl-C and kill QEMU) eventually the filesystem will end up too inconsistent to boot.
Which is fine, the driving idea behind this project is to be able to rely only on the specification to make a reproducible system.
But not a particularily nice first user experience.
And I bet you'll be on your last fanciest production setup when forgetting to `shutdown -p now` manually.
Thus a way forward would be to integrate this into the script: perhaps something like a set of embedded default/cookbook patches?
