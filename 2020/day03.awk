# 2020/day03.awk
# An AWK program that solves Day 3 of Advent of Code 2020
# <https://adventofcode.com/2020/day/3>
# -------------------------------------------------------
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


BEGIN {
	# Ordered as in in Part 2 of the problem statement.
	dx[1] = 1; dy[1] = 1
	dx[2] = 3; dy[2] = 1
	dx[3] = 5; dy[3] = 1
	dx[4] = 7; dy[4] = 1
	dx[5] = 1; dy[5] = 2
}

# Zero-indexing simplifies the modular arithmetic.
y = NR - 1 {
	for (i in dx) {
		x = dx[i] * y % length
		if (!(y % dy[i]) && substr($0, x + 1, 1) == "#")
			++trees[i]
	}
}

END {
	# Part 1 answer.
	print trees[2] + 0

	# Part 2 answer.
	trees_prod = 1
	for (i in trees)
		trees_prod *= trees[i]
	print trees_prod
}
