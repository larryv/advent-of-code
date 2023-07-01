# A program that solves Day 5 of Advent of Code 2020
# <https://adventofcode.com/2020/day/5>
#
# Written in 2020-2021, 2023 by Lawrence Velazquez <vq@larryv.me>.
#
# To the extent possible under law, the author has dedicated all
# copyright and related and neighboring rights to this software to the
# public domain worldwide. This software is distributed without any
# warranty.
#
# You should have received a copy of the CC0 Public Domain Dedication
# along with this software. If not, see
# <https://creativecommons.org/publicdomain/zero/1.0/>.


# The seat specification is a binary representation of the seat ID using
# the alphabet {L, R} for the three least significant bits and {F, B}
# for the rest. Translate to the familiar {0, 1} and go from there.

tr FBLR 0101 | sed '
	1i\
	ibase = 2
	s/..*/seats[&] = 1; if (& > max_id) max_id = &/
	$a\
	max_id; for (id = max_id - 1; seats[id]; --id) {}; id
' | bc
