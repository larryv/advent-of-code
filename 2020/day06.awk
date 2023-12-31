# 2020/day06.awk
# An AWK program that solves Day 6 of Advent of Code 2020
# <https://adventofcode.com/2020/day/6>
# -------------------------------------------------------
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


BEGIN {
	RS = ""
}

{
	# Each field represents one person and does not repeat letters.
	for (i = 1; i <= NF; ++i)
		for (j = length($i); j; --j)
			++yeses[substr($i, j, 1)]

	for (q in yeses) {
		++anyone_count
		if (yeses[q] == NF)
			++everyone_count
		delete yeses[q]
	}
}

END {
	# Part 1 answer.
	print anyone_count + 0

	# Part 2 answer.
	print everyone_count + 0
}
