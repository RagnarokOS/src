Ragnarok source repository
==========================

This contains sources for Ragnarok's base system.

See ISOs and releases here [https://github.com/RagnarokOS/iso](https://github.com/RagnarokOS/iso).  
Binary updates to the base system (sysupdates) are here [https://github.com/RagnarokOS/packages/releases/](https://github.com/RagnarokOS/packages/releases/).

Build
=====

1) Don't attempt to build the whole thing at once. This isn't ready yet.
2) On non-Ragnarok systems, before running make, set the TOPDIR environment
variable to the full path to the repository on the filesystem so that the build
process can use the repo's own usr/share/mk/* and lib directories, e.g.

```
    $ export TOPDIR=/home/username/src
    $ make
```

Relevant links
--------------

* About Ragnarok: [https://ragnarokos.github.io/about.html](https://ragnarokos.github.io/about.html).  

* Development notes: [https://ragnarokos.github.io/logs/logs.html](https://ragnarokos.github.io/logs/logs.html).
