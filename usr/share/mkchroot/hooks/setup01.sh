#!/bin/sh

set -e

# Copy ragnarok.sources to the chroot
mkdir -p "$1"/etc/apt/sources.list.d
copy-in /etc/apt/sources.list.d/ragnarok.sources /etc/apt/sources.list.d/ragnarok.sources

# We also need to copy the keys to the chroot, since the ragnarok-files package (which provides
# the keys) isn't installed yet, and won't install if the keys aren't already present to verify
# the package's signature.
mkdir -p "$1"/usr/share/
copy-in /usr/share/ragnarok-keys /usr/share/
