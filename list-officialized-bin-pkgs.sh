#!/bin/env sh

# *-bin detector
(paru -Sl chaotic-aur | awk '{print $2}' | rg -r '' -- '-bin$'; paru -Sl extra core community multilib | awk '{print $2}') | sort | uniq -d
# aur -> cecm moved
paru -Sl core extra community multilib chaotic-aur | awk '{print $2}' | sort | uniq -d
