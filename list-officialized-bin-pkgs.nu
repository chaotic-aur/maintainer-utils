#CECM="core extra community multilib"
#
# shellcheck disable=SC2086
#{
#	# *-bin detector
#	(
#		pacman -Sql chaotic-aur | grep -- '-bin$' | sed 's/-bin$//'
#		pacman -Sql $CECM chaotic-aur
#	) | sort | uniq -d | awk '{print $1"-bin"}'
#	# aur -> cecm moved
#	pacman -Sql $CECM chaotic-aur | sort | uniq -d
#}

let chaotic-aur-pkgs = (pacman -Sql chaotic-aur | lines)
let chaotic-aur-bin-pkgs = ($chaotic-aur-pkgs | where ($it | str ends-with '-bin'))
let cecm-pkgs = (pacman -Sql core extra community multilib | lines)

$chaotic-aur-bin-pkgs | where ($it | str find-replace '(.+)-bin$' '$1') in ($cecm-pkgs | append $chaotic-aur-pkgs | flatten) | sort-by | uniq

$cecm-pkgs | append $chaotic-aur-pkgs | flatten | sort-by | uniq -d
