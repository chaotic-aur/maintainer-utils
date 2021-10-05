#!/bin/env raku

my @chaotic-aur-pkgs = run(<pacman -Sql chaotic-aur>, :out).out.slurp(:close).lines;
my @chaotic-aur-bin-pkgs = @chaotic-aur-pkgs.grep(*.ends-with('-bin'));
my @cecm-pkgs = run(<pacman -Sql core extra community multilib>, :out).out.slurp(:close).lines;

.say if $_.chop(4) ∈ flat(@chaotic-aur-pkgs, @cecm-pkgs) for @chaotic-aur-bin-pkgs;

.say for flat(@chaotic-aur-pkgs, @cecm-pkgs).repeated;
