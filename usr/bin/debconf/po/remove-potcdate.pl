#! /usr/bin/perl -n

BEGIN {
    $seen_potcdate = 0;
}

if (not $seen_potcdate and /^"POT-Creation-Date: .*"/) {
    $seen_potcdate = 1;
    next;
}
print;
