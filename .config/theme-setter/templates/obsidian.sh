dest_dir="$HOME/Dropbox/Obsidian/.obsidian/themes/Dynamic/"
dest_file="theme.css"

[[ -d "$dest_dir" ]] || mkdir -pv "$dest_dir"

output="$(cat << THEME

:root
{
    --dark0-hard:       #$(jq -r ".colors.\"$1\".background" "$2");
    --dark0:            #$(jq -r ".colors.\"$1\".background" "$2");
    --dark0-soft:       #$(jq -r ".colors.\"$1\".background" "$2");
    --dark1:            #$(jq -r ".colors.\"$1\".black" "$2");
    --dark2:            #$(jq -r ".colors.\"$1\".background" "$2");
    --dark3:            #$(jq -r ".colors.\"$1\".black" "$2");
    --dark4:            #$(jq -r ".colors.\"$1\".black" "$2");
    --gray:             #$(jq -r ".colors.\"$1\".gray" "$2");
    --hover:             #$(jq -r ".colors.\"$1\".gray" "$2")20;

    --light0-hard:      #$(jq -r ".colors.\"$1\".foreground" "$2");
    --light0:           #$(jq -r ".colors.\"$1\".foreground" "$2");
    --light0-soft:      #$(jq -r ".colors.\"$1\".foreground" "$2");
    --light1:           #$(jq -r ".colors.\"$1\".foreground" "$2");
    --light2:           #$(jq -r ".colors.\"$1\".white" "$2");
    --light3:           #$(jq -r ".colors.\"$1\".white" "$2");
    --light4:           #$(jq -r ".colors.\"$1\".gray" "$2");

    --red:      #$(jq -r ".colors.\"$1\".red" "$2");
    --green:    #$(jq -r ".colors.\"$1\".green" "$2");
    --yellow:   #$(jq -r ".colors.\"$1\".yellow" "$2");
    --blue:     #$(jq -r ".colors.\"$1\".blue" "$2");
    --purple:   #$(jq -r ".colors.\"$1\".magenta" "$2");
    --aqua:     #$(jq -r ".colors.\"$1\".cyan" "$2");
    --orange:   #$(jq -r ".colors.\"$1\".orange" "$2");
}

body
{
    --accent-h: var(--green);
    --accent-s: 107%;
    --accent-l: 32%;

    --link-decoration:                none;
    --link-decoration-hover:          none;
    --link-external-decoration:       none;
    --link-external-decoration-hover: none;

    --tag-decoration:                 none;
    --tag-decoration-hover:           underline;
    --tag-padding-x:                  .5em;
    --tag-padding-y:                  .2em;
    --tag-radius:                     .5em;

    --tab-font-weight:                600;
    --bold-weight:                    600;

    --checkbox-radius:                0;

    /* --list-indent:                    2em; */

    --embed-border-left: 6px double var(--interactive-accent);
}

.theme-dark
{
    --color-red:                     var(--red);
    --color-purple:                  var(--purple);
    --color-green:                   var(--green);
    --color-cyan:                    var(--blue);
    --color-blue:                    var(--blue);
    --color-yellow:                  var(--yellow);
    --color-orange:                  var(--orange);
    --color-pink:                    var(--purple);

    --background-primary:            var(--dark0);
    --background-primary-alt:        var(--dark0);
    --background-secondary:          var(--dark0-hard);
    --background-secondary-alt:      var(--dark1);
    --background-modifier-border:    var(--dark1);

    --cursor-line-background:        var(--hover);

    --text-normal:                   var(--light0);
    --text-faint:                    var(--light1);
    --text-muted:                    var(--light2);

    --h1-color:                      var(--red);
    --h2-color:                      var(--yellow);
    --h3-color:                      var(--green);
    --h4-color:                      var(--aqua);
    --h5-color:                      var(--blue);
    --h6-color:                      var(--purple);

    --text-highlight-bg:             var(--yellow);
    --text-highlight-fg:             var(--dark0-hard);

    --text-accent:                   var(--orange);
    --text-accent-hover:             var(--aqua);

    --tag-color:                     var(--aqua);
    --tag-background:                var(--dark2);
    --tag-background-hover:          var(--dark1);

    --titlebar-text-color-focused:   var(--red);

    --inline-title-color:            var(--yellow);

    --bold-color:                    var(--yellow);
    --italic-color:                  var(--yellow);

    --checkbox-color:                var(--light4);
    --checkbox-color-hover:          var(--light4);
    --checkbox-border-color:         var(--light4);
    --checkbox-border-color-hover:   var(--light4);
    --checklist-done-color:          rgba(var(--light2_x), 0.5);

    --table-header-background:       rgba(var(--dark0_x), 0.2);
    --table-header-background-hover: var(--dark2);
    --table-row-even-background:     rgba(var(--dark2_x), 0.2);
    --table-row-odd-background:      rgba(var(--dark2_x), 0.4);
    --table-row-background-hover:    var(--dark2);

    --text-selection:                var(--hover);
    --flashing-background:           var(--hover);

    --code-normal:                   var(--blue);
    --code-background:               var(--dark1);

    --mermaid-note:                  var(--blue);
    --mermaid-actor:                 var(--dark2);
    --mermaid-loopline:              var(--blue);

    --icon-color-hover:              var(--red);
    --icon-color-focused:            var(--blue);

    --nav-item-color-hover:          var(--red);
    --nav-item-color-active:         var(--aqua);
    --nav-file-tag:                  var(--hover);

    --graph-line:                    var(--dark2);
    --graph-node:                    var(--light3);
    --graph-node-tag:                var(--red);
    --graph-node-attachment:         var(--green);

    --calendar-hover:                var(--red);
    --calendar-background-hover:     var(--dark1);
    --calendar-week:                 var(--orange);
    --calendar-today:                var(--orange);

    --dataview-key:                  var(--text-faint);
    --dataview-key-background:       var(--hover);
    --dataview-value:                var(--text-faint);
    --dataview-value-background:     var(--hover);

    --tab-text-color-focused-active:         var(--yellow);
    --tab-text-color-focused-active-current: var(--yellow);
}

table
{
    border: 1px solid var(--background-secondary) !important;
    border-collapse: collapse;
}

thead
{
    border-bottom: 2px solid var(--background-modifier-border) !important;
}
  
th
{
    font-weight: 600 !important;
    border: 1px solid var(--background-secondary) !important;
}

td
{
    border-left: 1px solid var(--background-secondary) !important;
    border-right: 1px solid var(--background-secondary) !important;
    border-bottom: 1px solid var(--background-secondary) !important;
}

.markdown-rendered tbody tr:nth-child(even)
{
    background-color: var(--table-row-even-background) !important;
}

.markdown-rendered tbody tr:nth-child(odd)
{
    background-color: var(--table-row-odd-background) !important;
}

.markdown-rendered tbody tr:nth-child(even):hover,
.markdown-rendered tbody tr:nth-child(odd):hover
{
    background-color: var(--table-row-background-hover) !important;
}

.markdown-rendered mark
{
    background-color: var(--text-highlight-bg) !important;
    color: var(--text-highlight-fg) !important;
}

.markdown-rendered mark a
{
    color: var(--red) !important;
    font-weight: 600;
}

.search-result-file-matched-text
{
    color: var(--text-highlight-fg) !important;
}

.cm-hashtag-begin:hover, .cm-hashtag-end:hover
{
    color: var(--text-accent);
    /* background-color: var(--tag-background-hover); */
    text-decoration: underline;
}

input[type=checkbox]
{
    border: 1px solid var(--checkbox-color);
}

input[type=checkbox]:checked
{
    background-color: var(--checkbox-color);
    box-shadow: inset 0 0 0 2px var(--background-primary);
}

input[type=checkbox]:checked:after
{
    display: none;
}

code[class*="language-"],
pre[class*="language-"]
{
    line-height: var(--line-height-tight) !important;
}

/* Keep highlight/marks the same between viewer and editor. */
.cm-highlight
{
    color: var(--text-highlight-fg) !important;
}

/* Keep inline code the same between viewer and editor. */
.cm-inline-code
{
    border-radius: var(--radius-s);
    font-size: var(--code-size);
    padding: 0.1em 0.25em;
}

/* Keep list bullet padding the same between viewer and editor. */
.cm-formatting-list
{
    padding-right: 4px !important;
}

/*
 * Keep sub-list indenting the same between viewer and editor.
 * This assumes --list-indent is default at 2em.
 */
/*
.cm-indent 
{
    text-indent: 1em !important;
}
*/

.mermaid .note
{
    fill: var(--mermaid-note) !important;
}

.mermaid .actor
{
    fill: var(--mermaid-actor) !important;
}

.mermaid .loopLine
{
    stroke: var(--mermaid-loopline) !important;
}

.calendar .week-num
{
    color: var(--calendar-week) !important;
}

.calendar .today
{
    color: var(--calendar-today) !important;
}

.calendar .week-num:hover,
.calendar .day:hover
{
    color: var(--calendar-hover) !important;
    background-color: var(--calendar-background-hover) !important;
}

.markdown-embed-title
{
    color: var(--yellow);
    font-weight: 600 !important;
}

.cm-active
{
    background-color: var(--cursor-line-background) !important;
}

.nav-file-tag
{
    color: var(--nav-file-tag) !important;
}

.is-flashing
{
    background-color: var(--flashing-background) !important;
}

.dataview.inline-field-key
{
    border-top-left-radius: var(--radius-s);
    border-bottom-left-radius: var(--radius-s);
    padding-left: 4px;
    font-family: var(--font-monospace);
    font-size: var(--font-smaller);
    color: var(--dataview-key) !important;
    background-color: var(--dataview-key-background) !important;
}

.dataview.inline-field-value
{
    border-top-right-radius: var(--radius-s);
    border-bottom-right-radius: var(--radius-s);
    padding-right: 4px;
    font-family: var(--font-monospace);
    font-size: var(--font-smaller);
    color: var(--dataview-value) !important;
    background-color: var(--dataview-value-background) !important;
}

.suggestion-highlight
{
    color: var(--red);
}
THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"