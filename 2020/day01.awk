# 2020/day01.awk
# An AWK program that solves Day 1 of Advent of Code 2020
# <https://adventofcode.com/2020/day/1>
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


# No need to worry about duplicates in the input because there are none.

{
	# Iterating over entries as they are accrued avoids reversed
	# pairs naturally.
	for (x in entries) {
		# Keep track of sums and products as we go.  This avoids
		# O(n^3) runtime at the cost of O(n^2) memory.
		sums2prods[x + $0] = x * $0
	}

	# Add new entry after iteration to avoid pairing it with itself.
	entries[$0]
}

END {
	# Part 1 answer.
	print sums2prods[2020]

	for (x in entries) {
		if (2020 - x in sums2prods) {
			# Part 2 answer.
			print x * sums2prods[2020 - x]
			exit
		}
	}
}
