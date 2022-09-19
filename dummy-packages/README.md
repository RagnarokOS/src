Dummy packages
==============

Certain Debian packages may conflict with a Ragnarok base system and
should not get installed, even if other packages depend on them. In
99% of the cases, their functionality is already covered by programs
that are already installed.

Ragnarok's policy is to rebuild any package which may introduce conflicts
or other issues in the base system. However, rebuilding (thus, maintaining)
a package only to swap a single dependency in the 'control' file would be a
waste of resources. For such packages, equivs is used to create dummy packages.

No source tarball is provided for the dummies as they don't include any binary
nor any code, and don't execute any command upon installation. Their respective
no-_packagename_.equivs file should be considered the source, and they can be built
using the following command:

```
equivs-build no-packagename.equivs
```

Inspecting the contents of the deb packages provided here can be done using the
dpkg-deb -R _package-name_ target-directory_ command, e.g.

```
dpkg-deb -R Downloads/man-db_99_all.deb $HOME/.local/src/
```


