# A program that solves Day 1 of Advent of Code 2020
# <https://adventofcode.com/2020/day/1>
#
# Written in 2020, 2023 by Lawrence Velazquez <vq@larryv.me>.
#
# To the extent possible under law, the author has dedicated all
# copyright and related and neighboring rights to this software to the
# public domain worldwide. This software is distributed without any
# warranty.
#
# You should have received a copy of the CC0 Public Domain Dedication
# along with this software. If not, see
# <https://creativecommons.org/publicdomain/zero/1.0/>.


{
	input1[$0] = input2[$0] = 1
}

END {
	for (x1 in input1) {
		# Avoid processing the reversed pair of entries later.
		delete input2[x1]
		for (x2 in input2) {
			# Keep track of sums as we go. This avoids O(n^3) runtime at
			# the cost of O(n^2) memory.
			sums2prods[x1 + x2] = x1 * x2
		}
	}

	print sums2prods[2020]

	for (x in input1) {
		if (2020 - x in sums2prods) {
			print x * sums2prods[2020 - x]
			exit
		}
	}
}
