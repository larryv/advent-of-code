# A program that solves Day 6 of Advent of Code 2020
# <https://adventofcode.com/2020/day/6>
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


BEGIN {
	RS = ""
}

{
	# Each person gets their own field.
	for (i = 1; i <= NF; ++i)
		for (j = 1; j <= length($i); ++j)
			++answered[substr($i, j, 1)]

	for (q in answered) {
		++any_count
		every_count += answered[q] == NF
		delete answered[q]
	}
}

END {
	print any_count
	print every_count
}


# === PUZZLE ===
#
# Copyright 2020 Eric Wastl <http://was.tl>
#
#
# --- Day 6: Custom Customs ---
#
# As your flight approaches the regional airport where you'll switch to
# a much larger plane, customs declaration forms are distributed to the
# passengers.
#
# The form asks a series of 26 yes-or-no questions marked "a" through
# "z". All you need to do is identify the questions for which anyone in
# your group answers "yes". Since your group is just you, this doesn't
# take very long.
#
# However, the person sitting next to you seems to be experiencing
# a language barrier and asks if you can help. For each of the people in
# their group, you write down the questions for which they answer "yes",
# one per line. For example:
#
#     abcx
#     abcy
#     abcz
#
# In this group, there are 6 questions to which anyone answered "yes":
# "a", "b", "c", "x", "y", and "z". (Duplicate answers to the same
# question don't count extra; each question counts at most once.)
#
# Another group asks for your help, then another, and eventually you've
# collected answers from every group on the plane (your puzzle input).
# Each group's answers are separated by a blank line, and within each
# group, each person's answers are on a single line. For example:
#
#     abc
#
#     a
#     b
#     c
#
#     ab
#     ac
#
#     a
#     a
#     a
#     a
#
#     b
#
# This list represents answers from five groups:
#
#   - The first group contains one person who answered "yes" to
#     3 questions: "a", "b", and "c".
#   - The second group contains three people; combined, they answered
#     "yes" to 3 questions: "a", "b", and "c".
#   - The third group contains two people; combined, they answered "yes"
#     to 3 questions: "a", "b", and "c".
#   - The fourth group contains four people; combined, they answered
#     "yes" to only 1 question, "a".
#   - The last group contains one person who answered "yes" to only
#     1 question, "b".
#
# In this example, the sum of these counts is 3 + 3 + 3 + 1 + 1 = 11.
#
# For each group, count the number of questions to which anyone answered
# "yes". What is the sum of those counts?
#
#
# --- Part Two ---
#
# As you finish the last group's customs declaration, you notice that
# you misread one word in the instructions:
#
# You don't need to identify the questions to which *anyone* answered
# "yes"; you need to identify the questions to which *everyone* answered
# "yes"!
#
# Using the same example as above:
#
#     abc
#
#     a
#     b
#     c
#
#     ab
#     ac
#
#     a
#     a
#     a
#     a
#
#     b
#
# This list represents answers from five groups:
#
#   - In the first group, everyone (all 1 person) answered "yes" to
#     3 questions: "a", "b", and "c".
#   - In the second group, there is no question to which everyone
#     answered "yes".
#   - In the third group, everyone answered "yes" to only 1 question,
#     "a". Since some people did not answer "yes" to "b" or "c", they
#     don't count.
#   - In the fourth group, everyone answered "yes" to only 1 question,
#     "a".
#   - In the fifth group, everyone (all 1 person) answered "yes" to
#     1 question, "b".
#
# In this example, the sum of these counts is 3 + 0 + 1 + 1 + 1 = 6.
#
# For each group, count the number of questions to which *everyone*
# answered "yes". What is the sum of those counts?
