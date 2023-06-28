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


# === PUZZLE ===
#
# Copyright 2020 Eric Wastl <http://was.tl>
#
#
# --- Day 1: Report Repair ---
#
# After saving Christmas five years in a row, you've decided to take
# a vacation at a nice resort on a tropical island. Surely, Christmas
# will go on without you.
#
# The tropical island has its own currency and is entirely cash-only.
# The gold coins used there have a little picture of a starfish; the
# locals just call them stars. None of the currency exchanges seem to
# have heard of them, but somehow, you'll need to find fifty of these
# coins by the time you arrive so you can pay the deposit on your room.
#
# To save your vacation, you need to get all fifty stars by December
# 25th.
#
# Collect stars by solving puzzles. Two puzzles will be made available
# on each day in the Advent calendar; the second puzzle is unlocked when
# you complete the first. Each puzzle grants one star. Good luck!
#
# Before you leave, the Elves in accounting just need you to fix your
# expense report (your puzzle input); apparently, something isn't quite
# adding up.
#
# Specifically, they need you to find the two entries that sum to 2020
# and then multiply those two numbers together.
#
# For example, suppose your expense report contained the following:
#
#     1721
#     979
#     366
#     299
#     675
#     1456
#
# In this list, the two entries that sum to 2020 are 1721 and 299.
# Multiplying them together produces 1721 * 299 = 514579, so the correct
# answer is 514579.
#
# Of course, your expense report is much larger. Find the two entries
# that sum to 2020; what do you get if you multiply them together?
#
#
# --- Part Two ---
#
# The Elves in accounting are thankful for your help; one of them even
# offers you a starfish coin they had left over from a past vacation.
# They offer you a second one if you can find three numbers in your
# expense report that meet the same criteria.
#
# Using the above example again, the three entries that sum to 2020 are
# 979, 366, and 675. Multiplying them together produces the answer,
# 241861950.
#
# In your expense report, what is the product of the three entries that
# sum to 2020?
