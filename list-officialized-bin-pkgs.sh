#!/bin/env sh

# *-bin detector
(pacman -Sl chaotic-aur | awk '{print $2}' | rg -r '' -- '-bin$'; pacman -Sl extra core community multilib | awk '{print $2}') | sort | uniq -d
# aur -> cecm moved
pacman -Sl core extra community multilib chaotic-aur | awk '{print $2}' | sort | uniq -d
