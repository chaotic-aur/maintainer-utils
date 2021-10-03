#!/bin/env sh

CECM="core extra community multilib"

# shellcheck disable=SC2086
{
	# *-bin detector
	(
		pacman -Sql chaotic-aur | grep -- '-bin$' | sed 's/-bin$//'
		pacman -Sql $CECM chaotic-aur
	) | sort | uniq -d | awk '{print $1"-bin"}'
	# aur -> cecm moved
	pacman -Sql $CECM chaotic-aur | sort | uniq -d
}
