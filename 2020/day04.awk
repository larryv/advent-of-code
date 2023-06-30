# 2020/day04.awk
# An AWK program that solves Day 4 of Advent of Code 2020
# <https://adventofcode.com/2020/day/4>
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
	# POSIX.1-2017 says:
	#
	#     If RS is null, then records are separated by sequences
	#     consisting of a <newline> plus one or more blank lines,
	#     leading or trailing blank lines shall not result in empty
	#     records at the beginning or end of the input, and
	#     a <newline> shall always be a field separator, no matter
	#     what the value of FS is.
	#
	# In practice, many implementations do not treat <newline> as
	# a field separator if FS is not <space>, so include it in FS
	# explicitly.
	FS = ":|[ \n]+"
	RS = ""

	# The makefile specifies the POSIX locale, so character classes
	# and range expressions work predictably.
	rules["byr"] = "^(19[2-9][0-9]|200[0-2])$"
	rules["iyr"] = "^(201[0-9]|2020)$"
	rules["eyr"] = "^(202[0-9]|2030)$"
	rules["hgt"] = "^((1[5-8][0-9]|19[0-3])cm|(59|6[0-9]|7[0-6])in)$"
	rules["hcl"] = "^#[[:xdigit:]]{6}$"
	rules["ecl"] = "^(amb|blu|brn|gry|grn|hzl|oth)$"
	rules["pid"] = "^[0-9]{9}$"
}

# Preemptively ignore passports with too few fields to be valid.
NF >= 7 {
	for (key in fields)
		delete fields[key]

	# Passport field names and values become alternating AWK fields.
	for (i = 1; i < NF; i += 2)
		fields[$i] = $(i + 1)

	# Lax validation only requires that all fields be present.
	for (field in rules)
		if (!(field in fields))
			next
	++laxly_valid_count

	# Strict validation requires that all fields be ... well, valid.
	for (field in rules)
		if (fields[field] !~ rules[field])
			next
	++strictly_valid_count
}

END {
	# Part 1 answer.
	print laxly_valid_count + 0

	# Part 2 answer.
	print strictly_valid_count + 0
}
