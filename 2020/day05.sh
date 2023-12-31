# 2020/day05.sh
# A POSIX shell script that solves Day 5 of Advent of Code 2020
# <https://adventofcode.com/2020/day/5>
# -------------------------------------------------------------
#
# SPDX-License-Identifier: CC0-1.0
#
# Written in 2020-2021, 2023 by Lawrence Velazquez <vq@larryv.me>.
#
# To the extent possible under law, the author has dedicated all
# copyright and related and neighboring rights to this software to the
# public domain worldwide.  This software is distributed without any
# warranty.
#
# You should have received a copy of the CC0 Public Domain Dedication
# along with this software.  If not, see
# <https://creativecommons.org/publicdomain/zero/1.0/>.


# Convert the input into one enormous bc(1) program.  Hehe.
sed '
	# The seat specification is a binary representation of the seat
	# ID using the alphabet {L, R} for the three least significant
	# bits and {F, B} for the rest.  Translate to {0, 1} and work
	# with the numbers directly.
	1i\
	ibase = 2
	y/FBLR/0101/

	# Find highest seat ID (part 1 answer).
	s/..*/s[&] = 1; if (& > i) i = &/
	$a\
	i

	# Find my seat (part 2 answer).
	$a\
	while (s[--i]) {}; i
' | bc
