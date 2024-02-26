#!/bin/bash
#
# Convert a package from source format '1.0' to '3.0 (quilt)', git-committing
# in the process
#
# For each patch in the quilt series:
#   (1) Copy the top-most patch to debian/patches
#   (2) Reverse-apply that patch from HEAD
#   (3) git commit the result.
set -ev

# Path to git repository with the source in source in format 1.0
patch_dest="cron"

# Path to directory with source in format 3.0 (quilt)
patch_source="conv3"

# For the commit log
author="Christian Kastner <ckk@kvr.at>"

echo "Converting $patch_dest to source format 3.0 (quilt) using patches from $patch_source..."

# Initialize the debian/patches dir
mkdir -p "$patch_dest/debian/patches/"{fixes,features}
touch "$patch_dest/debian/patches/series"

# We undo patches from current HEAD, ie from tail of the quilt series. This
# would leave us with a series file reverse order. We fix this by rotating
# around in each iteration
series_file="$patch_dest/debian/patches/series"
series_prev="$patch_dest/debian/patches/series.prev"

# For each patch in the new series IN REVERSE,
tac "$patch_source/debian/patches/series" |
	while read patch_name
	do
		echo "$patch_name"
		cp "$patch_source/debian/patches/$patch_name" "$patch_dest/debian/patches/$patch_name"

		# Generate the new series file by:
		# (1) moving the old one out of the way
		mv "$series_file" "$series_prev"
		# (2) adding the currenty patch to new, empty series
		echo "$patch_name" > "$series_file"
		# (3) appending the old series to this new series
		cat "$series_prev" >> "$series_file"

		rm -f "$series_prev"

		# Reverse-apply the patch, then commit the result
		cd "$patch_dest"
		patch -R -p1 < "debian/patches/$patch_name"
		git add .
		git commit --author="$author" -m "Extract patch $patch_name from original source"
		cd -
	done

cd "$patch_dest"
echo "3.0 (quilt)" > "debian/source/format"
git add .
git commit --author="$author" -m "Switch package to source format 3.0 (quilt)"
cd -

echo "Conversion complete!"
