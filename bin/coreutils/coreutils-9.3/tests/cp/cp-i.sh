#!/bin/sh
# Test whether cp -i prompts in the right place.

# Copyright (C) 2006-2023 Free Software Foundation, Inc.

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

. "${srcdir=.}/tests/init.sh"; path_prepend_ ./src
print_ver_ cp

mkdir -p a b/a/c || framework_failure_
touch a/c || framework_failure_


# coreutils 6.2 cp would neglect to prompt in this case.
echo n | returns_ 1 cp -iR a b 2>/dev/null || fail=1

# test miscellaneous combinations of -f -i -n parameters
touch c d || framework_failure_
echo "'c' -> 'd'" > out_copy || framework_failure_
echo "skipped 'd'" > out_skip || framework_failure_
echo "cp: not replacing 'd'" > err_skip || framework_failure_
touch out_empty || framework_failure_

# ask for overwrite, answer no
echo n | returns_ 1 cp -vi  c d 2>/dev/null > out1 || fail=1
compare out1 out_skip || fail=1

# ask for overwrite, answer yes
echo y | cp -vi  c d 2>/dev/null > out2 || fail=1
compare out2 out_copy  || fail=1

# -i wins over -n
echo y | cp -vni c d 2>/dev/null > out3 || fail=1
compare out3 out_copy  || fail=1

# -n wins over -i
echo y | returns_ 1 cp -vin c d 2>/dev/null > out4 || fail=1
compare out4 out_skip || fail=1

# -n wins over -i non verbose
echo y | returns_ 1 cp -in c d 2>err4 > out4 || fail=1
compare err4 err_skip || fail=1
compare out4 out_empty || fail=1

# ask for overwrite, answer yes
echo y | cp -vfi c d 2>/dev/null > out5 || fail=1
compare out5 out_copy  || fail=1

# do not ask, prevent from overwrite
echo n | returns_ 1 cp -vfn c d 2>/dev/null > out6 || fail=1
compare out6 out_skip || fail=1

# do not ask, prevent from overwrite
echo n | returns_ 1 cp -vnf c d 2>/dev/null > out7 || fail=1
compare out7 out_skip || fail=1

# options --backup and --no-clobber are mutually exclusive
returns_ 1 cp -bn c d 2>/dev/null || fail=1

Exit $fail
