# A program that solves Day 4 of Advent of Code 2020
# <https://adventofcode.com/2020/day/4>
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



function is_in_range(val, min, max) {
	return min <= val && val <= max
}

BEGIN {
	FS = ":|[ \n]+"
	RS = ""
}

NF >= 7 {
	for (key in fields)
		delete fields[key]

	# Fields alternate between passports' keys and values.
	for (i = 1; i < NF; i += 2)
		fields[$i] = $(i + 1)

	lax_count += ("byr" in fields && "iyr" in fields && "eyr" in fields &&
	              "hgt" in fields && "hcl" in fields && "ecl" in fields &&
	              "pid" in fields)

	# Explicitly check the textual representations to avoid accepting
	# invalid numeric strings that happen to satisfy the numeric bounds.
	# (For example, both "+1969" and "00000001969" would be accepted for
	# "byr" based on numeric value.) Avoid character classes and range
	# expressions, which depend on locale.
	strict_count += (fields["byr"] ~ /^[0123456789]{4}$/ &&
	                    is_in_range(fields["byr"], 1920, 2002) &&
	                 fields["iyr"] ~ /^[0123456789]{4}$/ &&
	                    is_in_range(fields["iyr"], 2010, 2020) &&
	                 fields["eyr"] ~ /^[0123456789]{4}$/ &&
	                    is_in_range(fields["eyr"], 2020, 2030) &&
	                 (fields["hgt"] ~ /^[0123456789]+cm$/ &&
	                        is_in_range(int(fields["hgt"]), 150, 193) ||
	                    fields["hgt"] ~ /^[0123456789]+in$/ &&
	                        is_in_range(int(fields["hgt"]), 59, 76)) &&
	                 fields["hcl"] ~ /^#[0123456789abcdef]{6}$/ &&
	                 fields["ecl"] ~ /^(amb|blu|brn|gry|grn|hzl|oth)$/ &&
	                 fields["pid"] ~ /^[0123456789]{9}$/)
}

END {
	print lax_count
	print strict_count
}
