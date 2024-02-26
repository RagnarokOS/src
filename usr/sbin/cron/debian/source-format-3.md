Source format 1.0 -> 3.0 (quilt)
================================


Motivation
----------

Debian's cron has always been maintained in source format 1.0, that is: as a
single patch against the original upstream source.

Going back to at least 1996 -- that's the date of the first debian/changelog
entry -- the organic growth of this single patch has made certain maintenance
tasks cumbersome, or even practically impossible. Most notably, the following
tasks have been hindered by source format 1.0:

  * **"Upgrading" from Vixie cron 3.0 to ISC cron 4.1**
    The upstream source has been significantly refactored and improved.
    Considering that Debian's version experienced its own substantial evolution,
    the syntactic and semantic differences between these codebases prohibit an
    update to the newer version.
  * **Comparing changes to those of other distributions**
    Pulling in changes from, or sharing changes with, other distributions can be
    immensely difficult when there is no clear way to delineate our own changes.
  * **Documentation of changes**
    History, BTS entries, author, etc. are extremly valuable context when trying
    to understand a change.
  * **Updating changes**
    It's much easier to update an existing change when the scope of its current
    version is in front of you in the form of a small, isolated, well-documented
    patch.

It was therefore decided that the source format must be converted to format
3.0 (quilt).


Process
-------

The process for extracting the patches from the source format 1.0 version
consisted of two steps.

### Step 1

The first step was to break up the single large patch into many smaller ones.
This was achieved by going through the commit history, commit-by-commit, and
extracting individual changes to patches.

More precisely, the following iterative process was followed:

1. Begin with the pristine upstream source
1. Take the next commit in the commit history
1. Assign each individual hunk of that commit to a .patch file:
    2. If the hunk semantically fits with an existing patch, update that patch
    2. Otherwise, create a new patch
1. After all hunks of the commit have been processed:
    2. Look at the commit message, debian/changelog, and the BTS
    2. Try to determine authors, bug references, context, etc.
    2. Add this information to the DEP3 headers of the relevant .patch files.
1. Terminate if this was the last commit, otherwise go back to 2.

_In practice, this turned out to be much more difficult than one would believe,
as quite often, a changeset would modify or even revert a previous change, with
sometimes more than a decade between these changes._

### Step 2

Having created a patch series, the second step was to refactor it by first
splitting and merging patches where called for, and then by re-ordering them
according to their guesstimated objective relevance. For example:

* Fixes for defects were ordered before features
* Critical fixes were ordered before minor fixes.


### Result

The result was a git repository with a clean patch series. Using gbp, a source
package was created from this repository.

The unpacked source (with applied patches) of the format 3.0 (quilt) package
was compared to the unpacked source of the format 1.0 package based on the same
Debian revision -135; they were identical.

The patch series of the 3.0 (quilt) source was then unapplied, and this source
compared to the unpacked source of cron_3.0pl1.orig.tar.gz (the pristine
upstream source); they were also identical.

The format 3.0 (quilt) package resulting from this process therefore produces a
byte-for-byte identical source package as the format 1.0 package currently in
the archive.


Conversion of the git repository
--------------------------------

Having created a patch series, the question was how to update the git
repository. There were two possiblities:

1. Start with a fresh repository
1. Take the existing repository, unapply the changes resulting from using
   source format 1.0, and add the new patch series to debian/patches.

As the difference between options 1 and 2 would solely be that the latter would
additionally contain the full source history spanning 25 years, the decision
naturally fell to option 2.

To this end, a bash script `source-format-3.sh` was created that would unapply
the patches from the new patch series in reverse (committing each step in the
process), resulting in an unmodified upstream source tree, and all
modifications to this source under debian/patches.

As its final step, the script switched debian/source/format from 1.0 to
3.0 (quilt).


References
----------

* `dpkg-source(1)` has detailed information regarding both source formats.

* [DEP-3 Patch Tagging * Guidelines](https://dep-team.pages.debian.net/deps/dep3/)

* `source-format-3.sh` was used to convert the git repository from source
   format 1.0 to 3.0 (quilt), and should be present in the same directory as
   this document.
