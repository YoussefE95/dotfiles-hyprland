#!/bin/bash
palette=("${@}")

dest_dir="$HOME/Dropbox/Documents/Vault/.obsidian/themes/dynamic"
dest_file="theme.css"

output="$(cat << THEME
:root
{
    --dark0-hard_x:     #${palette[1]};
    --dark0-hard:       var(--dark0-hard_x);
    --dark0_x:          #${palette[0]};
    --dark0:            var(--dark0_x);
    --dark0-soft_x:     #${palette[0]};
    --dark0-soft:       var(--dark0-soft_x);
    --dark1_x:          #${palette[1]}; 
    --dark1:            var(--dark1_x);
    --dark2_x:          #${palette[3]};
    --dark2:            var(--dark2_x);
    --dark3_x:          #${palette[3]};
    --dark3:            var(--dark3_x);
    --dark4_x:          #${palette[3]};
    --dark4:            var(--dark4_x);
    --gray_x:           #${palette[3]};
    --gray:             var(--gray_x);

    --light0-hard_x:    #${palette[2]};
    --light0-hard:      var(--light0-hard_x);
    --light0_x:         #${palette[2]};
    --light0:           var(--light0_x);
    --light0-soft_x:    #${palette[2]};
    --light0-soft:      var(--light0-soft_x);
    --light1_x:         #${palette[2]};
    --light1:           var(--light1_x);
    --light2_x:         #${palette[2]};
    --light2:           var(--light2_x);
    --light3_x:         #${palette[2]};
    --light3:           var(--light3_x);
    --light4_x:         #${palette[2]};
    --light4:           var(--light4_x);

    --bright-red_x:     #${palette[4]};
    --bright-red:       var(--bright-red_x);
    --bright-green_x:   #${palette[5]};
    --bright-green:     var(--bright-green_x);
    --bright-yellow_x:  #${palette[6]};
    --bright-yellow:    var(--bright-yellow_x);
    --bright-blue_x:    #${palette[7]};
    --bright-blue:      var(--bright-blue_x);
    --bright-purple_x:  #${palette[8]};
    --bright-purple:    var(--bright-purple_x);
    --bright-aqua_x:    #${palette[9]};
    --bright-aqua:      var(--bright-aqua_x);
    --bright-orange_x:  #${palette[10]};
    --bright-orange:    var(--bright-orange_x);

    --neutral-red_x:    #${palette[4]};
    --neutral-red:      var(--neutral-red_x);
    --neutral-green_x:  #${palette[5]};
    --neutral-green:    var(--neutral-green_x);
    --neutral-yellow_x: #${palette[6]};
    --neutral-yellow:   var(--neutral-yellow_x);
    --neutral-blue_x:   #${palette[7]};
    --neutral-blue:     var(--neutral-blue_x);
    --neutral-purple_x: #${palette[8]};
    --neutral-purple:   var(--neutral-purple_x);
    --neutral-aqua_x:   #${palette[9]};
    --neutral-aqua:     var(--neutral-aqua_x);
    --neutral-orange_x: #${palette[10]};
    --neutral-orange:   var(--neutral-orange_x);

    --faded-red_x:      #${palette[4]};
    --faded-red:        var(--faded-red_x);
    --faded-green_x:    #${palette[5]};
    --faded-green:      var(--faded-green_x);
    --faded-yellow_x:   #${palette[6]};
    --faded-yellow:     var(--faded-yellow_x);
    --faded-blue_x:     #${palette[7]};
    --faded-blue:       var(--faded-blue_x);
    --faded-purple_x:   #${palette[8]};
    --faded-purple:     var(--faded-purple_x);
    --faded-aqua_x:     #${palette[9]};
    --faded-aqua:       var(--faded-aqua_x);
    --faded-orange_x:   #${palette[10]};
    --faded-orange:     var(--faded-orange_x);
}

body
{
    --accent-h: 12; /* --faded-red #9d0006 */
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
    --color-red-rgb:                 var(--neutral-red_x);
    --color-red:                     var(--neutral-red);
    --color-purple-rgb:              var(--neutral-purple_x);
    --color-purple:                  var(--neutral-purple);
    --color-green-rgb:               var(--neutral-green_x);
    --color-green:                   var(--neutral-green);
    --color-cyan-rgb:                var(--neutral-blue_x);
    --color-cyan:                    var(--neutral-blue);
    --color-blue-rgb:                var(--faded-blue_x);
    --color-blue:                    var(--faded-blue);
    --color-yellow-rgb:              var(--neutral-yellow_x);
    --color-yellow:                  var(--neutral-yellow);
    --color-orange-rgb:              var(--neutral-orange_x);
    --color-orange:                  var(--neutral-orange);
    --color-pink-rgb:                var(--bright-purple_x);
    --color-pink:                    var(--bright-purple);

    --background-primary:            var(--dark0);
    --background-primary-alt:        var(--dark0);
    --background-secondary:          var(--dark0-hard);
    --background-secondary-alt:      var(--dark1);
    --background-modifier-border:    var(--dark1);

    --cursor-line-background:        #${palette[1]}60;

    --text-normal:                   var(--light0);
    --text-faint:                    var(--light1);
    --text-muted:                    var(--light2);

    --link-url:                      var(--neutral-green);

    --h1-color:                      var(--neutral-red);
    --h2-color:                      var(--neutral-yellow);
    --h3-color:                      var(--neutral-green);
    --h4-color:                      var(--neutral-aqua);
    --h5-color:                      var(--neutral-blue);
    --h6-color:                      var(--neutral-purple);

    --text-highlight-bg:             var(--neutral-yellow);
    --text-highlight-fg:             var(--dark0-hard);

    --text-accent:                   var(--neutral-orange);
    --text-accent-hover:             var(--bright-aqua);

    --tag-color:                     var(--bright-aqua);
    --tag-background:                var(--dark2);
    --tag-background-hover:          var(--dark1);

    --titlebar-text-color-focused:   var(--light0);

    --inline-title-color:            var(--bright-yellow);

    --bold-color:                    var(--neutral-yellow);
    --italic-color:                  var(--neutral-yellow);

    --checkbox-color:                var(--light4);
    --checkbox-color-hover:          var(--light4);
    --checkbox-border-color:         var(--light4);
    --checkbox-border-color-hover:   var(--light4);
    --checklist-done-color:          #${palette[2]}50;

    --table-header-background:       #${palette[1]}20;
    --table-header-background-hover: #${palette[1]}60;
    --table-row-even-background:     #${palette[1]}20;
    --table-row-odd-background:      #${palette[1]}40;
    --table-row-background-hover:    #${palette[1]}60;

    --text-selection:                #${palette[8]}65;
    --flashing-background:           #${palette[8]}35;

    --code-normal:                   var(--bright-blue);
    --code-background:               var(--dark1);

    --mermaid-note:                  var(--neutral-blue);
    --mermaid-actor:                 var(--dark2);
    --mermaid-loopline:              var(--neutral-blue);
    --mermaid-exclude:               var(--dark4);
    --mermaid-seqnum:                var(--dark0);

    --icon-color-hover:              var(--bright-red);
    --icon-color-focused:            var(--bright-blue);

    --nav-item-color-hover:          var(--bright-red);
    --nav-item-color-active:         var(--bright-aqua);
    --nav-file-tag:                  #${palette[6]}90;

    --graph-line:                    var(--dark2);
    --graph-node:                    var(--light3);
    --graph-node-tag:                var(--neutral-red);
    --graph-node-attachment:         var(--neutral-green);

    --calendar-hover:                var(--bright-red);
    --calendar-background-hover:     var(--dark1);
    --calendar-week:                 var(--neutral-orange);
    --calendar-today:                var(--neutral-orange);

    --dataview-key:                  var(--text-faint);
    --dataview-key-background:       #${palette[4]}50;
    --dataview-value:                var(--text-faint);
    --dataview-value-background:     #${palette[5]}30;

    --tab-text-color-focused-active:         var(--neutral-yellow);
    --tab-text-color-focused-active-current: var(--bright-red);

    --background-modifier-form-field: #${palette[1]};

    --interactive-normal: #${palette[1]};
    --interactive-hover: #${palette[3]};
}

.theme-light
{
    --color-red-rgb:                 var(--neutral-red_x);
    --color-red:                     var(--neutral-red);
    --color-purple-rgb:              var(--neutral-purple_x);
    --color-purple:                  var(--neutral-purple);
    --color-green-rgb:               var(--neutral-green_x);
    --color-green:                   var(--neutral-green);
    --color-cyan-rgb:                var(--neutral-blue_x);
    --color-cyan:                    var(--neutral-blue);
    --color-blue-rgb:                var(--faded-blue_x);
    --color-blue:                    var(--faded-blue);
    --color-yellow-rgb:              var(--neutral-yellow_x);
    --color-yellow:                  var(--neutral-yellow);
    --color-orange-rgb:              var(--neutral-orange_x);
    --color-orange:                  var(--neutral-orange);
    --color-pink-rgb:                var(--bright-purple_x);
    --color-pink:                    var(--bright-purple);

    --background-primary:            var(--light0-hard);
    --background-primary-alt:        var(--light0-hard);
    --background-secondary:          var(--light1);
    --background-secondary-alt:      var(--light1);
    --background-modifier-border:    var(--light2);

    --cursor-line-background:        rgba(var(--light1_x), 0.5);

    --text-normal:                   var(--dark0);
    --text-faint:                    var(--dark3);
    --text-muted:                    var(--dark2);

    --link-url:                      var(--neutral-green);

    --h1-color:                      var(--neutral-red);
    --h2-color:                      var(--neutral-yellow);
    --h3-color:                      var(--neutral-green);
    --h4-color:                      var(--neutral-aqua);
    --h5-color:                      var(--neutral-blue);
    --h6-color:                      var(--neutral-purple);

    --text-highlight-bg:             var(--bright-yellow);
    --text-highlight-fg:             var(--dark0);

    --text-accent:                   var(--neutral-orange);
    --text-accent-hover:             var(--bright-aqua);

    --tag-color:                     var(--neutral-aqua);
    --tag-background:                var(--light1);
    --tag-background-hover:          rgba(var(--light1_x), 0.6);

    --titlebar-text-color-focused:   var(--bright-red);

    --inline-title-color:            var(--bright-yellow);

    --bold-color:                    var(--neutral-yellow);
    --italic-color:                  var(--neutral-yellow);

    --checkbox-color:                var(--light4);
    --checkbox-color-hover:          var(--light4);
    --checkbox-border-color:         var(--light4);
    --checkbox-border-color-hover:   var(--light4);
    --checklist-done-color:          rgba(var(--dark2_x), 0.4);

    --table-header-background:       rgba(var(--light3_x), 0.4);
    --table-header-background-hover: var(--light2);
    --table-row-even-background:     rgba(var(--light1_x), 0.2);
    --table-row-odd-background:      rgba(var(--light1_x), 0.7);
    --table-row-background-hover:    var(--light2);

    --text-selection:                rgba(var(--neutral-red_x), 0.6);
    --flashing-background:           rgba(var(--neutral-red_x), 0.3);

    --code-normal:                   var(--bright-blue);
    --code-background:               var(--light1);

    --mermaid-note:                  var(--bright-blue);
    --mermaid-actor:                 var(--light3);
    --mermaid-loopline:              var(--neutral-blue);
    --mermaid-exclude:               var(--light2);
    --mermaid-seqnum:                var(--light0);

    --icon-color-hover:              var(--bright-red);
    --icon-color-focused:            var(--bright-blue);

    --nav-item-color-hover:          var(--bright-red);
    --nav-item-color-active:         var(--neutral-blue);
    --nav-file-tag:                  rgba(var(--neutral-blue_x), 0.9);

    --graph-line:                    var(--light1);
    --graph-node:                    var(--gray);
    --graph-node-tag:                var(--neutral-red);
    --graph-node-attachment:         var(--bright-green);

    --calendar-hover:                var(--bright-red);
    --calendar-background-hover:     var(--light1);
    --calendar-week:                 var(--bright-red);
    --calendar-today:                var(--bright-red);

    --dataview-key:                  var(--text-faint);
    --dataview-key-background:       rgba(var(--faded-red_x), 0.3);
    --dataview-value:                var(--text-faint);
    --dataview-value-background:     rgba(var(--neutral-green_x), 0.2);

    --tab-text-color-focused-active:         var(--neutral-yellow);
    --tab-text-color-focused-active-current: var(--bright-red);
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
    background-color: var(--text-highlight-bg);
    color: var(--text-highlight-fg);
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

.cm-url
{
    color: var(--link-url) !important;
}

.cm-url:hover
{
    color: var(--text-accent-color) !important;
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

.cm-line .cm-strong
{
    color: var(--bold-color) !important;
}

/*
 * Keep list bullet padding the same between viewer and editor.
 * This is annoying with the cursor in the editor as there is a gap.
 */
/*
.cm-formatting-list
{
    padding-right: 4px !important;
}
*/

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

.mermaid .loopText>tspan,
.mermaid .entityLabel
{
    fill: var(--neutral-red) !important;
}

.mermaid .exclude-range
{
    fill: var(--mermaid-exclude) !important;
}

.mermaid .sequenceNumber
{
    fill: var(--mermaid-seqnum) !important;
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
    color: var(--bright-red);
}

body {
    --callout-border-width: 1px;
    --callout-border-opacity: 0.4;
    /* Order as defined in app.css */
    --callout-default: var(--neutral-blue_x);
    --callout-note: var(--neutral-blue_x);
    --callout-summary: var(--neutral-aqua_x);
    --callout-info: var(--neutral-blue_x);
    --callout-todo: var(--neutral-blue_x);
    --callout-important: var(--neutral-aqua_x);
    --callout-tip: var(--neutral-aqua_x);
    --callout-success: var(--neutral-green_x);
    --callout-question: var(--neutral-yellow_x);
    --callout-warning: var(--neutral-orange_x);
    --callout-fail: var(--neutral-red_x);
    --callout-error: var(--neutral-red_x);
    --callout-bug: var(--neutral-red_x);
    --callout-example: var(--neutral-purple_x);
    --callout-quote: var(--gray_x);
}

.callout {
    background-color: rgba(var(--callout-color), 0.2);
}
THEME
)"

printf '%s' "$output" > "${dest_dir}/${dest_file}"

