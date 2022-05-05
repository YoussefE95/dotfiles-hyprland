vs_theme=$(jq ".vs_themes.\"$1\"" "$2")
sed -i /.*workbench.colorTheme.*/c\\"\t\"workbench.colorTheme\": $vs_theme," "$3"