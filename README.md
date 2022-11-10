Ragnarok source repository
==========================

Development notes for November 2022: https://RagnarokOS.github.io/logs/devnotes-november-2022.html

r-build
-------

Each source package directory contains a script named r-build containing build instructions, which
greatly simplifies the scripts used to build the source tree.

Patches
-------

The patches subdirectories contain the diffs showing the modifications made to the original source.
These patches are already applied and are only there for transparency.  

Comparing the original files with the ones from this repository using _diff -u original_file ragnarok_file > patch.diff_ should yield the same patch, provided both files are from the same program version.
