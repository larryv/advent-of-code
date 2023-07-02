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


NR > 1 {
	# Zero-indexing simplifies the modular arithmetic.
	step = NR - 1

	# Ordered as in in Part 2 of the problem statement.
	trees1 += substr($0, step % length + 1, 1) == "#"
	trees2 += substr($0, 3 * step % length + 1, 1) == "#"
	trees3 += substr($0, 5 * step % length + 1, 1) == "#"
	trees4 += substr($0, 7 * step % length + 1, 1) == "#"
	trees5 += NR % 2 && substr($0, step % length + 1, 1) == "#"
}

END {
	# Part 1 answer.
	print trees2

	# Part 2 answer.
	print trees1 * trees2 * trees3 * trees4 * trees5
}
