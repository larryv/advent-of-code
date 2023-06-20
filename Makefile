# A program that runs other programs that solve Advent of Code
# <https://adventofcode.com>
#
# Written in 2020 by Lawrence Velazquez <vq@larryv.me>
#
# To the extent possible under law, the author has dedicated all
# copyright and related and neighboring rights to this software to the
# public domain worldwide. This software is distributed without any
# warranty.
#
# You should have received a copy of the CC0 Public Domain Dedication
# along with this software. If not, see
# <https://creativecommons.org/publicdomain/zero/1.0/>.


.POSIX:
.SUFFIXES:
.SUFFIXES: .awk .sh
SHELL = /bin/sh

AWK = awk
SED = sed
SH = sh

# Each source file ends with comments containing the puzzle's input.
.awk:
	$(SED) '1,/^# === INPUT ===$$/d; s/^#//' $< | $(AWK) -f $<
.sh:
	$(SED) '1,/^# === INPUT ===$$/d; s/^#//' $< | $(SH) $<
