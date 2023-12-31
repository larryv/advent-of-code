# Makefile
# A program that runs other programs that solve Advent of Code
# <https://adventofcode.com>
# ------------------------------------------------------------
#
# SPDX-License-Identifier: CC0-1.0
#
# Written in 2020, 2023 by Lawrence Velazquez <vq@larryv.me>.
#
# To the extent possible under law, the author has dedicated all
# copyright and related and neighboring rights to this software to the
# public domain worldwide.  This software is distributed without any
# warranty.
#
# You should have received a copy of the CC0 Public Domain Dedication
# along with this software.  If not, see
# <https://creativecommons.org/publicdomain/zero/1.0/>.


.POSIX:
.SUFFIXES:
.SUFFIXES: .awk .sh
SHELL = /bin/sh

# NOTE: These macros influence the commands below, but they don't affect
# how solutions themselves invoke tools.
AWK = awk
SH = sh

# Don't bother trying to depend on the *.input files.  Doing so while
# conforming to POSIX.1-2017 would be more hassle than it's worth, and
# the *.input files can't be automatically created or updated anyway.
#
# Use the POSIX locale so features like character classes and range
# expressions work predictably.  This won't interfere with processing
# the input, which (as far as I know) is always ASCII.
.awk:
	LC_ALL=C $(AWK) -f $< $*.input
.sh:
	LC_ALL=C $(SH) $< <$*.input
