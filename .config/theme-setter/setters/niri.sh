#!/bin/bash
palette=("${@}")
niri_conf="$HOME/.config/niri/config.kdl"

active="active-gradient from=\"#${palette[10]}\" to=\"#${palette[6]}\" angle=45"
inactive="inactive-color \"#${palette[3]}\""

sed -i "s/        active-gradient.*/        $active/" $niri_conf
sed -i "s/        inactive-color.*/        $inactive/" $niri_conf
