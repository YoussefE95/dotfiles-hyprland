dest_dir="$HOME/.config/notion-theme/"
dest_file="theme.css"

[[ -d "$dest_dir" ]] || mkdir -pv "$dest_dir"

output="$(cat << THEME
:root.dark {
    --dynamic_theme--bg: #$(jq -r ".colors.\"$1\".background" "$2");
    --dynamic_theme--light_gray_dark: #$(jq -r ".colors.\"$1\".gray" "$2");
    --dynamic_theme--gray_dark: #$(jq -r ".colors.\"$1\".gray" "$2");
    --dynamic_theme--red_dark: #$(jq -r ".colors.\"$1\".red" "$2")80;
    --dynamic_theme--red_light: #$(jq -r ".colors.\"$1\".red" "$2");
    --dynamic_theme--green_dark: #$(jq -r ".colors.\"$1\".green" "$2")80;
    --dynamic_theme--green_light: #$(jq -r ".colors.\"$1\".green" "$2");
    --dynamic_theme--yellow_dark: #$(jq -r ".colors.\"$1\".yellow" "$2")80;
    --dynamic_theme--yellow_light: #$(jq -r ".colors.\"$1\".yellow" "$2");
    --dynamic_theme--blue_dark: #$(jq -r ".colors.\"$1\".blue" "$2")80;
    --dynamic_theme--blue_light: #$(jq -r ".colors.\"$1\".blue" "$2");
    --dynamic_theme--purple_dark: #$(jq -r ".colors.\"$1\".magenta" "$2")80;
    --dynamic_theme--purple_light: #$(jq -r ".colors.\"$1\".magenta" "$2");
    --dynamic_theme--aqua_dark: #$(jq -r ".colors.\"$1\".cyan" "$2")80;
    --dynamic_theme--aqua_light: #$(jq -r ".colors.\"$1\".cyan" "$2");
    --dynamic_theme--gray_light: #$(jq -r ".colors.\"$1\".gray" "$2")80;
    --dynamic_theme--orange_dark: #$(jq -r ".colors.\"$1\".orange" "$2")80;
    --dynamic_theme--orange_light: #$(jq -r ".colors.\"$1\".orange" "$2");
    --dynamic_theme--fg: #$(jq -r ".colors.\"$1\".foreground" "$2");
    --dynamic_theme--bg0_h: #$(jq -r ".colors.\"$1\".background" "$2");
    --dynamic_theme--bg0: #$(jq -r ".colors.\"$1\".background" "$2");
    --dynamic_theme--bg1: #$(jq -r ".colors.\"$1\".black" "$2");
    --dynamic_theme--bg2: #$(jq -r ".colors.\"$1\".gray" "$2");
    --dynamic_theme--bg3: #$(jq -r ".colors.\"$1\".gray" "$2");
    --dynamic_theme--bg4: #$(jq -r ".colors.\"$1\".gray" "$2");
    --dynamic_theme--bg0_s: #$(jq -r ".colors.\"$1\".background" "$2");
    --dynamic_theme--fg4: #$(jq -r ".colors.\"$1\".foreground" "$2");
    --dynamic_theme--fg3: #$(jq -r ".colors.\"$1\".foreground" "$2");
    --dynamic_theme--fg2: #$(jq -r ".colors.\"$1\".foreground" "$2");
    --dynamic_theme--fg1: #$(jq -r ".colors.\"$1\".foreground" "$2");
    --dynamic_theme--fg0: #$(jq -r ".colors.\"$1\".foreground" "$2");
  
    --theme--accent_blue: var(--dynamic_theme--bg3);
    --theme--accent_blue-selection: rgba(80, 73, 69, 0.5);
    --theme--accent_blue-hover: var(--dynamic_theme--fg3);
    --theme--accent_blue-active: var(--dynamic_theme--fg3);
    --theme--accent_red: var(--dynamic_theme--blue_dark);
    --theme--accent_red-button: var(--dynamic_theme--blue_light);
  
    --theme--bg: var(--dynamic_theme--bg0);
    --theme--bg_secondary: var(--dynamic_theme--bg1);
    --theme--bg_card: var(--dynamic_theme--bg3);
  
    --theme--scrollbar_track: transparent;
    --theme--scrollbar_thumb: var(--dynamic_theme--bg0_s);
    --theme--scrollbar_thumb-hover: var(--dynamic_theme--bg3);
  
    --theme--ui_divider: var(--dynamic_theme--gray_light);
    --theme--ui_interactive-hover: rgba(80, 73, 69, 0.7);
    --theme--ui_interactive-active: rgba(80, 73, 69, 0.9);
    --theme--ui_toggle-off: var(--dynamic_theme--bg4);
    --theme--ui_toggle-feature: var(--dynamic_theme--fg);
    --theme--ui_corner_action: var(--theme--bg_card);
    --theme--ui_corner_action-hover: var(--theme--ui_interactive-hover);
    --theme--ui_corner_action-active: var(--theme--ui_interactive-active);
  
    --theme--icon: var(--dynamic_theme--fg0);
    --theme--icon_secondary: var(--dynamic_theme--fg3);
  
    --theme--text: var(--dynamic_theme--fg0);
    --theme--text_secondary: var(--dynamic_theme--fg3);
    --theme--text_gray: var(--dynamic_theme--gray_dark);
    --theme--text_brown: var(--dynamic_theme--bg4);
    --theme--text_orange: var(--dynamic_theme--orange_dark);
    --theme--text_yellow: var(--dynamic_theme--yellow_dark);
    --theme--text_green: var(--dynamic_theme--green_dark);
    --theme--text_blue: var(--dynamic_theme--blue_dark);
    --theme--text_purple: var(--dynamic_theme--purple_dark);
    --theme--text_pink: var(--dynamic_theme--purple_light);
    --theme--text_red: var(--dynamic_theme--red_dark);
  
    --theme--highlight_gray: var(--dynamic_theme--gray_dark);
    --theme--highlight_gray-text: var(--dynamic_theme--bg0);
    --theme--highlight_brown: var(--theme--tag_brown);
    --theme--highlight_brown-text: var(--dynamic_theme--bg0);
    --theme--highlight_orange: var(--dynamic_theme--orange_dark);
    --theme--highlight_orange-text: var(--dynamic_theme--bg0);
    --theme--highlight_yellow: var(--dynamic_theme--yellow_dark);
    --theme--highlight_yellow-text: var(--dynamic_theme--bg0);
    --theme--highlight_green: var(--dynamic_theme--green_dark);
    --theme--highlight_green-text: var(--dynamic_theme--bg0);
    --theme--highlight_blue: var(--dynamic_theme--blue_dark);
    --theme--highlight_blue-text: var(--dynamic_theme--bg0);
    --theme--highlight_purple: var(--dynamic_theme--purple_dark);
    --theme--highlight_purple-text: var(--dynamic_theme--bg0);
    --theme--highlight_pink: var(--theme--tag_pink);
    --theme--highlight_pink-text: var(--dynamic_theme--bg0);
    --theme--highlight_red: var(--dynamic_theme--red_dark);
    --theme--highlight_red-text: var(--dynamic_theme--bg0);
  
    --theme--callout_gray: var(--theme--highlight_gray);
    --theme--callout_gray-text: var(--dynamic_theme--bg0);
    --theme--callout_brown: var(--theme--highlight_brown);
    --theme--callout_brown-text: var(--dynamic_theme--bg0);
    --theme--callout_orange: var(--theme--highlight_orange);
    --theme--callout_orange-text: var(--dynamic_theme--bg0);
    --theme--callout_yellow: var(--theme--highlight_yellow);
    --theme--callout_yellow-text: var(--dynamic_theme--bg0);
    --theme--callout_green: var(--theme--highlight_green);
    --theme--callout_green-text: var(--dynamic_theme--bg0);
    --theme--callout_blue: var(--theme--highlight_blue);
    --theme--callout_blue-text: var(--dynamic_theme--bg0);
    --theme--callout_purple: var(--theme--highlight_purple);
    --theme--callout_purple-text: var(--dynamic_theme--bg0);
    --theme--callout_pink: var(--theme--highlight_pink);
    --theme--callout_pink-text: var(--dynamic_theme--bg0);
    --theme--callout_red: var(--theme--highlight_red);
    --theme--callout_red-text: var(--dynamic_theme--bg0);
  
    --theme--tag_default: var(--dynamic_theme--gray_dark);
    --theme--tag_default-text: var(--dynamic_theme--bg2);
    --theme--tag_light_gray: var(--dynamic_theme--light_gray_dark);
    --theme--tag_light_gray-text: var(--dynamic_theme--bg2);
    --theme--tag_gray: var(--dynamic_theme--gray_dark);
    --theme--tag_gray-text: var(--dynamic_theme--bg2);
    --theme--tag_brown: var(--dynamic_theme--fg3);
    --theme--tag_brown-text: var(--dynamic_theme--bg2);
    --theme--tag_orange: var(--dynamic_theme--orange_dark);
    --theme--tag_orange-text: var(--dynamic_theme--bg0);
    --theme--tag_yellow: var(--dynamic_theme--yellow_dark);
    --theme--tag_yellow-text: var(--dynamic_theme--bg0);
    --theme--tag_green: var(--dynamic_theme--green_dark);
    --theme--tag_green-text: var(--dynamic_theme--bg0);
    --theme--tag_blue: var(--dynamic_theme--blue_dark);
    --theme--tag_blue-text: var(--dynamic_theme--bg0);
    --theme--tag_purple: var(--dynamic_theme--purple_dark);
    --theme--tag_purple-text: var(--dynamic_theme--bg0);
    --theme--tag_pink: var(--dynamic_theme--purple_light);
    --theme--tag_pink-text: var(--dynamic_theme--bg0);
    --theme--tag_red: var(--dynamic_theme--red_dark);
    --theme--tag_red-text: var(--dynamic_theme--bg0);
  
    --theme--board_light_gray: var(--dynamic_theme--light_gray_dark);
    --theme--board_light_gray-text: var(--dynamic_theme--bg0);
    --theme--board_light_gray-card: var(--theme--tag_light_gray);
    --theme--board_gray: var(--theme--text_gray);
    --theme--board_gray-text: var(--dynamic_theme--bg0);
    --theme--board_gray-card: var(--theme--tag_gray);
    --theme--board_brown: var(--theme--text_brown);
    --theme--board_brown-text: var(--dynamic_theme--bg0);
    --theme--board_brown-card: var(--theme--tag_brown);
    --theme--board_orange: var(--theme--text_orange);
    --theme--board_orange-text: var(--dynamic_theme--bg0);
    --theme--board_orange-card: var(--theme--tag_orange);
    --theme--board_yellow: var(--theme--text_yellow);
    --theme--board_yellow-text: var(--dynamic_theme--bg0);
    --theme--board_yellow-card: var(--theme--tag_yellow);
    --theme--board_green: var(--theme--text_green);
    --theme--board_green-text: var(--dynamic_theme--bg0);
    --theme--board_green-card: var(--theme--tag_green);
    --theme--board_blue: var(--theme--text_blue);
    --theme--board_blue-text: var(--dynamic_theme--bg0);
    --theme--board_blue-card: var(--theme--tag_blue);
    --theme--board_purple: var(--theme--text_purple);
    --theme--board_purple-text: var(--dynamic_theme--bg0);
    --theme--board_purple-card: var(--theme--tag_purple);
    --theme--board_pink: var(--theme--text_pink);
    --theme--board_pink-text: var(--dynamic_theme--bg0);
    --theme--board_pink-card: var(--theme--tag_pink);
    --theme--board_red: var(--theme--text_red);
    --theme--board_red-text: var(--dynamic_theme--bg0);
    --theme--board_red-card: var(--theme--tag_red);
  
    --theme--code_inline: var(--dynamic_theme--bg1);
    --theme--code_inline-text: var(--dynamic_theme--blue_light);
  
    --theme--code: var(--dynamic_theme--bg1);
    --theme--code_function: var(--theme--text_blue);
    --theme--code_keyword: var(--theme--text_pink);
    --theme--code_tag: var(--theme--text_pink);
    --theme--code_operator: var(--theme--text_yellow);
    --theme--code_important: var(--theme--text_yellow);
    --theme--code_property: var(--theme--text_pink);
    --theme--code_builtin: var(--theme--text_yellow);
    --theme--code_attr-name: var(--theme--text_yellow);
    --theme--code_comment: var(--theme--text_ui);
    --theme--code_punctuation: var(--dynamic_theme--aqua_light);
    --theme--code_doctype: var(--dynamic_theme--aqua_light);
    --theme--code_number: var(--theme--text_purple);
    --theme--code_string: var(--theme--text_orange);
    --theme--code_attr-value: var(--theme--text_orange);
  }
}
THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"