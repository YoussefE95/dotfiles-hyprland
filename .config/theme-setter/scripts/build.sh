#!/bin/bash
parser="$HOME/.config/theme-setter/scripts/parser.sh"
builders="$HOME/.config/theme-setter/builders"

$parser --set $1 $2 $3

palette=(
    "$($parser --palette background)"
    "$($parser --palette backgroundAlt)"
    "$($parser --palette foreground)"
    "$($parser --palette gray)"
    "$($parser --palette red)"
    "$($parser --palette green)"
    "$($parser --palette yellow)"
    "$($parser --palette blue)"
    "$($parser --palette magenta)"
    "$($parser --palette cyan)"
    "$($parser --palette orange)"
)

$builders/gnome-shell.sh ${palette[@]} "$1-$2-$3" &
$builders/gtk-2.sh ${palette[@]} "$1-$2-$3" &
$builders/gtk-3.sh ${palette[@]} "$1-$2-$3" &
