#!/bin/env sh

CECM="core extra community multilib"

# *-bin detector
(pacman -Sl chaotic-aur | awk '{print $2}' | grep -- '-bin$' | sed 's/-bin$//'; pacman -Sl $CECM chaotic-aur | awk '{print $2}') | sort | uniq -d | awk '{print $1"-bin"}'
# aur -> cecm moved
pacman -Sl $CECM chaotic-aur | awk '{print $2}' | sort | uniq -d
