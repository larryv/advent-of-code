# 2020/day02.awk
# An AWK program that solves Day 2 of Advent of Code 2020
# <https://adventofcode.com/2020/day/2>
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
	FS = "-|:? +"
}

{
	# This is safe because $3 is always [a-z] in the input.
	char_count = gsub($3, "&", $4)
	old_pw_count += $1 <= char_count && char_count <= $2

	char1 = substr($4, $1, 1)
	char2 = substr($4, $2, 1)
	new_pw_count += (char1 == $3 || char2 == $3) && char1 != char2
}

END {
	# Part 1 answer.
	print old_pw_count + 0

	# Part 2 answer.
	print new_pw_count + 0
}
