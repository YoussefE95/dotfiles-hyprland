#!/bin/bash
palette=("${@}")

dest_dir="$HOME/.local/share/themes/${palette[13]}/gtk-3.0"
dest_file="gtk.css"

output="$(cat << THEME
@keyframes ripple {
  to {
    background-size: 1000% 1000%;
  }
}
@keyframes ripple-on-slider {
  to {
    background-size: auto, 1000% 1000%;
  }
}
@keyframes ripple-on-headerbar {
  from {
    background-image: radial-gradient(circle, #${palette[7]} 0%, transparent 0%);
  }
  to {
    background-image: radial-gradient(circle, #${palette[7]} 100%, transparent 0%);
  }
}
button, modelbutton.flat,
.menuitem.button.flat, notebook > header > tabs > arrow, check,
radio, row.activatable {
  transition-property: all, border-image, background-size, background-image;
  transition-duration: 75ms, 225ms, 300ms, 1200ms;
  transition-timing-function: cubic-bezier(0, 0, 0.2, 1);
  outline: none;
  background-image: radial-gradient(circle, transparent 10%, transparent 0%);
  background-repeat: no-repeat;
  background-position: center;
  background-size: 1000% 1000%;
}
button:active, modelbutton.flat:active,
.menuitem.button.flat:active, notebook > header > tabs > arrow:active, check:active,
radio:active, row.activatable:active {
  transition-duration: 75ms, 225ms, 0ms, 0ms;
  animation: ripple 225ms cubic-bezier(0, 0, 0.2, 1) forwards;
  background-size: 0% 0%;
  color: #${palette[2]};
}

* {
  -GtkToolButton-icon-spacing: 0;
  -GtkTextView-error-underline-color: #${palette[0]};
  -GtkScrolledWindow-scrollbar-spacing: 0;
  -GtkToolItemGroup-expander-size: 11;
  -GtkWidget-text-handle-width: 24;
  -GtkWidget-text-handle-height: 24;
  -GtkDialog-button-spacing: 4;
  -GtkDialog-action-area-border: 4;
  -gtk-secondary-caret-color: #${palette[5]};
  outline: 2px solid transparent;
  outline-offset: -4px;
  -gtk-outline-radius: 6px;
  color: #${palette[2]};
}
*:focus {
  outline-color: rgba(212, 190, 152, 0.08);
}

/**
 * Base States
 */
.background {
  background-color: #${palette[0]};
  color: #${palette[2]};
}

/*
   These wildcard seems unavoidable, need to investigate.
   Wildcards are bad and troublesome, use them with care,
   or better, just don't.
   Everytime a wildcard is used a kitten dies, painfully.
*/
*:disabled {
  -gtk-icon-effect: dim;
}

.gtkstyle-fallback {
  background-color: #${palette[0]};
  color: #${palette[2]};
}
.gtkstyle-fallback:hover {
  background-color: #${palette[1]};
}
.gtkstyle-fallback:active {
  background-color: #${palette[1]};
}
.gtkstyle-fallback:disabled {
  color: rgba(212, 190, 152, 0.5);
}
.gtkstyle-fallback:selected {
  background-color: #${palette[7]};
  color: #${palette[0]};
}

.view:hover {
  background-color: rgba(212, 190, 152, 0.04);
}
.view:selected:hover {
  background-color: rgba(138, 180, 248, 0.632);
}
.view:disabled {
  color: rgba(212, 190, 152, 0.5);
}
.view:hover, .view:selected {
  border-radius: 6px;
}
.view selection, .view:selected {
  background-color: rgba(138, 180, 248, 0.6);
}

textview text {
  background-color: #${palette[0]};
  caret-color: #${palette[7]};
}
frame:not(.flat) textview text, .frame textview text {
  background-color: #${palette[0]};
}
popover.background textview text {
  background-color: #${palette[1]};
}
messagedialog.background textview text {
  background-color: #${palette[1]};
}
textview border {
  color: rgba(212, 190, 152, 0.7);
}

.nemo-desktop.nemo-canvas-item, .caja-desktop.caja-canvas-item, .nautilus-desktop.nautilus-canvas-item {
  color: #${palette[2]}
  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.2), 0 1px 2px rgba(0, 0, 0, 0.14), 0 1px 3px rgba(0, 0, 0, 0.12);
}
.nemo-desktop.nemo-canvas-item .rubberband, .caja-desktop.caja-canvas-item .rubberband, .nautilus-desktop.nautilus-canvas-item .rubberband,
.nemo-desktop.nemo-canvas-item rubberband,
.caja-desktop.caja-canvas-item rubberband,
.nautilus-desktop.nautilus-canvas-item rubberband {
  border: 1px solid #${palette[7]};
  background-color: rgba(138, 180, 248, 0.3);
}

XfdesktopIconView.view .rubberband, .content-view rubberband,
.content-view .rubberband, treeview.view rubberband, flowbox rubberband,
.rubberband,
rubberband {
  border: 1px solid #${palette[7]};
  background-color: rgba(138, 180, 248, 0.24);
}

flowbox flowboxchild {
  padding: 4px;
  border-radius: 6px;
}
flowbox flowboxchild:selected {
  background-color: rgba(138, 180, 248, 0.6);
}

.content-view .tile:selected {
  background-color: transparent;
}

label {
  caret-color: #${palette[7]};
}
label.separator {
  color: rgba(212, 190, 152, 0.7);
}
label.error {
  color: #${palette[4]};
}
label selection {
  background-color: rgba(138, 180, 248, 0.6);
}
label:disabled {
  color: rgba(212, 190, 152, 0.5);
}
headerbar label:disabled, menuitem label:disabled, tab label:disabled, button label:disabled {
  color: inherit;
}
label.osd {
  border-radius: 6px;
  background-color: rgba(50, 48, 47, 0.9);
  color: #${palette[2]};
}

.dim-label {
  color: rgba(212, 190, 152, 0.7);
}

assistant .sidebar {
  padding: 4px 0;
}
assistant .sidebar label {
  min-height: 32px;
  margin: 0 4px;
  padding: 0 8px;
  border-radius: 6px;
  color: rgba(212, 190, 152, 0.5);
  font-weight: 500;
}
assistant .sidebar label.highlight {
  background-color: rgba(138, 180, 248, 0.16);
  color: #${palette[7]};
}

/**
 * Spinner Animation
 */
@keyframes spin {
  to {
    -gtk-icon-transform: rotate(1turn);
  }
}
spinner {
  background: none;
  opacity: 0;
  color: #${palette[7]};
  -gtk-icon-source: -gtk-icontheme("process-working-symbolic");
  transition: opacity 300ms cubic-bezier(0, 0, 0.2, 1);
  animation: spin 1s linear infinite;
}
spinner:checked {
  opacity: 1;
}
spinner:disabled {
  color: rgba(212, 190, 152, 0.3);
}

/**
 * General Typography
 */
.large-title {
  font-weight: 400;
  font-size: 36pt;
}

.title-1, .nautilus-empty-state-icon + .large-title {
  font-weight: 400;
  font-size: 25.5pt;
  letter-spacing: 0.1875pt;
}

.title-2 {
  font-weight: 400;
  font-size: 18pt;
}

.title-3 {
  font-weight: 500;
  font-size: 15pt;
  letter-spacing: 0.1125pt;
}

.title-4 {
  font-weight: 400;
  font-size: 12pt;
  letter-spacing: 0.375pt;
}

.heading {
  font-weight: 500;
  font-size: 1em;
}

.body {
  font-weight: 400;
  font-size: 1em;
}

.caption-heading {
  font-weight: 500;
  font-size: 9pt;
  letter-spacing: 1.125pt;
}

.caption {
  font-weight: 400;
  font-size: 9pt;
  letter-spacing: 0.3pt;
}

/**
 * Text Entries
 */
spinbutton:not(.vertical),
entry {
  min-height: 32px;
  padding: 0 8px;
  border-radius: 6px 6px 0 0;
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1), border-image 225ms cubic-bezier(0, 0, 0.2, 1);
  border-image: radial-gradient(circle closest-corner at center calc(100% - 1px), #${palette[7]} 0%, transparent 0%) 2/0 0 0;
  box-shadow: inset 0 -1px rgba(212, 190, 152, 0.3);
  background-color: rgba(212, 190, 152, 0.04);
  color: #${palette[2]};
  caret-color: #${palette[7]};
}
spinbutton:focus:not(.vertical),
entry:focus {
  border-image: radial-gradient(circle closest-corner at center calc(100% - 1px), #${palette[7]} 100%, transparent 0%) 2/0 0 2px;
  box-shadow: inset 0 -1px rgba(212, 190, 152, 0.3);
  background-color: rgba(212, 190, 152, 0.1168);
}
spinbutton:drop(active):not(.vertical),
entry:drop(active) {
  box-shadow: inset 0 -1px rgba(212, 190, 152, 0.3);
  background-color: rgba(212, 190, 152, 0.0784);
}
spinbutton:disabled:not(.vertical),
entry:disabled {
  box-shadow: inset 0 -1px rgba(212, 190, 152, 0.2);
  background-color: rgba(212, 190, 152, 0.04);
  color: rgba(212, 190, 152, 0.5);
}
spinbutton.flat:not(.vertical),
entry.flat {
  min-height: 0;
  padding: 2px;
  border-radius: 0;
  background-color: transparent;
}
spinbutton:not(.vertical) image,
entry image {
  color: rgba(212, 190, 152, 0.7);
}
spinbutton:not(.vertical) image:hover, spinbutton:not(.vertical) image:active,
entry image:hover,
entry image:active {
  color: #${palette[2]};
}
spinbutton:not(.vertical) image:disabled,
entry image:disabled {
  color: rgba(212, 190, 152, 0.5);
}
spinbutton:not(.vertical) image.left,
entry image.left {
  margin-left: 0px;
  margin-right: 6px;
}
spinbutton:not(.vertical) image.right,
entry image.right {
  margin-left: 6px;
  margin-right: 0px;
}
spinbutton:not(.vertical) selection,
entry selection {
  background-color: rgba(138, 180, 248, 0.6);
}
spinbutton.error:not(.vertical),
entry.error {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1), border-image 225ms cubic-bezier(0, 0, 0.2, 1);
  border-image: radial-gradient(circle closest-corner at center calc(100% - 1px), #${palette[4]} 0%, transparent 0%) 2/0 0 0;
  box-shadow: inset 0 -1px #${palette[4]};
  background-color: rgba(212, 190, 152, 0.04);
  color: #${palette[2]};
  caret-color: #${palette[4]};
}
spinbutton.error:focus:not(.vertical),
entry.error:focus {
  border-image: radial-gradient(circle closest-corner at center calc(100% - 1px), #${palette[0]} 100%, transparent 0%) 2/0 0 2px;
  box-shadow: inset 0 -1px #${palette[4]};
  background-color: rgba(212, 190, 152, 0.1168);
}
spinbutton.error:disabled:not(.vertical),
entry.error:disabled {
  box-shadow: inset 0 -1px rgba(212, 190, 152, 0.2);
  background-color: rgba(212, 190, 152, 0.04);
  color: rgba(212, 190, 152, 0.5);
}
spinbutton.warning:not(.vertical),
entry.warning {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1), border-image 225ms cubic-bezier(0, 0, 0.2, 1);
  border-image: radial-gradient(circle closest-corner at center calc(100% - 1px), #${palette[5]} 0%, transparent 0%) 2/0 0 0;
  box-shadow: inset 0 -1px #${palette[5]};
  background-color: rgba(212, 190, 152, 0.04);
  color: #${palette[2]};
  caret-color: #${palette[5]};
}
spinbutton.warning:focus:not(.vertical),
entry.warning:focus {
  border-image: radial-gradient(circle closest-corner at center calc(100% - 1px), #${palette[5]} 100%, transparent 0%) 2/0 0 2px;
  box-shadow: inset 0 -1px #${palette[5]};
  background-color: rgba(212, 190, 152, 0.1168);
}
spinbutton.warning:disabled:not(.vertical),
entry.warning:disabled {
  box-shadow: inset 0 -1px rgba(212, 190, 152, 0.2);
  background-color: rgba(212, 190, 152, 0.04);
  color: rgba(212, 190, 152, 0.5);
}
spinbutton:not(.vertical) progress,
entry progress {
  margin: 0 -8px -4px;
  border-bottom: 2px solid #${palette[4]};
  background-color: transparent;
}
.gedit-search-slider .linked:not(.vertical) > entry, spinbutton.vertical entry {
  border-radius: 6px;
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
  border-image: none;
  box-shadow: 0 2px 2px -2px rgba(0, 0, 0, 0.3), 0 1px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 2px -0.6px rgba(0, 0, 0, 0.17);
  background-color: #${palette[1]};
  color: #${palette[2]};
  caret-color: #${palette[4]};
}
.gedit-search-slider .linked:not(.vertical) > entry:focus, spinbutton.vertical entry:focus {
  border-image: none;
  box-shadow: 0 3px 2px -2px rgba(0, 0, 0, 0.2), 0 3px 2.4px 0 rgba(0, 0, 0, 0.14), 0 1px 4.8px 0 rgba(0, 0, 0, 0.12);
}
.gedit-search-slider .linked:not(.vertical) > entry:drop(active), spinbutton.vertical entry:drop(active) {
  box-shadow: 0 3px 2px -2px rgba(0, 0, 0, 0.2), 0 3px 2.4px 0 rgba(0, 0, 0, 0.14), 0 1px 4.8px 0 rgba(0, 0, 0, 0.12);
}
.gedit-search-slider .linked:not(.vertical) > entry:disabled, spinbutton.vertical entry:disabled {
  box-shadow: 0 2px 2px -2px rgba(0, 0, 0, 0.3), 0 1px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 2px -0.6px rgba(0, 0, 0, 0.17);
  background-color: #${palette[0]};
  color: rgba(212, 190, 152, 0.5);
}
.gedit-search-slider .linked:not(.vertical) > entry.error, spinbutton.vertical entry.error {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
  border-image: none;
  box-shadow: 0 2px 2px -2px rgba(0, 0, 0, 0.3), 0 1px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 2px -0.6px rgba(0, 0, 0, 0.17);
  background-color: #${palette[4]};
  color: #${palette[2]}
  caret-color: #${palette[2]}
}
.gedit-search-slider .linked:not(.vertical) > entry.error:focus, spinbutton.vertical entry.error:focus {
  border-image: none;
  box-shadow: 0 3px 2px -2px rgba(0, 0, 0, 0.2), 0 3px 2.4px 0 rgba(0, 0, 0, 0.14), 0 1px 4.8px 0 rgba(0, 0, 0, 0.12);
}
.gedit-search-slider .linked:not(.vertical) > entry.error:disabled, spinbutton.vertical entry.error:disabled {
  box-shadow: 0 2px 2px -2px rgba(0, 0, 0, 0.3), 0 1px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 2px -0.6px rgba(0, 0, 0, 0.17);
  background-color: #${palette[0]};
  color: rgba(212, 190, 152, 0.5);
}
.gedit-search-slider .linked:not(.vertical) > entry.error image, spinbutton.vertical entry.error image {
  color: rgba(255, 255, 255, 0.7);
}
.gedit-search-slider .linked:not(.vertical) > entry.error image:hover, spinbutton.vertical entry.error image:hover, .gedit-search-slider .linked:not(.vertical) > entry.error image:active, spinbutton.vertical entry.error image:active {
  color: #${palette[2]}
}
.gedit-search-slider .linked:not(.vertical) > entry.error image:disabled, spinbutton.vertical entry.error image:disabled {
  color: rgba(255, 255, 255, 0.5);
}
.gedit-search-slider .linked:not(.vertical) > entry.warning, spinbutton.vertical entry.warning {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
  border-image: none;
  box-shadow: 0 2px 2px -2px rgba(0, 0, 0, 0.3), 0 1px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 2px -0.6px rgba(0, 0, 0, 0.17);
  background-color: #${palette[5]};
  color: #${palette[0]};
  caret-color: #${palette[0]};
}
.gedit-search-slider .linked:not(.vertical) > entry.warning:focus, spinbutton.vertical entry.warning:focus {
  border-image: none;
  box-shadow: 0 3px 2px -2px rgba(0, 0, 0, 0.2), 0 3px 2.4px 0 rgba(0, 0, 0, 0.14), 0 1px 4.8px 0 rgba(0, 0, 0, 0.12);
}
.gedit-search-slider .linked:not(.vertical) > entry.warning:disabled, spinbutton.vertical entry.warning:disabled {
  box-shadow: 0 2px 2px -2px rgba(0, 0, 0, 0.3), 0 1px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 2px -0.6px rgba(0, 0, 0, 0.17);
  background-color: #${palette[0]};
  color: rgba(212, 190, 152, 0.5);
}
.gedit-search-slider .linked:not(.vertical) > entry.warning image, spinbutton.vertical entry.warning image {
  color: rgba(0, 0, 0, 0.7);
}
.gedit-search-slider .linked:not(.vertical) > entry.warning image:hover, spinbutton.vertical entry.warning image:hover, .gedit-search-slider .linked:not(.vertical) > entry.warning image:active, spinbutton.vertical entry.warning image:active {
  color: #${palette[0]};
}
.gedit-search-slider .linked:not(.vertical) > entry.warning image:disabled, spinbutton.vertical entry.warning image:disabled {
  color: rgba(0, 0, 0, 0.5);
}

treeview entry, treeview entry.flat {
  background-color: #${palette[0]};
}
treeview entry, treeview entry:focus, treeview entry.flat, treeview entry.flat:focus {
  border-image: none;
  box-shadow: none;
}

.entry-tag, .documents-entry-tag, .photos-entry-tag {
  margin: 2px;
  border-radius: 9999px;
  box-shadow: none;
  background-color: rgba(212, 190, 152, 0.08);
  color: #${palette[2]};
}
.entry-tag:hover, .documents-entry-tag:hover, .photos-entry-tag:hover {
  background-image: image(rgba(212, 190, 152, 0.08));
}
:dir(ltr) .entry-tag, :dir(ltr) .documents-entry-tag, :dir(ltr) .photos-entry-tag {
  margin-left: 4px;
  margin-right: 0;
  padding-left: 12px;
  padding-right: 8px;
}
:dir(rtl) .entry-tag, :dir(rtl) .documents-entry-tag, :dir(rtl) .photos-entry-tag {
  margin-left: 0;
  margin-right: 4px;
  padding-left: 8px;
  padding-right: 12px;
}
.entry-tag.button, .button.documents-entry-tag, .button.photos-entry-tag {
  box-shadow: none;
  background-color: transparent;
  color: rgba(212, 190, 152, 0.7);
}

/**
 * Buttons
 */
@keyframes needs-attention {
  from {
    background-image: -gtk-gradient(radial, center center, 0, center center, 0.001, to(#${palette[7]}), to(transparent));
  }
  to {
    background-image: -gtk-gradient(radial, center center, 0, center center, 0.5, to(#${palette[7]}), to(transparent));
  }
}
button {
  min-height: 24px;
  min-width: 16px;
  padding: 4px 8px;
  border-radius: 6px;
  color: #${palette[2]};
  font-weight: 500;
  box-shadow: 0 3px 2px -3px rgba(0, 0, 0, 0.3), 0 2px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 3px 0 rgba(0, 0, 0, 0.12);
  background-color: #${palette[1]};
}
button:drop(active),
button:hover {
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2), 0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12);
  background-color: #${palette[1]};
}
button:focus {
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2), 0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12);
  background-color: #${palette[1]};
}
button:active {
  box-shadow: 0 5px 3px -3px rgba(0, 0, 0, 0.2), 0 8px 6px 1px rgba(0, 0, 0, 0.14), 0 3px 8.4px 2px rgba(0, 0, 0, 0.12);
  background-image: radial-gradient(circle, rgba(212, 190, 152, 0.12) 10%, transparent 0%);
}
button:disabled {
  box-shadow: none;
  background-color: rgba(212, 190, 152, 0.08);
  color: rgba(212, 190, 152, 0.5);
}
button:checked {
  color: #${palette[7]};
  box-shadow: 0 3px 2px -3px rgba(0, 0, 0, 0.3), 0 2px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 3px 0 rgba(0, 0, 0, 0.12);
  background-color: #${palette[1]};
}
button:checked:drop(active),
button:checked:hover {
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2), 0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12);
  background-color: #${palette[1]};
}
button:checked:focus {
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2), 0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12);
  background-color: #${palette[1]};
}
button:checked:active {
  box-shadow: 0 5px 3px -3px rgba(0, 0, 0, 0.2), 0 8px 6px 1px rgba(0, 0, 0, 0.14), 0 3px 8.4px 2px rgba(0, 0, 0, 0.12);
  background-image: radial-gradient(circle, rgba(138, 180, 248, 0.16) 10%, transparent 0%);
}
button:checked:disabled {
  box-shadow: none;
  background-color: rgba(212, 190, 152, 0.1904);
  color: rgba(212, 190, 152, 0.5);
}
button.text-button {
  min-width: 32px;
  padding-left: 16px;
  padding-right: 16px;
}
button.image-button {
  min-width: 24px;
  padding: 4px;
  border-radius: 9999px;
}
button.text-button.image-button {
  min-width: 24px;
  padding: 4px;
  border-radius: 6px;
}
button.text-button.image-button label:first-child {
  margin-left: 12px;
}
button.text-button.image-button label:last-child {
  margin-right: 12px;
}
button.text-button.image-button image:not(:only-child) {
  margin: 0 4px;
}
.budgie-settings-window buttonbox.inline-toolbar button, #MatePanelPopupWindow button, #mate-menu button, .gedit-search-slider .linked:not(.vertical) > button, popover.messagepopover .popover-action-area button, button.sidebar-button, scrollbar button, combobox > .linked:not(.vertical) > button:not(:only-child), spinbutton.vertical button, spinbutton:not(.vertical) button, .nemo-window .toolbar button, .raven .raven-header.top stackswitcher.linked > button, .caja-navigation-window box.horizontal > button.toggle.image-button, #CanvasTable button, layouttabbar button, .message-input-area button, filechooser #pathbarbox > stack > box > button, #buttonbox_frame button, .drop-shadow button, .budgie-session-dialog .linked.horizontal > button, #caja-extra-view-widget button, .lock-dialog button, infobar.info > revealer > box button, infobar.question > revealer > box button, messagedialog .dialog-action-box button, .app-notification button, actionbar > revealer > box button:not(.suggested-action):not(.destructive-action), popover.background.menu button,
popover.background button.model, .titlebar button:not(.suggested-action):not(.destructive-action), toolbar button,
button.flat {
  color: #${palette[2]};
  box-shadow: none;
  background-color: transparent;
}
.budgie-settings-window buttonbox.inline-toolbar button:drop(active), #MatePanelPopupWindow button:drop(active), #mate-menu button:drop(active), .gedit-search-slider .linked:not(.vertical) > button:drop(active), popover.messagepopover .popover-action-area button:drop(active), button.sidebar-button:drop(active), scrollbar button:drop(active), combobox > .linked:not(.vertical) > button:drop(active):not(:only-child), spinbutton.vertical button:drop(active), spinbutton:not(.vertical) button:drop(active), .nemo-window .toolbar button:drop(active), .raven .raven-header.top stackswitcher.linked > button:drop(active), .caja-navigation-window box.horizontal > button.toggle.image-button:drop(active), #CanvasTable button:drop(active), layouttabbar button:drop(active), .message-input-area button:drop(active), filechooser #pathbarbox > stack > box > button:drop(active), #buttonbox_frame button:drop(active), .drop-shadow button:drop(active), .budgie-session-dialog .linked.horizontal > button:drop(active), #caja-extra-view-widget button:drop(active), .lock-dialog button:drop(active), infobar.info > revealer > box button:drop(active), infobar.question > revealer > box button:drop(active), messagedialog .dialog-action-box button:drop(active), .app-notification button:drop(active), actionbar > revealer > box button:drop(active):not(.suggested-action):not(.destructive-action), popover.background.menu button:drop(active),
popover.background button.model:drop(active), .titlebar button:drop(active):not(.suggested-action):not(.destructive-action), toolbar button:drop(active),
button.flat:drop(active), .budgie-settings-window buttonbox.inline-toolbar button:hover, #MatePanelPopupWindow button:hover, #mate-menu button:hover, .gedit-search-slider .linked:not(.vertical) > button:hover, popover.messagepopover .popover-action-area button:hover, button.sidebar-button:hover, scrollbar button:hover, combobox > .linked:not(.vertical) > button:hover:not(:only-child), spinbutton.vertical button:hover, spinbutton:not(.vertical) button:hover, .nemo-window .toolbar button:hover, .raven .raven-header.top stackswitcher.linked > button:hover, .caja-navigation-window box.horizontal > button.toggle.image-button:hover, #CanvasTable button:hover, layouttabbar button:hover, .message-input-area button:hover, filechooser #pathbarbox > stack > box > button:hover, #buttonbox_frame button:hover, .drop-shadow button:hover, .budgie-session-dialog .linked.horizontal > button:hover, #caja-extra-view-widget button:hover, .lock-dialog button:hover, infobar.info > revealer > box button:hover, infobar.question > revealer > box button:hover, messagedialog .dialog-action-box button:hover, .app-notification button:hover, actionbar > revealer > box button:hover:not(.suggested-action):not(.destructive-action), popover.background.menu button:hover,
popover.background button.model:hover, .titlebar button:hover:not(.suggested-action):not(.destructive-action), toolbar button:hover,
button.flat:hover {
  color: #${palette[2]};
  box-shadow: none;
  background-color: #${palette[1]};
}
.budgie-settings-window buttonbox.inline-toolbar button:focus, #MatePanelPopupWindow button:focus, #mate-menu button:focus, .gedit-search-slider .linked:not(.vertical) > button:focus, popover.messagepopover .popover-action-area button:focus, button.sidebar-button:focus, scrollbar button:focus, combobox > .linked:not(.vertical) > button:focus:not(:only-child), spinbutton.vertical button:focus, spinbutton:not(.vertical) button:focus, .nemo-window .toolbar button:focus, .raven .raven-header.top stackswitcher.linked > button:focus, .caja-navigation-window box.horizontal > button.toggle.image-button:focus, #CanvasTable button:focus, layouttabbar button:focus, .message-input-area button:focus, filechooser #pathbarbox > stack > box > button:focus, #buttonbox_frame button:focus, .drop-shadow button:focus, .budgie-session-dialog .linked.horizontal > button:focus, #caja-extra-view-widget button:focus, .lock-dialog button:focus, infobar.info > revealer > box button:focus, infobar.question > revealer > box button:focus, messagedialog .dialog-action-box button:focus, .app-notification button:focus, actionbar > revealer > box button:focus:not(.suggested-action):not(.destructive-action), popover.background.menu button:focus,
popover.background button.model:focus, .titlebar button:focus:not(.suggested-action):not(.destructive-action), toolbar button:focus,
button.flat:focus {
  box-shadow: none;
  background-color: #${palette[1]};
}
.budgie-settings-window buttonbox.inline-toolbar button:active, #MatePanelPopupWindow button:active, #mate-menu button:active, .gedit-search-slider .linked:not(.vertical) > button:active, popover.messagepopover .popover-action-area button:active, button.sidebar-button:active, scrollbar button:active, combobox > .linked:not(.vertical) > button:active:not(:only-child), spinbutton.vertical button:active, spinbutton:not(.vertical) button:active, .nemo-window .toolbar button:active, .raven .raven-header.top stackswitcher.linked > button:active, .caja-navigation-window box.horizontal > button.toggle.image-button:active, #CanvasTable button:active, layouttabbar button:active, .message-input-area button:active, filechooser #pathbarbox > stack > box > button:active, #buttonbox_frame button:active, .drop-shadow button:active, .budgie-session-dialog .linked.horizontal > button:active, #caja-extra-view-widget button:active, .lock-dialog button:active, infobar.info > revealer > box button:active, infobar.question > revealer > box button:active, messagedialog .dialog-action-box button:active, .app-notification button:active, actionbar > revealer > box button:active:not(.suggested-action):not(.destructive-action), popover.background.menu button:active,
popover.background button.model:active, .titlebar button:active:not(.suggested-action):not(.destructive-action), toolbar button:active,
button.flat:active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(212, 190, 152, 0.12) 10%, transparent 0%);
}
.budgie-settings-window buttonbox.inline-toolbar button:disabled, #MatePanelPopupWindow button:disabled, #mate-menu button:disabled, .gedit-search-slider .linked:not(.vertical) > button:disabled, popover.messagepopover .popover-action-area button:disabled, button.sidebar-button:disabled, scrollbar button:disabled, combobox > .linked:not(.vertical) > button:disabled:not(:only-child), spinbutton.vertical button:disabled, spinbutton:not(.vertical) button:disabled, .nemo-window .toolbar button:disabled, .raven .raven-header.top stackswitcher.linked > button:disabled, .caja-navigation-window box.horizontal > button.toggle.image-button:disabled, #CanvasTable button:disabled, layouttabbar button:disabled, .message-input-area button:disabled, filechooser #pathbarbox > stack > box > button:disabled, #buttonbox_frame button:disabled, .drop-shadow button:disabled, .budgie-session-dialog .linked.horizontal > button:disabled, #caja-extra-view-widget button:disabled, .lock-dialog button:disabled, infobar.info > revealer > box button:disabled, infobar.question > revealer > box button:disabled, messagedialog .dialog-action-box button:disabled, .app-notification button:disabled, actionbar > revealer > box button:disabled:not(.suggested-action):not(.destructive-action), popover.background.menu button:disabled,
popover.background button.model:disabled, .titlebar button:disabled:not(.suggested-action):not(.destructive-action), toolbar button:disabled,
button.flat:disabled {
  background-color: transparent;
  color: #${palette[2]};
}

.nemo-window .toolbar button:checked, .raven .raven-header.top stackswitcher.linked > button:checked, .caja-navigation-window box.horizontal > button.toggle.image-button:checked, #CanvasTable button:checked, layouttabbar button:checked, .message-input-area button:checked, filechooser #pathbarbox > stack > box > button:checked, #buttonbox_frame button:checked, .drop-shadow button:checked, .budgie-session-dialog .linked.horizontal > button:checked, #caja-extra-view-widget button:checked, .lock-dialog button:checked, infobar.info > revealer > box button:checked, infobar.question > revealer > box button:checked, messagedialog .dialog-action-box button:checked, .app-notification button:checked, actionbar > revealer > box button:checked:not(.suggested-action):not(.destructive-action), popover.background.menu button:checked,
popover.background button.model:checked, .titlebar button:checked:not(.suggested-action):not(.destructive-action), toolbar button:checked,
button.flat:checked {
  color: #${palette[7]};
  box-shadow: none;
  background-color: #${palette[1]};
}
.nemo-window .toolbar button:checked:drop(active), .raven .raven-header.top stackswitcher.linked > button:checked:drop(active), .caja-navigation-window box.horizontal > button.toggle.image-button:checked:drop(active), #CanvasTable button:checked:drop(active), layouttabbar button:checked:drop(active), .message-input-area button:checked:drop(active), filechooser #pathbarbox > stack > box > button:checked:drop(active), #buttonbox_frame button:checked:drop(active), .drop-shadow button:checked:drop(active), .budgie-session-dialog .linked.horizontal > button:checked:drop(active), #caja-extra-view-widget button:checked:drop(active), .lock-dialog button:checked:drop(active), infobar.info > revealer > box button:checked:drop(active), infobar.question > revealer > box button:checked:drop(active), messagedialog .dialog-action-box button:checked:drop(active), .app-notification button:checked:drop(active), actionbar > revealer > box button:checked:drop(active):not(.suggested-action):not(.destructive-action), popover.background.menu button:checked:drop(active),
popover.background button.model:checked:drop(active), .titlebar button:checked:drop(active):not(.suggested-action):not(.destructive-action), toolbar button:checked:drop(active),
button.flat:checked:drop(active), .nemo-window .toolbar button:checked:hover, .raven .raven-header.top stackswitcher.linked > button:checked:hover, .caja-navigation-window box.horizontal > button.toggle.image-button:checked:hover, #CanvasTable button:checked:hover, layouttabbar button:checked:hover, .message-input-area button:checked:hover, filechooser #pathbarbox > stack > box > button:checked:hover, #buttonbox_frame button:checked:hover, .drop-shadow button:checked:hover, .budgie-session-dialog .linked.horizontal > button:checked:hover, #caja-extra-view-widget button:checked:hover, .lock-dialog button:checked:hover, infobar.info > revealer > box button:checked:hover, infobar.question > revealer > box button:checked:hover, messagedialog .dialog-action-box button:checked:hover, .app-notification button:checked:hover, actionbar > revealer > box button:checked:hover:not(.suggested-action):not(.destructive-action), popover.background.menu button:checked:hover,
popover.background button.model:checked:hover, .titlebar button:checked:hover:not(.suggested-action):not(.destructive-action), toolbar button:checked:hover,
button.flat:checked:hover {
  box-shadow: none;
  background-color: #${palette[1]};
}
.nemo-window .toolbar button:checked:focus, .raven .raven-header.top stackswitcher.linked > button:checked:focus, .caja-navigation-window box.horizontal > button.toggle.image-button:checked:focus, #CanvasTable button:checked:focus, layouttabbar button:checked:focus, .message-input-area button:checked:focus, filechooser #pathbarbox > stack > box > button:checked:focus, #buttonbox_frame button:checked:focus, .drop-shadow button:checked:focus, .budgie-session-dialog .linked.horizontal > button:checked:focus, #caja-extra-view-widget button:checked:focus, .lock-dialog button:checked:focus, infobar.info > revealer > box button:checked:focus, infobar.question > revealer > box button:checked:focus, messagedialog .dialog-action-box button:checked:focus, .app-notification button:checked:focus, actionbar > revealer > box button:checked:focus:not(.suggested-action):not(.destructive-action), popover.background.menu button:checked:focus,
popover.background button.model:checked:focus, .titlebar button:checked:focus:not(.suggested-action):not(.destructive-action), toolbar button:checked:focus,
button.flat:checked:focus {
  box-shadow: none;
  background-color: #${palette[1]};
}
.nemo-window .toolbar button:checked:active, .raven .raven-header.top stackswitcher.linked > button:checked:active, .caja-navigation-window box.horizontal > button.toggle.image-button:checked:active, #CanvasTable button:checked:active, layouttabbar button:checked:active, .message-input-area button:checked:active, filechooser #pathbarbox > stack > box > button:checked:active, #buttonbox_frame button:checked:active, .drop-shadow button:checked:active, .budgie-session-dialog .linked.horizontal > button:checked:active, #caja-extra-view-widget button:checked:active, .lock-dialog button:checked:active, infobar.info > revealer > box button:checked:active, infobar.question > revealer > box button:checked:active, messagedialog .dialog-action-box button:checked:active, .app-notification button:checked:active, actionbar > revealer > box button:checked:active:not(.suggested-action):not(.destructive-action), popover.background.menu button:checked:active,
popover.background button.model:checked:active, .titlebar button:checked:active:not(.suggested-action):not(.destructive-action), toolbar button:checked:active,
button.flat:checked:active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(138, 180, 248, 0.16) 10%, transparent 0%);
}
.nemo-window .toolbar button:checked:disabled, .raven .raven-header.top stackswitcher.linked > button:checked:disabled, .caja-navigation-window box.horizontal > button.toggle.image-button:checked:disabled, #CanvasTable button:checked:disabled, layouttabbar button:checked:disabled, .message-input-area button:checked:disabled, filechooser #pathbarbox > stack > box > button:checked:disabled, #buttonbox_frame button:checked:disabled, .drop-shadow button:checked:disabled, .budgie-session-dialog .linked.horizontal > button:checked:disabled, #caja-extra-view-widget button:checked:disabled, .lock-dialog button:checked:disabled, infobar.info > revealer > box button:checked:disabled, infobar.question > revealer > box button:checked:disabled, messagedialog .dialog-action-box button:checked:disabled, .app-notification button:checked:disabled, actionbar > revealer > box button:checked:disabled:not(.suggested-action):not(.destructive-action), popover.background.menu button:checked:disabled,
popover.background button.model:checked:disabled, .titlebar button:checked:disabled:not(.suggested-action):not(.destructive-action), toolbar button:checked:disabled,
button.flat:checked:disabled {
  color: #${palette[2]};
}

#buttonbox_frame button.text-button, .drop-shadow button.text-button, .budgie-session-dialog .linked.horizontal > button.text-button, #caja-extra-view-widget button.text-button, .lock-dialog button.text-button, infobar.info > revealer > box button.text-button, infobar.question > revealer > box button.text-button, messagedialog .dialog-action-box button.text-button, .app-notification button.text-button, actionbar > revealer > box button.text-button:not(.suggested-action):not(.destructive-action), popover.background.menu button.text-button,
popover.background button.text-button.model, .titlebar button.text-button:not(.suggested-action):not(.destructive-action), toolbar button.text-button,
button.flat.text-button {
  min-width: 48px;
  padding-left: 8px;
  padding-right: 8px;
}
#buttonbox_frame button.text-button.image-button, .drop-shadow button.text-button.image-button, .budgie-session-dialog .linked.horizontal > button.text-button.image-button, #caja-extra-view-widget button.text-button.image-button, .lock-dialog button.text-button.image-button, infobar.info > revealer > box button.text-button.image-button, infobar.question > revealer > box button.text-button.image-button, messagedialog .dialog-action-box button.text-button.image-button, .app-notification button.text-button.image-button, actionbar > revealer > box button.text-button.image-button:not(.suggested-action):not(.destructive-action), popover.background.menu button.text-button.image-button,
popover.background button.text-button.image-button.model, .titlebar button.text-button.image-button:not(.suggested-action):not(.destructive-action), toolbar button.text-button.image-button,
button.flat.text-button.image-button {
  min-width: 24px;
  padding: 4px;
}
#buttonbox_frame button.text-button.image-button label:first-child, .drop-shadow button.text-button.image-button label:first-child, .budgie-session-dialog .linked.horizontal > button.text-button.image-button label:first-child, #caja-extra-view-widget button.text-button.image-button label:first-child, .lock-dialog button.text-button.image-button label:first-child, infobar.info > revealer > box button.text-button.image-button label:first-child, infobar.question > revealer > box button.text-button.image-button label:first-child, messagedialog .dialog-action-box button.text-button.image-button label:first-child, .app-notification button.text-button.image-button label:first-child, actionbar > revealer > box button.text-button.image-button:not(.suggested-action):not(.destructive-action) label:first-child, popover.background.menu button.text-button.image-button label:first-child,
popover.background button.text-button.image-button.model label:first-child, .titlebar button.text-button.image-button:not(.suggested-action):not(.destructive-action) label:first-child, toolbar button.text-button.image-button label:first-child,
button.flat.text-button.image-button label:first-child {
  margin-left: 8px;
}
#buttonbox_frame button.text-button.image-button label:last-child, .drop-shadow button.text-button.image-button label:last-child, .budgie-session-dialog .linked.horizontal > button.text-button.image-button label:last-child, #caja-extra-view-widget button.text-button.image-button label:last-child, .lock-dialog button.text-button.image-button label:last-child, infobar.info > revealer > box button.text-button.image-button label:last-child, infobar.question > revealer > box button.text-button.image-button label:last-child, messagedialog .dialog-action-box button.text-button.image-button label:last-child, .app-notification button.text-button.image-button label:last-child, actionbar > revealer > box button.text-button.image-button:not(.suggested-action):not(.destructive-action) label:last-child, popover.background.menu button.text-button.image-button label:last-child,
popover.background button.text-button.image-button.model label:last-child, .titlebar button.text-button.image-button:not(.suggested-action):not(.destructive-action) label:last-child, toolbar button.text-button.image-button label:last-child,
button.flat.text-button.image-button label:last-child {
  margin-right: 8px;
}
#buttonbox_frame .linked:not(.vertical) > button:not(:only-child), .drop-shadow .linked:not(.vertical) > button:not(:only-child), .budgie-session-dialog .linked.horizontal:not(.vertical) > button:not(:only-child), #caja-extra-view-widget .linked:not(.vertical) > button:not(:only-child), .lock-dialog .linked:not(.vertical) > button:not(:only-child), infobar.info > revealer > box .linked:not(.vertical) > button:not(:only-child), infobar.question > revealer > box .linked:not(.vertical) > button:not(:only-child), messagedialog .dialog-action-box .linked:not(.vertical) > button:not(:only-child), .app-notification .linked:not(.vertical) > button:not(:only-child), actionbar > revealer > box .linked:not(.vertical) > button:not(:only-child):not(.suggested-action):not(.destructive-action), popover.background.menu .linked:not(.vertical) > button:not(:only-child),
popover.background .linked:not(.vertical) > button.model:not(:only-child), .titlebar .linked:not(.vertical) > button:not(:only-child):not(.suggested-action):not(.destructive-action), toolbar .linked:not(.vertical) > button:not(:only-child), #buttonbox_frame .linked.vertical > button:not(:only-child), .drop-shadow .linked.vertical > button:not(:only-child), .budgie-session-dialog .linked.horizontal.vertical > button:not(:only-child), #caja-extra-view-widget .linked.vertical > button:not(:only-child), .lock-dialog .linked.vertical > button:not(:only-child), infobar.info > revealer > box .linked.vertical > button:not(:only-child), infobar.question > revealer > box .linked.vertical > button:not(:only-child), messagedialog .dialog-action-box .linked.vertical > button:not(:only-child), .app-notification .linked.vertical > button:not(:only-child), actionbar > revealer > box .linked.vertical > button:not(:only-child):not(.suggested-action):not(.destructive-action), popover.background.menu .linked.vertical > button:not(:only-child),
popover.background .linked.vertical > button.model:not(:only-child), .titlebar .linked.vertical > button:not(:only-child):not(.suggested-action):not(.destructive-action), toolbar .linked.vertical > button:not(:only-child),
.linked:not(.vertical) > button.flat:not(:only-child),
.linked.vertical > button.flat:not(:only-child) {
  border-radius: 6px;
}
#buttonbox_frame .linked:not(.vertical) > button:not(:only-child).image-button:not(.text-button), .drop-shadow .linked:not(.vertical) > button:not(:only-child).image-button:not(.text-button), .budgie-session-dialog .linked.horizontal:not(.vertical) > button:not(:only-child).image-button:not(.text-button), #caja-extra-view-widget .linked:not(.vertical) > button:not(:only-child).image-button:not(.text-button), .lock-dialog .linked:not(.vertical) > button:not(:only-child).image-button:not(.text-button), infobar.info > revealer > box .linked:not(.vertical) > button:not(:only-child).image-button:not(.text-button), infobar.question > revealer > box .linked:not(.vertical) > button:not(:only-child).image-button:not(.text-button), messagedialog .dialog-action-box .linked:not(.vertical) > button:not(:only-child).image-button:not(.text-button), .app-notification .linked:not(.vertical) > button:not(:only-child).image-button:not(.text-button), actionbar > revealer > box .linked:not(.vertical) > button:not(:only-child).image-button:not(.text-button):not(.suggested-action):not(.destructive-action), popover.background.menu .linked:not(.vertical) > button:not(:only-child).image-button:not(.text-button),
popover.background .linked:not(.vertical) > button.model:not(:only-child).image-button:not(.text-button), .titlebar .linked:not(.vertical) > button:not(:only-child).image-button:not(.text-button):not(.suggested-action):not(.destructive-action), toolbar .linked:not(.vertical) > button:not(:only-child).image-button:not(.text-button), #buttonbox_frame .linked.vertical > button:not(:only-child).image-button:not(.text-button), .drop-shadow .linked.vertical > button:not(:only-child).image-button:not(.text-button), .budgie-session-dialog .linked.horizontal.vertical > button:not(:only-child).image-button:not(.text-button), #caja-extra-view-widget .linked.vertical > button:not(:only-child).image-button:not(.text-button), .lock-dialog .linked.vertical > button:not(:only-child).image-button:not(.text-button), infobar.info > revealer > box .linked.vertical > button:not(:only-child).image-button:not(.text-button), infobar.question > revealer > box .linked.vertical > button:not(:only-child).image-button:not(.text-button), messagedialog .dialog-action-box .linked.vertical > button:not(:only-child).image-button:not(.text-button), .app-notification .linked.vertical > button:not(:only-child).image-button:not(.text-button), actionbar > revealer > box .linked.vertical > button:not(:only-child).image-button:not(.text-button):not(.suggested-action):not(.destructive-action), popover.background.menu .linked.vertical > button:not(:only-child).image-button:not(.text-button),
popover.background .linked.vertical > button.model:not(:only-child).image-button:not(.text-button), .titlebar .linked.vertical > button:not(:only-child).image-button:not(.text-button):not(.suggested-action):not(.destructive-action), toolbar .linked.vertical > button:not(:only-child).image-button:not(.text-button),
.linked:not(.vertical > button.flat:not(:only-child).image-button:not(.text-button),
.linked.vertical > button.flat:not(:only-child).image-button:not(.text-button) {
  border-radius: 9999px;
}

button.osd {
  padding: 8px 12px;
}
button.osd.image-button {
  padding: 8px;
}
button.osd:disabled {
  opacity: 0;
}
button.suggested-action {
  color: #${palette[0]};
  box-shadow: 0 3px 2px -3px rgba(0, 0, 0, 0.3), 0 2px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 3px 0 rgba(0, 0, 0, 0.12);
  background-color: #${palette[7]};
}
button.suggested-action:drop(active), button.suggested-action:hover {
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2), 0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12);
  background-color: #${palette[7]};
}
button.suggested-action:focus {
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2), 0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12);
  background-color: #${palette[7]};
}
button.suggested-action:active {
  box-shadow: 0 5px 3px -3px rgba(0, 0, 0, 0.2), 0 8px 6px 1px rgba(0, 0, 0, 0.14), 0 3px 8.4px 2px rgba(0, 0, 0, 0.12);
  background-image: radial-gradient(circle, rgba(0, 0, 0, 0.12) 10%, transparent 0%);
}
button.suggested-action:disabled {
  box-shadow: none;
  background-color: rgba(212, 190, 152, 0.08);
  color: rgba(212, 190, 152, 0.5);
}
button.suggested-action:checked {
  box-shadow: 0 3px 2px -3px rgba(0, 0, 0, 0.3), 0 2px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 3px 0 rgba(0, 0, 0, 0.12);
  background-color: #${palette[7]};
}
button.suggested-action:checked:drop(active), button.suggested-action:checked:hover {
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2), 0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12);
  background-color: #${palette[7]};
}
button.suggested-action:checked:focus {
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2), 0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12);
  background-color: #${palette[7]};
}
button.suggested-action:checked:active {
  box-shadow: 0 5px 3px -3px rgba(0, 0, 0, 0.2), 0 8px 6px 1px rgba(0, 0, 0, 0.14), 0 3px 8.4px 2px rgba(0, 0, 0, 0.12);
  background-image: radial-gradient(circle, rgba(0, 0, 0, 0.12) 10%, transparent 0%);
}
button.suggested-action.flat {
  color: #${palette[7]};
  box-shadow: none;
  background-color: transparent;
}
button.suggested-action.flat:drop(active), button.suggested-action.flat:hover {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.12);
}
button.suggested-action.flat:focus {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.12);
}
button.suggested-action.flat:active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(138, 180, 248, 0.16) 10%, transparent 0%);
}
button.suggested-action.flat:disabled {
  box-shadow: none;
  background-color: transparent;
  color: rgba(212, 190, 152, 0.3);
}
button.suggested-action.flat:checked {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.16);
}
button.suggested-action.flat:checked:drop(active), button.suggested-action.flat:checked:hover {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.2608);
}
button.suggested-action.flat:checked:focus {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.2608);
}
button.suggested-action.flat:checked:active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(138, 180, 248, 0.16) 10%, transparent 0%);
}
button.destructive-action {
  color: #${palette[2]}
  box-shadow: 0 3px 2px -3px rgba(0, 0, 0, 0.3), 0 2px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 3px 0 rgba(0, 0, 0, 0.12);
  background-color: #${palette[4]};
}
button.destructive-action:drop(active), button.destructive-action:hover {
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2), 0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12);
  background-color: #${palette[4]};
}
button.destructive-action:focus {
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2), 0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12);
  background-color: #${palette[4]};
}
button.destructive-action:active {
  box-shadow: 0 5px 3px -3px rgba(0, 0, 0, 0.2), 0 8px 6px 1px rgba(0, 0, 0, 0.14), 0 3px 8.4px 2px rgba(0, 0, 0, 0.12);
  background-image: radial-gradient(circle, rgba(255, 255, 255, 0.12) 10%, transparent 0%);
}
button.destructive-action:disabled {
  box-shadow: none;
  background-color: rgba(212, 190, 152, 0.08);
  color: rgba(212, 190, 152, 0.5);
}
button.destructive-action:checked {
  box-shadow: 0 3px 2px -3px rgba(0, 0, 0, 0.3), 0 2px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 3px 0 rgba(0, 0, 0, 0.12);
  background-color: #${palette[4]};
}
button.destructive-action:checked:drop(active), button.destructive-action:checked:hover {
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2), 0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12);
  background-color: #${palette[4]};
}
button.destructive-action:checked:focus {
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2), 0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12);
  background-color: #${palette[4]};
}
button.destructive-action:checked:active {
  box-shadow: 0 5px 3px -3px rgba(0, 0, 0, 0.2), 0 8px 6px 1px rgba(0, 0, 0, 0.14), 0 3px 8.4px 2px rgba(0, 0, 0, 0.12);
  background-image: radial-gradient(circle, rgba(255, 255, 255, 0.12) 10%, transparent 0%);
}
button.destructive-action.flat {
  color: #${palette[4]};
  box-shadow: none;
  background-color: transparent;
}
button.destructive-action.flat:drop(active), button.destructive-action.flat:hover {
  box-shadow: none;
  background-color: rgba(255, 15, 15, 0.12);
}
button.destructive-action.flat:focus {
  box-shadow: none;
  background-color: rgba(255, 15, 15, 0.12);
}
button.destructive-action.flat:active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(255, 15, 15, 0.16) 10%, transparent 0%);
}
button.destructive-action.flat:disabled {
  box-shadow: none;
  background-color: transparent;
  color: rgba(212, 190, 152, 0.3);
}
button.destructive-action.flat:checked {
  box-shadow: none;
  background-color: rgba(255, 15, 15, 0.16);
}
button.destructive-action.flat:checked:drop(active), button.destructive-action.flat:checked:hover {
  box-shadow: none;
  background-color: rgba(255, 15, 15, 0.2608);
}
button.destructive-action.flat:checked:focus {
  box-shadow: none;
  background-color: rgba(255, 15, 15, 0.2608);
}
button.destructive-action.flat:checked:active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(255, 15, 15, 0.16) 10%, transparent 0%);
}
.stack-switcher > button > label {
  margin: 0 -6px;
  padding: 0 6px;
}
.stack-switcher > button > image {
  margin: -3px -6px;
  padding: 3px 6px;
}
.stack-switcher > button.needs-attention:checked > label,
.stack-switcher > button.needs-attention:checked > image {
  animation: none;
  background-image: none;
}
.inline-toolbar button:not(.text-button) {
  border-radius: 9999px;
}
.primary-toolbar button {
  -gtk-icon-shadow: none;
}
button.close, button.circular {
  border-radius: 9999px;
}
.pluma-window paned.horizontal box.vertical box.horizontal button.flat, .nautilus-window .floating-bar button, .gedit-document-panel row button.flat, .gedit-search-slider .linked:not(.vertical) > button, button.sidebar-button, notebook > header > tabs > tab button.flat, spinbutton:not(.vertical) button {
  min-height: 24px;
  min-width: 24px;
  padding: 0;
  border-radius: 9999px;
}

stacksidebar.sidebar row.needs-attention > label, .stack-switcher > button.needs-attention > label,
.stack-switcher > button.needs-attention > image {
  animation: needs-attention 225ms cubic-bezier(0, 0, 0.2, 1) forwards;
  background-repeat: no-repeat;
  background-position: right 3px;
  background-size: 6px 6px;
}
stacksidebar.sidebar row.needs-attention > label:dir(rtl), .stack-switcher > button.needs-attention > label:dir(rtl),
.stack-switcher > button.needs-attention > image:dir(rtl) {
  background-position: left 3px;
}

.linked:not(.vertical) > combobox:not(:first-child) > box > button.combo, .linked:not(.vertical) > spinbutton:not(:first-child):not(.vertical),
.linked:not(.vertical) > entry:not(:first-child),
.linked:not(.vertical) > button:not(:first-child) {
  border-top-left-radius: 0;
  border-bottom-left-radius: 0;
}

.linked:not(.vertical) > combobox:not(:last-child) > box > button.combo, .linked:not(.vertical) > spinbutton:not(:last-child):not(.vertical),
.linked:not(.vertical) > entry:not(:last-child),
.linked:not(.vertical) > button:not(:last-child) {
  border-top-right-radius: 0;
  border-bottom-right-radius: 0;
}

.linked.vertical > combobox:not(:first-child) > box > button.combo, .linked.vertical > spinbutton:not(:first-child):not(.vertical),
.linked.vertical > entry:not(:first-child),
.linked.vertical > button:not(:first-child) {
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}

.linked.vertical > combobox:not(:last-child) > box > button.combo, .linked.vertical > spinbutton:not(:last-child):not(.vertical),
.linked.vertical > entry:not(:last-child),
.linked.vertical > button:not(:last-child) {
  border-bottom-left-radius: 0;
  border-bottom-right-radius: 0;
}

.linked:not(.vertical) > button.image-button:first-child:not(.text-button) {
  border-top-left-radius: 6px;
  border-bottom-left-radius: 6px;
}
.linked:not(.vertical) > button.image-button:last-child:not(.text-button) {
  border-top-right-radius: 6px;
  border-bottom-right-radius: 6px;
}
.linked:not(.vertical) > button.image-button:only-child:not(.text-button) {
  border-radius: 9999px;
}

.linked.vertical > button.image-button:first-child:not(.text-button) {
  border-top-left-radius: 6px;
  border-top-right-radius: 6px;
}
.linked.vertical > button.image-button:last-child:not(.text-button) {
  border-bottom-left-radius: 6px;
  border-bottom-right-radius: 6px;
}
.linked.vertical > button.image-button:only-child:not(.text-button) {
  border-radius: 9999px;
}

/* menu buttons */
modelbutton.flat,
.menuitem.button.flat {
  min-height: 28px;
  padding: 0 8px;
  border-radius: 6px;
}
modelbutton.flat:drop(active), modelbutton.flat:hover,
.menuitem.button.flat:drop(active),
.menuitem.button.flat:hover {
  background-color: rgba(212, 190, 152, 0.08);
}
modelbutton.flat:focus,
.menuitem.button.flat:focus {
  background-color: rgba(212, 190, 152, 0.08);
}
modelbutton.flat:active,
.menuitem.button.flat:active {
  background-image: radial-gradient(circle, rgba(212, 190, 152, 0.12) 10%, transparent 0%);
}
modelbutton.flat:selected,
.menuitem.button.flat:selected {
  background-color: rgba(138, 180, 248, 0.6);
}

modelbutton.flat arrow {
  transition: color 75ms cubic-bezier(0, 0, 0.2, 1);
  color: rgba(212, 190, 152, 0.7);
}
modelbutton.flat arrow:disabled {
  color: rgba(212, 190, 152, 0.3);
}
modelbutton.flat arrow.left {
  -gtk-icon-source: -gtk-icontheme("pan-start-symbolic");
}
modelbutton.flat arrow.right {
  -gtk-icon-source: -gtk-icontheme("pan-end-symbolic");
}

button.color {
  min-height: 24px;
  min-width: 24px;
  padding: 4px;
}
/**
 * Links
 */
*:link {
  color: #${palette[7]};
}
*:link:disabled {
  color: rgba(212, 190, 152, 0.5);
}

*:visited {
  color: #${palette[8]};
}
*:visited:disabled {
  color: rgba(212, 190, 152, 0.5);
}

button.link:link {
  color: #${palette[7]};
  box-shadow: none;
  background-color: transparent;
}
button.link:link:drop(active), button.link:link:hover {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.12);
}
button.link:link:focus {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.12);
}
button.link:link:active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(138, 180, 248, 0.16) 10%, transparent 0%);
}
button.link:visited {
  color: #${palette[8]};
  box-shadow: none;
  background-color: transparent;
}
button.link:visited:drop(active), button.link:visited:hover {
  box-shadow: none;
  background-color: rgba(220, 15, 220, 0.12);
}
button.link:visited:focus {
  box-shadow: none;
  background-color: rgba(220, 15, 220, 0.12);
}
button.link:visited:active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(220, 15, 220, 0.16) 10%, transparent 0%);
}
button.link:disabled {
  color: rgba(212, 190, 152, 0.5);
}
button.link > label {
  text-decoration-line: underline;
}

/**
 * GtkSpinButton
 */
spinbutton:not(.vertical) {
  padding: 0;
}
spinbutton:not(.vertical) entry {
  min-width: 24px;
  margin: 0;
  border-image: none;
  border-radius: 0;
  box-shadow: none;
  background-color: transparent;
}
spinbutton:not(.vertical) button {
  border: solid 4px transparent;
  background-clip: padding-box;
}
spinbutton:not(.vertical) button:focus:not(:hover):not(:active) {
  background-color: transparent;
}
spinbutton:not(.vertical) button.up:dir(ltr), spinbutton:not(.vertical) button.down:dir(rtl) {
  margin-left: -2px;
}
spinbutton:not(.vertical) button.up:dir(rtl), spinbutton:not(.vertical) button.down:dir(ltr) {
  margin-right: -2px;
}
spinbutton.vertical {
  caret-color: #${palette[7]};
}
spinbutton.vertical:disabled {
  color: rgba(212, 190, 152, 0.5);
}
spinbutton.vertical entry {
  min-height: 32px;
  min-width: 40px;
  padding: 0;
}
spinbutton.vertical button {
  min-height: 32px;
  min-width: 40px;
  padding: 0;
}
spinbutton.vertical button:focus:not(:hover):not(:active) {
  background-color: transparent;
}
spinbutton.vertical button.up {
  border-radius: 6px 6px 0 0;
}
spinbutton.vertical button.down {
  border-radius: 0 0 6px 6px;
}
treeview spinbutton:not(.vertical) {
  min-height: 0;
  border-style: none;
  border-radius: 0;
}
treeview spinbutton:not(.vertical) entry {
  min-height: 0;
  padding: 1px 2px;
}

/**
 * ComboBoxes
 */
combobox arrow {
  transition: -gtk-icon-transform 75ms cubic-bezier(0, 0, 0.2, 1);
  -gtk-icon-source: -gtk-icontheme("pan-down-symbolic");
  min-height: 16px;
  min-width: 16px;
}
combobox button.combo:checked arrow {
  -gtk-icon-transform: rotate(-0.5turn);
}
combobox decoration {
  transition: none;
}
combobox cellview {
  margin: -2px;
}
combobox button.combo cellview:dir(ltr) {
  margin-left: -2px;
}
combobox button.combo cellview:dir(rtl) {
  margin-right: -2px;
}
combobox menu {
  padding: 2px 0;
}
combobox menu menuitem {
  min-height: 28px;
  padding: 0 8px;
}
combobox menu > arrow.top {
  margin-top: -2px;
}
combobox menu > arrow.bottom {
  margin-top: 4px;
  margin-bottom: -6px;
}
combobox > .linked:not(.vertical) > entry:not(:only-child) {
  border-radius: 6px 6px 0 0;
}
combobox > .linked:not(.vertical) > entry:not(:only-child):first-child {
  margin-right: -32px;
  padding-right: 32px;
}
combobox > .linked:not(.vertical) > entry:not(:only-child):last-child {
  margin-left: -32px;
  padding-left: 32px;
}
combobox > .linked:not(.vertical) > button:not(:only-child) {
  min-height: 16px;
  min-width: 16px;
  margin: 4px;
  padding: 4px;
  border-radius: 9999px;
}

button.combo:only-child {
  border-radius: 6px 6px 0 0;
  font-weight: normal;
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1), border-image 225ms cubic-bezier(0, 0, 0.2, 1);
  border-image: radial-gradient(circle closest-corner at center calc(100% - 1px), #${palette[7]} 0%, transparent 0%) 2/0 0 0;
  box-shadow: inset 0 -1px rgba(212, 190, 152, 0.3);
  background-color: rgba(212, 190, 152, 0.04);
  color: #${palette[2]};
  caret-color: #${palette[7]};
}
button.combo:only-child:focus {
  box-shadow: inset 0 -1px rgba(212, 190, 152, 0.3);
  background-color: rgba(212, 190, 152, 0.1168);
}
button.combo:only-child:drop(active), button.combo:only-child:hover {
  box-shadow: inset 0 -1px rgba(212, 190, 152, 0.3);
  background-color: rgba(212, 190, 152, 0.0784);
}
button.combo:only-child:checked {
  border-image: radial-gradient(circle closest-corner at center calc(100% - 1px), #${palette[7]} 100%, transparent 0%) 2/0 0 2px;
  box-shadow: inset 0 -1px rgba(212, 190, 152, 0.3);
  background-color: rgba(212, 190, 152, 0.1168);
}
button.combo:only-child:disabled {
  box-shadow: inset 0 -1px rgba(212, 190, 152, 0.2);
  background-color: rgba(212, 190, 152, 0.04);
  color: rgba(212, 190, 152, 0.5);
}
button.combo:only-child arrow {
  transition: color 75ms cubic-bezier(0, 0, 0.2, 1);
  color: rgba(212, 190, 152, 0.7);
}
button.combo:only-child arrow:disabled {
  color: rgba(212, 190, 152, 0.3);
}

/**
 * Toolbars
 */
toolbar {
  -GtkWidget-window-dragging: true;
  padding: 2px;
}
toolbar.osd.left, toolbar.osd.right, toolbar.osd.top, toolbar.osd.bottom {
  border-radius: 0;
}
toolbar.osd.bottom {
  box-shadow: none;
  background-color: transparent;
  background-image: linear-gradient(to bottom, transparent, rgba(0, 0, 0, 0.1) 30%, rgba(0, 0, 0, 0.2) 50%, rgba(0, 0, 0, 0.4));
}
toolbar.horizontal > separator {
  margin: 2px;
}
toolbar.vertical > separator {
  margin: 2px;
}
toolbar:not(.inline-toolbar):not(.osd) scale,
toolbar:not(.inline-toolbar):not(.osd) entry,
toolbar:not(.inline-toolbar):not(.osd) spinbutton,
toolbar:not(.inline-toolbar):not(.osd) button {
  margin: 2px;
}
toolbar:not(.inline-toolbar):not(.osd) .linked entry:not(:first-child),
toolbar:not(.inline-toolbar):not(.osd) .linked spinbutton:not(:first-child),
toolbar:not(.inline-toolbar):not(.osd) .linked button:not(:first-child) {
  margin-left: 0;
}
toolbar:not(.inline-toolbar):not(.osd) .linked entry:not(:last-child),
toolbar:not(.inline-toolbar):not(.osd) .linked spinbutton:not(:last-child),
toolbar:not(.inline-toolbar):not(.osd) .linked button:not(:last-child) {
  margin-right: 0;
}
toolbar:not(.inline-toolbar):not(.osd) spinbutton entry,
toolbar:not(.inline-toolbar):not(.osd) spinbutton button {
  margin: 0;
}
toolbar:not(.inline-toolbar):not(.osd) switch {
  margin: 6px 2px;
}

frame.documents-dropdown, .app-notification, toolbar.osd {
  transition: box-shadow 75ms cubic-bezier(0, 0, 0.2, 1);
  padding: 4px;
  border-radius: 6px;
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2), 0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12), inset 0 1px rgba(255, 255, 255, 0.05);
  background-color: #${palette[1]};
}
frame.documents-dropdown:backdrop, .app-notification:backdrop, toolbar.osd:backdrop {
  box-shadow: 0 3px 2px -3px rgba(0, 0, 0, 0.3), 0 2px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 3px 0 rgba(0, 0, 0, 0.12), inset 0 1px rgba(255, 255, 255, 0.05);
}

.inline-toolbar {
  padding: 4px;
  border-style: solid;
  border-width: 0 1px 1px;
  border-color: rgba(212, 190, 152, 0.2);
  background-color: #${palette[0]};
  background-clip: padding-box;
}

searchbar > revealer > box,
.location-bar {
  padding: 4px;
  border-style: solid;
  border-width: 0 0 1px;
  border-color: rgba(212, 190, 152, 0.2);
}

searchbar > revealer > box {
  margin: -6px;
  padding: 4px;
}

/**
 * Header bars
 */
.titlebar {
  transition: background-color 75ms cubic-bezier(0, 0, 0.2, 1), color 75ms cubic-bezier(0, 0, 0.2, 1);
  border-radius: 6px 6px 0 0;
  box-shadow: 0 2px 2px -2px rgba(0, 0, 0, 0.3), 0 1px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 2px -0.6px rgba(0, 0, 0, 0.17), inset 0 1px rgba(255, 255, 255, 0.05);
  background-color: #${palette[1]};
  color: #${palette[2]};
}
.titlebar:disabled {
  color: #${palette[2]};
}
.titlebar:backdrop {
  background-color: #${palette[0]};
  color: #${palette[2]};
}
.titlebar:backdrop:disabled {
  color: #${palette[1]};
}
.titlebar .title {
  padding-left: 12px;
  padding-right: 12px;
  font-weight: bold;
}
.titlebar .subtitle {
  padding-left: 12px;
  padding-right: 12px;
  font-size: smaller;
}
.titlebar .subtitle,
.titlebar .dim-label {
  transition: color 75ms cubic-bezier(0, 0, 0.2, 1);
  color: #${palette[2]};
}
.titlebar .subtitle:backdrop,
.titlebar .dim-label:backdrop {
  color: #${palette[2]};
}
.titlebar .titlebar {
  background-color: transparent;
  box-shadow: none;
}
.titlebar headerbar + separator {
  background-color: #${palette[0]};
}
.titlebar entry {
  box-shadow: inset 0 -1px rgba(221, 199, 161, 0.3);
  background-color: #${palette[0]};
  color: #${palette[2]};
}
.titlebar entry:disabled {
  box-shadow: inset 0 -1px rgba(221, 199, 161, 0.2);
  background-color: #${palette[0]};
  color: #${palette[2]};
}
.titlebar entry image {
  color: #${palette[2]};
}
.titlebar entry image:hover, .titlebar entry image:active {
  color: #${palette[2]};
}
.titlebar entry image:disabled {
  color: #${palette[2]};
}
.titlebar .linked:not(.vertical) > entry:not(:only-child) {
  border-radius: 6px 6px 0 0;
}
.titlebar button:not(.suggested-action):not(.destructive-action) {
  border-image: radial-gradient(circle closest-corner at center calc(100% - 1px), currentcolor 0%, transparent 0%) 0 0 0/0 0 0;
  background-color: transparent;
  color: #${palette[2]};
  box-shadow: none;
  background-color: transparent;
}
.titlebar button:not(.suggested-action):not(.destructive-action):drop(active), .titlebar button:not(.suggested-action):not(.destructive-action):hover {
  box-shadow: none;
  background-color: #${palette[0]};
}
.titlebar button:not(.suggested-action):not(.destructive-action):focus {
  box-shadow: none;
  background-color: #${palette[0]};
}
.titlebar button:not(.suggested-action):not(.destructive-action):active {
  box-shadow: none;
  background-image: radial-gradient(circle, #${palette[1]} 10%, transparent 0%);
}
.titlebar button:not(.suggested-action):not(.destructive-action):disabled {
  color: #${palette[0]};
}
.path-bar-box .nautilus-path-bar button:not(.suggested-action):not(.destructive-action):last-child:dir(ltr), .path-bar-box .nautilus-path-bar button:not(.suggested-action):not(.destructive-action):first-child:dir(rtl), .titlebar button:not(.suggested-action):not(.destructive-action):checked {
  border-image: radial-gradient(circle closest-corner at center calc(100% - 1px), currentcolor 100%, transparent 0%) 0 0 2/0 0 2px;
  background-color: transparent;
  color: #${palette[2]};
  box-shadow: none;
  background-color: transparent;
}
.path-bar-box .nautilus-path-bar button:drop(active):not(.suggested-action):not(.destructive-action):last-child:dir(ltr), .path-bar-box .nautilus-path-bar button:drop(active):not(.suggested-action):not(.destructive-action):first-child:dir(rtl), .path-bar-box .nautilus-path-bar button:hover:not(.suggested-action):not(.destructive-action):last-child:dir(ltr), .path-bar-box .nautilus-path-bar button:hover:not(.suggested-action):not(.destructive-action):first-child:dir(rtl), .titlebar button:not(.suggested-action):not(.destructive-action):checked:drop(active), .titlebar button:not(.suggested-action):not(.destructive-action):checked:hover {
  box-shadow: none;
  background-color: #${palette[0]};
}
.path-bar-box .nautilus-path-bar button:focus:not(.suggested-action):not(.destructive-action):last-child:dir(ltr), .path-bar-box .nautilus-path-bar button:focus:not(.suggested-action):not(.destructive-action):first-child:dir(rtl), .titlebar button:not(.suggested-action):not(.destructive-action):checked:focus {
  box-shadow: none;
  background-color: #${palette[0]};
}
.path-bar-box .nautilus-path-bar button:active:not(.suggested-action):not(.destructive-action):last-child:dir(ltr), .path-bar-box .nautilus-path-bar button:active:not(.suggested-action):not(.destructive-action):first-child:dir(rtl), .titlebar button:not(.suggested-action):not(.destructive-action):checked:active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(221, 199, 161, 0.12) 10%, transparent 0%);
}
.path-bar-box .nautilus-path-bar button:disabled:not(.suggested-action):not(.destructive-action):last-child:dir(ltr), .path-bar-box .nautilus-path-bar button:disabled:not(.suggested-action):not(.destructive-action):first-child:dir(rtl), .titlebar button:not(.suggested-action):not(.destructive-action):checked:disabled {
  background-color: transparent;
  color: rgba(221, 199, 161, 0.5);
}

.titlebar button:not(.suggested-action):not(.destructive-action):backdrop {
  color: rgba(221, 199, 161, 0.5);
}
.titlebar button:not(.suggested-action):not(.destructive-action):backdrop:disabled {
  color: rgba(221, 199, 161, 0.3);
}
.titlebar button:not(.suggested-action):not(.destructive-action):backdrop:checked {
  color: rgba(221, 199, 161, 0.7);
}
.titlebar button:not(.suggested-action):not(.destructive-action):backdrop:checked:disabled {
  color: rgba(221, 199, 161, 0.3);
}

.titlebar button.suggested-action:disabled, .titlebar button.destructive-action:disabled {
  background-color: rgba(221, 199, 161, 0.08);
  color: rgba(221, 199, 161, 0.5);
}
.titlebar stackswitcher button:not(.suggested-action):not(.destructive-action).text-button {
  min-width: 104px;
}
.titlebar .path-bar button:not(.suggested-action):not(.destructive-action).text-button {
  min-width: 0;
  padding-left: 4px;
  padding-right: 4px;
}
.titlebar.selection-mode {
  transition: background-color 0.1ms 225ms, color 75ms cubic-bezier(0, 0, 0.2, 1);
  animation: ripple-on-headerbar 225ms cubic-bezier(0, 0, 0.2, 1);
  box-shadow: 0 2px 2px -2px rgba(0, 0, 0, 0.3), 0 1px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 2px -0.6px rgba(0, 0, 0, 0.17), inset 0 1px rgba(255, 255, 255, 0.2);
  background-color: #${palette[7]};
  color: #${palette[0]};
}
.titlebar.selection-mode:backdrop {
  color: rgba(0, 0, 0, 0.7);
}
.titlebar.selection-mode .subtitle:link {
  color: #${palette[0]};
}
.titlebar.selection-mode button:not(.suggested-action):not(.destructive-action) {
  border-image: radial-gradient(circle closest-corner at center calc(100% - 1px), currentcolor 0%, transparent 0%) 0 0 0/0 0 0;
  color: #${palette[0]};
}
.titlebar.selection-mode button:not(.suggested-action):not(.destructive-action):disabled {
  color: #${palette[0]};
}
.titlebar.selection-mode button:not(.suggested-action):not(.destructive-action):checked {
  border-image: radial-gradient(circle closest-corner at center calc(100% - 1px), currentcolor 100%, transparent 0%) 0 0 2/0 0 2px;
  color: #${palette[0]};
}
.titlebar.selection-mode button:not(.suggested-action):not(.destructive-action):checked:disabled {
  color: rgba(0, 0, 0, 0.5);
}
.titlebar.selection-mode button:not(.suggested-action):not(.destructive-action):backdrop {
  color: rgba(0, 0, 0, 0.7);
}
.titlebar.selection-mode button:not(.suggested-action):not(.destructive-action):backdrop:disabled {
  color: rgba(0, 0, 0, 0.3);
}
.titlebar.selection-mode button:not(.suggested-action):not(.destructive-action):backdrop:checked {
  color: rgba(0, 0, 0, 0.7);
}
.titlebar.selection-mode button:not(.suggested-action):not(.destructive-action):backdrop:checked:disabled {
  color: rgba(0, 0, 0, 0.3);
}
.titlebar.selection-mode .selection-menu {
  padding-left: 16px;
  padding-right: 16px;
}
.titlebar.selection-mode .selection-menu arrow {
  -GtkArrow-arrow-scaling: 1;
}
.titlebar.selection-mode .selection-menu .arrow {
  -gtk-icon-source: -gtk-icontheme("pan-down-symbolic");
}
.titlebar .selection-mode {
  box-shadow: inset 0 1px rgba(255, 255, 255, 0.2);
  background-color: #${palette[7]};
}
.tiled .titlebar, .tiled-top .titlebar, .tiled-right .titlebar, .tiled-bottom .titlebar, .tiled-left .titlebar, .maximized .titlebar, .fullscreen .titlebar {
  border-radius: 0;
  box-shadow: 0 2px 2px -2px rgba(0, 0, 0, 0.3), 0 1px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 2px -0.6px rgba(0, 0, 0, 0.17);
}
.titlebar.default-decoration {
  min-height: 24px;
  padding: 4px;
  box-shadow: inset 0 1px rgba(255, 255, 255, 0.05);
}
.tiled .titlebar.default-decoration, .maximized .titlebar.default-decoration, .fullscreen .titlebar.default-decoration {
  box-shadow: none;
}
.titlebar.default-decoration button.titlebutton {
  min-height: 24px;
  min-width: 24px;
  margin: 0;
  padding: 0;
}
.background:not(.csd) .titlebar.default-decoration button.titlebutton:active {
  background-size: 1000% 1000%;
}
.solid-csd .titlebar:dir(rtl), .solid-csd .titlebar:dir(ltr) {
  border-radius: 0;
  box-shadow: 0 2px 2px -2px rgba(0, 0, 0, 0.3), 0 1px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 2px -0.6px rgba(0, 0, 0, 0.17);
}

headerbar {
  min-height: 40px;
  padding: 0 4px;
}
headerbar entry,
headerbar spinbutton,
headerbar button {
  margin-top: 4px;
  margin-bottom: 4px;
}
headerbar separator.titlebutton {
  margin-top: 10px;
  margin-bottom: 10px;
  background-color: #${palette[0]};
}
headerbar switch {
  margin-top: 8px;
  margin-bottom: 8px;
}
headerbar spinbutton button {
  margin-top: 0;
  margin-bottom: 0;
}
headerbar .entry-tag, headerbar .documents-entry-tag, headerbar .photos-entry-tag {
  margin-top: 5px;
  margin-bottom: 5px;
}

/**
 * Pathbars
 */
.caja-pathbar button,
.path-bar.linked:not(.vertical) > button {
  padding-left: 4px;
  padding-right: 4px;
  border-image: radial-gradient(circle closest-corner at center calc(100% - 1px), #${palette[7]} 0%, transparent 0%) 0 0 0/0 0 0;
  border-radius: 6px;
  color: rgba(212, 190, 152, 0.7);
  box-shadow: none;
  background-color: transparent;
}
.caja-pathbar button:drop(active), .caja-pathbar button:hover,
.path-bar.linked:not(.vertical) > button:drop(active),
.path-bar.linked:not(.vertical) > button:hover {
  box-shadow: none;
  background-color: rgba(212, 190, 152, 0.08);
}
.caja-pathbar button:focus,
.path-bar.linked:not(.vertical) > button:focus {
  box-shadow: none;
  background-color: rgba(212, 190, 152, 0.08);
}
.caja-pathbar button:active,
.path-bar.linked:not(.vertical) > button:active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(212, 190, 152, 0.12) 10%, transparent 0%);
}
.caja-pathbar button:disabled,
.path-bar.linked:not(.vertical) > button:disabled {
  background-color: transparent;
  color: rgba(212, 190, 152, 0.3);
}
.caja-pathbar button:checked,
.path-bar.linked:not(.vertical) > button:checked {
  border-image: radial-gradient(circle closest-corner at center calc(100% - 1px), #${palette[7]} 100%, transparent 0%) 0 0 2/0 0 2px;
  color: #${palette[7]};
  box-shadow: none;
  background-color: transparent;
}
.caja-pathbar button:checked:drop(active), .caja-pathbar button:checked:hover,
.path-bar.linked:not(.vertical) > button:checked:drop(active),
.path-bar.linked:not(.vertical) > button:checked:hover {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.12);
}
.caja-pathbar button:checked:focus,
.path-bar.linked:not(.vertical) > button:checked:focus {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.12);
}
.caja-pathbar button:checked:active,
.path-bar.linked:not(.vertical) > button:checked:active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(138, 180, 248, 0.16) 10%, transparent 0%);
}
.caja-pathbar button:checked:disabled,
.path-bar.linked:not(.vertical) > button:checked:disabled {
  background-color: transparent;
  color: rgba(212, 190, 152, 0.5);
}
.caja-pathbar button label:not(:only-child):first-child,
.path-bar.linked:not(.vertical) > button label:not(:only-child):first-child {
  margin-left: 0;
}
.caja-pathbar button label:not(:only-child):last-child,
.path-bar.linked:not(.vertical) > button label:not(:only-child):last-child {
  margin-right: 0;
}
.caja-pathbar button.text-button,
.path-bar.linked:not(.vertical) > button.text-button {
  min-width: 0;
}
.caja-pathbar button.slider-button,
.path-bar.linked:not(.vertical) > button.slider-button {
  padding-left: 4px;
  padding-right: 4px;
}

/**
 * Tree Views
 */
treeview.view {
  border-left-color: rgba(212, 190, 152, 0.3);
  border-top-color: rgba(212, 190, 152, 0.2);
}
* {
  -GtkTreeView-horizontal-separator: 4;
  -GtkTreeView-grid-line-width: 1;
  -GtkTreeView-grid-line-pattern: "";
  -GtkTreeView-tree-line-width: 1;
  -GtkTreeView-tree-line-pattern: "";
  -GtkTreeView-expander-size: 16;
}

treeview.view:hover, treeview.view:selected {
  border-radius: 0;
}
treeview.view.separator {
  min-height: 5px;
  color: rgba(212, 190, 152, 0.2);
}
treeview.view:drop(active) {
  border-style: solid none;
  border-width: 9999px;
  border-color: rgba(212, 190, 152, 0.08);
}
treeview.view:drop(active).after {
  border-top-style: none;
}
treeview.view:drop(active).before {
  border-bottom-style: none;
}
treeview.view.expander {
  -gtk-icon-source: -gtk-icontheme("pan-down-symbolic");
  -gtk-icon-transform: rotate(-90deg);
  color: rgba(212, 190, 152, 0.7);
}
treeview.view.expander:dir(rtl) {
  -gtk-icon-transform: rotate(90deg);
}
treeview.view.expander:checked {
  -gtk-icon-transform: unset;
}
treeview.view.expander:hover, treeview.view.expander:active {
  color: #${palette[2]};
}
treeview.view.expander:disabled {
  color: rgba(212, 190, 152, 0.3);
}
treeview.view.progressbar {
  border-bottom: 4px solid #${palette[7]};
  background-color: transparent;
}
treeview.view.progressbar:selected:hover {
  background-color: transparent;
}
treeview.view.trough {
  border-bottom: 4px solid rgba(212, 190, 152, 0.2);
  background-color: transparent;
}
treeview.view.trough:selected:hover {
  background-color: transparent;
}
treeview.view header button {
  padding: 2px 6px;
  border-style: none solid solid none;
  border-width: 1px;
  border-color: rgba(212, 190, 152, 0.2);
  border-radius: 0;
  background-clip: padding-box;
  color: rgba(212, 190, 152, 0.7);
  box-shadow: none;
  background-color: transparent;
}
treeview.view header button:drop(active), treeview.view header button:hover {
  box-shadow: none;
  background-color: rgba(212, 190, 152, 0.04);
}
treeview.view header button:focus {
  box-shadow: none;
  background-color: rgba(212, 190, 152, 0.08);
}
treeview.view header button:active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(212, 190, 152, 0.12) 10%, transparent 0%);
}
treeview.view header button:drop(active):not(:active), treeview.view header button:hover:not(:active) {
  transition-property: all, border-image, background-size, background-image, background-color;
  transition-duration: 75ms, 225ms, 300ms, 1200ms, 0ms;
}
treeview.view header button:disabled {
  background-color: transparent;
  color: rgba(212, 190, 152, 0.3);
}
treeview.view header button:last-child {
  border-right-style: none;
}
treeview.view button.dnd,
treeview.view header.button.dnd {
  padding: 2px 6px;
  border-style: none solid solid;
  border-width: 1px;
  border-color: rgba(212, 190, 152, 0.2);
  border-radius: 0;
  box-shadow: none;
  background-clip: padding-box;
  background-color: #${palette[1]};
  color: #${palette[7]};
}
treeview.view acceleditor > label {
  background-color: #${palette[7]};
}

/**
 * Menus
 */
menubar,
.menubar {
  -GtkWidget-window-dragging: true;
  padding: 0;
  background-color: #${palette[0]};
  color: #${palette[2]};
}
menubar:backdrop,
.menubar:backdrop {
  background-color: #${palette[0]};
  color: rgba(221, 199, 161, 0.7);
}
.csd menubar,
.csd .menubar {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
}
menubar > menuitem,
.menubar > menuitem {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
  min-height: 20px;
  padding: 4px 8px;
  color: rgba(221, 199, 161, 0.7);
}
menubar > menuitem:hover,
.menubar > menuitem:hover {
  transition: none;
  background-color: rgba(221, 199, 161, 0.12);
  color: #${palette[2]};
}
menubar > menuitem:disabled,
.menubar > menuitem:disabled {
  color: rgba(221, 199, 161, 0.3);
}

.background.popup {
  background-color: transparent;
}

menu,
.menu,
.context-menu {
  margin: 4px 0;
  padding: 4px 0;
  border: 1px solid rgba(212, 190, 152, 0.2);
  box-shadow: inset 0 1px rgba(255, 255, 255, 0.05);
  background-color: #${palette[1]};
  color: #${palette[2]};
  font: initial;
  text-shadow: none;
}
.csd menu,
.csd .menu,
.csd .context-menu {
  border: none;
  border-radius: 6px;
}
menu menuitem,
.menu menuitem,
.context-menu menuitem {
  transition: background-color 75ms cubic-bezier(0, 0, 0.2, 1);
  min-height: 20px;
  min-width: 40px;
  padding: 4px 8px;
}
menu menuitem:hover,
.menu menuitem:hover,
.context-menu menuitem:hover {
  transition: none;
  background-color: rgba(212, 190, 152, 0.08);
}
menu menuitem:disabled,
.menu menuitem:disabled,
.context-menu menuitem:disabled {
  color: rgba(212, 190, 152, 0.5);
}
menu menuitem arrow,
.menu menuitem arrow,
.context-menu menuitem arrow {
  min-height: 16px;
  min-width: 16px;
  color: rgba(212, 190, 152, 0.7);
}
menu menuitem arrow:disabled,
.menu menuitem arrow:disabled,
.context-menu menuitem arrow:disabled {
  color: rgba(212, 190, 152, 0.3);
}
menu menuitem arrow:dir(ltr),
.menu menuitem arrow:dir(ltr),
.context-menu menuitem arrow:dir(ltr) {
  -gtk-icon-source: -gtk-icontheme("pan-end-symbolic");
  margin-left: 8px;
}
menu menuitem arrow:dir(rtl),
.menu menuitem arrow:dir(rtl),
.context-menu menuitem arrow:dir(rtl) {
  -gtk-icon-source: -gtk-icontheme("pan-end-symbolic-rtl");
  margin-right: 8px;
}
menu > arrow,
.menu > arrow,
.context-menu > arrow {
  min-height: 16px;
  min-width: 16px;
  padding: 4px;
  background-color: #${palette[1]};
  color: rgba(212, 190, 152, 0.7);
}
menu > arrow.top,
.menu > arrow.top,
.context-menu > arrow.top {
  margin-top: -4px;
  border-bottom: 1px solid rgba(212, 190, 152, 0.2);
  border-radius: 6px 6px 0 0;
  -gtk-icon-source: -gtk-icontheme("pan-up-symbolic");
}
menu > arrow.bottom,
.menu > arrow.bottom,
.context-menu > arrow.bottom {
  margin-top: 8px;
  margin-bottom: -12px;
  border-top: 1px solid rgba(212, 190, 152, 0.2);
  border-radius: 0 0 6px 6px;
  -gtk-icon-source: -gtk-icontheme("pan-down-symbolic");
}
menu > arrow:hover,
.menu > arrow:hover,
.context-menu > arrow:hover {
  background-image: image(rgba(212, 190, 152, 0.08));
}
menu > arrow:disabled,
.menu > arrow:disabled,
.context-menu > arrow:disabled {
  border-color: transparent;
  background-color: transparent;
  color: transparent;
}
menu separator,
.menu separator,
.context-menu separator {
  margin: 4px 0;
}

menuitem accelerator {
  color: rgba(212, 190, 152, 0.7);
}
menuitem:disabled accelerator {
  color: rgba(212, 190, 152, 0.3);
}

/**
 * Popovers
 */
popover.background {
  transition: box-shadow 75ms cubic-bezier(0, 0, 0.2, 1);
  padding: 2px;
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2), 0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12);
  background-color: #${palette[1]};
}
popover.background:backdrop {
  box-shadow: 0 3px 2px -3px rgba(0, 0, 0, 0.3), 0 2px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 3px 0 rgba(0, 0, 0, 0.12);
}
popover.background, .csd popover.background {
  border-style: solid;
  border-width: 1px;
  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.2) rgba(0, 0, 0, 0.3);
  border-radius: 7px;
  background-clip: padding-box;
}
popover.background > stack {
  margin: -4px;
}
popover.background > toolbar {
  margin: -2px;
}
popover.background > list,
popover.background > .view,
popover.background > toolbar {
  border-style: none;
  box-shadow: none;
  background-color: transparent;
}
popover.background.menu button,
popover.background button.model {
  min-height: 32px;
  padding: 0 8px;
  border-radius: 6px;
}
popover.background separator {
  margin: 4px 0;
}
popover.background list separator {
  margin: 0;
}

/**
 * Notebooks
 */
notebook:focus > header > tabs > tab:checked {
  background-color: rgba(138, 180, 248, 0.12);
}
notebook > header.top {
  box-shadow: inset 0 -1px rgba(212, 190, 152, 0.2);
}
notebook > header.top > tabs > tab {
  box-shadow: inset 0 -2px transparent;
}
notebook > header.top > tabs > tab:checked {
  box-shadow: inset 0 -2px #${palette[7]};
}
notebook > header.bottom {
  box-shadow: inset 0 1px rgba(212, 190, 152, 0.2);
}
notebook > header.bottom > tabs > tab {
  box-shadow: inset 0 2px transparent;
}
notebook > header.bottom > tabs > tab:checked {
  box-shadow: inset 0 2px #${palette[7]};
}
notebook > header.left {
  box-shadow: inset -1px 0 rgba(212, 190, 152, 0.2);
}
notebook > header.left > tabs > tab {
  box-shadow: inset -2px 0 transparent;
}
notebook > header.left > tabs > tab:checked {
  box-shadow: inset -2px 0 #${palette[7]};
}
notebook > header.right {
  box-shadow: inset 1px 0 rgba(212, 190, 152, 0.2);
}
notebook > header.right > tabs > tab {
  box-shadow: inset 2px 0 transparent;
}
notebook > header.right > tabs > tab:checked {
  box-shadow: inset 2px 0 #${palette[7]};
}
notebook > header.top > tabs > arrow.down, notebook > header.bottom > tabs > arrow.down {
  -gtk-icon-source: -gtk-icontheme("pan-start-symbolic");
}
notebook > header.top > tabs > arrow.up, notebook > header.bottom > tabs > arrow.up {
  -gtk-icon-source: -gtk-icontheme("pan-end-symbolic");
}

notebook > header.left > tabs > arrow.down, notebook > header.right > tabs > arrow.down {
  -gtk-icon-source: -gtk-icontheme("pan-up-symbolic");
}
notebook > header.left > tabs > arrow.up, notebook > header.right > tabs > arrow.up {
  -gtk-icon-source: -gtk-icontheme("pan-down-symbolic");
}

notebook > header > tabs > arrow {
  min-height: 16px;
  min-width: 16px;
  padding: 4px;
  border-radius: 0;
  color: rgba(212, 190, 152, 0.7);
}
notebook > header > tabs > arrow:drop(active), notebook > header > tabs > arrow:hover {
  background-color: rgba(212, 190, 152, 0.04);
}
notebook > header > tabs > arrow:focus {
  background-color: rgba(212, 190, 152, 0.08);
}
notebook > header > tabs > arrow:active {
  background-image: radial-gradient(circle, rgba(212, 190, 152, 0.12) 10%, transparent 0%);
}
notebook > header > tabs > arrow:disabled {
  color: rgba(212, 190, 152, 0.3);
}
notebook > header > tabs > tab {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1), background-size 0ms, background-image 0ms;
  min-height: 24px;
  min-width: 24px;
  padding: 4px 16px;
  outline: none;
  background-image: radial-gradient(circle, #${palette[7]} 10%, transparent 0%);
  background-repeat: no-repeat;
  background-position: center;
  background-size: 0% 0%;
  color: rgba(212, 190, 152, 0.7);
  font-weight: 500;
}
notebook > header > tabs > tab:hover {
  background-color: rgba(212, 190, 152, 0.04);
}
notebook > header > tabs > tab:disabled {
  color: rgba(212, 190, 152, 0.3);
}
notebook > header > tabs > tab:checked {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1), background-size 225ms cubic-bezier(0, 0, 0.2, 1), background-image 525ms cubic-bezier(0, 0, 0.2, 1);
  background-color: transparent;
  background-image: radial-gradient(circle, transparent 10%, transparent 0%);
  background-size: 1000% 1000%;
  color: #${palette[7]};
}
notebook > header > tabs > tab:checked:disabled {
  color: rgba(212, 190, 152, 0.5);
}
notebook > header > tabs > tab:checked.dnd {
  background-color: rgba(138, 180, 248, 0.12);
}
notebook > header > tabs > tab > box {
  transition: background-color 75ms cubic-bezier(0, 0, 0.2, 1);
  margin: -4px -16px;
  padding: 4px 16px;
}
notebook > header > tabs > tab > box:drop(active) {
  background-color: rgba(212, 190, 152, 0.08);
}
notebook > header > tabs > tab button.flat:last-child {
  margin-left: 4px;
  margin-right: -12px;
}
notebook > header > tabs > tab button.flat:first-child {
  margin-left: -12px;
  margin-right: 4px;
}

/**
 * Scrollbars
 */
scrollbar {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
  background-clip: padding-box;
}
* {
  -GtkScrollbar-has-backward-stepper: false;
  -GtkScrollbar-has-forward-stepper: false;
}

scrollbar.top {
  border-bottom: 1px solid rgba(212, 190, 152, 0.2);
}
scrollbar.bottom {
  border-top: 1px solid rgba(212, 190, 152, 0.2);
}
scrollbar.left {
  border-right: 1px solid rgba(212, 190, 152, 0.2);
}
scrollbar.right {
  border-left: 1px solid rgba(212, 190, 152, 0.2);
}
scrollbar slider {
  transition: background-color 75ms cubic-bezier(0, 0, 0.2, 1);
  min-width: 8px;
  min-height: 8px;
  border: 4px solid transparent;
  border-radius: 9999px;
  background-clip: padding-box;
  background-color: rgba(212, 190, 152, 0.5);
}
scrollbar slider:hover {
  background-color: rgba(212, 190, 152, 0.6);
}
scrollbar slider:active {
  background-color: rgba(212, 190, 152, 0.7);
}
scrollbar slider:disabled {
  background-color: rgba(212, 190, 152, 0.3);
}
scrollbar.fine-tune slider {
  min-width: 4px;
  min-height: 4px;
}
scrollbar.fine-tune.horizontal slider {
  margin: 2px 0;
}
scrollbar.fine-tune.vertical slider {
  margin: 0 2px;
}
scrollbar.overlay-indicator:not(.fine-tune) slider {
  transition-property: background-color, min-height, min-width;
}
scrollbar.overlay-indicator:not(.dragging):not(.hovering) {
  border-color: transparent;
  background-color: transparent;
}
scrollbar.overlay-indicator:not(.dragging):not(.hovering) slider {
  min-width: 4px;
  min-height: 4px;
  margin: 3px;
  border: 1px solid rgba(40, 40, 40, 0.3);
}
scrollbar.overlay-indicator:not(.dragging):not(.hovering) button {
  min-width: 4px;
  min-height: 4px;
  margin: 3px;
  border: 1px solid rgba(40, 40, 40, 0.3);
  border-radius: 9999px;
  background-color: rgba(212, 190, 152, 0.5);
  background-clip: padding-box;
  -gtk-icon-source: none;
}
scrollbar.overlay-indicator:not(.dragging):not(.hovering) button:disabled {
  background-color: rgba(212, 190, 152, 0.3);
}
scrollbar.overlay-indicator:not(.dragging):not(.hovering).horizontal slider {
  min-width: 24px;
}
scrollbar.overlay-indicator:not(.dragging):not(.hovering).horizontal button {
  min-width: 8px;
}
scrollbar.overlay-indicator:not(.dragging):not(.hovering).vertical slider {
  min-height: 24px;
}
scrollbar.overlay-indicator:not(.dragging):not(.hovering).vertical button {
  min-height: 8px;
}
scrollbar.overlay-indicator.dragging, scrollbar.overlay-indicator.hovering {
  background-color: #${palette[1]};
}
scrollbar.horizontal slider {
  min-width: 24px;
}
scrollbar.vertical slider {
  min-height: 24px;
}
scrollbar button {
  min-width: 16px;
  min-height: 16px;
  padding: 0;
  border-radius: 0;
}
scrollbar.vertical button.down {
  -gtk-icon-source: -gtk-icontheme("pan-down-symbolic");
}
scrollbar.vertical button.up {
  -gtk-icon-source: -gtk-icontheme("pan-up-symbolic");
}
scrollbar.horizontal button.down {
  -gtk-icon-source: -gtk-icontheme("pan-end-symbolic");
}
scrollbar.horizontal button.up {
  -gtk-icon-source: -gtk-icontheme("pan-start-symbolic");
}

/**
 * Switch
 */
switch {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
  margin: 4px 0;
  padding: 0 2px;
  border: 5px solid transparent;
  border-radius: 9999px;
  background-color: rgba(212, 190, 152, 0.3);
  background-clip: padding-box;
  font-size: 0;
}
switch:checked {
  background-color: rgba(138, 180, 248, 0.5);
}
switch:disabled {
  opacity: 0.5;
}
switch image {
  margin: -8px;
  -gtk-icon-transform: scale(0);
}
switch slider {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
  min-width: 20px;
  min-height: 20px;
  margin: -3px -2px;
  border-radius: 9999px;
  outline: none;
  box-shadow: 0 0 0 10px transparent, 0 2px 2px -2px rgba(0, 0, 0, 0.3), 0 1px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 2px -0.6px rgba(0, 0, 0, 0.17);
  background-color: #${palette[1]};
}
switch:hover slider {
  box-shadow: 0 0 0 10px rgba(212, 190, 152, 0.08), 0 2px 2px -2px rgba(0, 0, 0, 0.3), 0 1px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 2px -0.6px rgba(0, 0, 0, 0.17);
}
switch:focus slider {
  box-shadow: 0 0 0 10px rgba(212, 190, 152, 0.08), 0 2px 2px -2px rgba(0, 0, 0, 0.3), 0 1px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 2px -0.6px rgba(0, 0, 0, 0.17);
}
switch:checked slider {
  background-color: #${palette[7]};
}
switch:checked:hover slider {
  box-shadow: 0 0 0 10px rgba(138, 180, 248, 0.12), 0 2px 2px -2px rgba(0, 0, 0, 0.3), 0 1px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 2px -0.6px rgba(0, 0, 0, 0.17);
}
switch:checked:focus slider {
  box-shadow: 0 0 0 10px rgba(138, 180, 248, 0.12), 0 2px 2px -2px rgba(0, 0, 0, 0.3), 0 1px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 2px -0.6px rgba(0, 0, 0, 0.17);
}
/**
 * Check and Radio items
 */
.view.content-view.check:not(list),
.content-view:not(list) check {
  min-height: 40px;
  min-width: 40px;
  margin: 0;
  padding: 0;
  background-color: transparent;
  background-image: none;
  -gtk-icon-shadow: 0 1px 1px rgba(0, 0, 0, 0.2), 0 2px 2px rgba(0, 0, 0, 0.14), 0 1px 3px rgba(0, 0, 0, 0.12);
}
.view.content-view.check:not(list):hover, .view.content-view.check:not(list):active,
.content-view:not(list) check:hover,
.content-view:not(list) check:active {
  -gtk-icon-shadow: 0 2px 2px rgba(0, 0, 0, 0.2), 0 4px 3px rgba(0, 0, 0, 0.14), 0 1px 6px rgba(0, 0, 0, 0.12);
}
.view.content-view.check:not(list),
.content-view:not(list) check {
  -gtk-icon-source: -gtk-scaled(url("assets/selectionmode-checkbox-unchecked-dark.png"), url("assets/selectionmode-checkbox-unchecked-dark@2.png"));
}
.view.content-view.check:not(list):checked,
.content-view:not(list) check:checked {
  -gtk-icon-source: -gtk-scaled(url("assets/selectionmode-checkbox-checked-dark.png"), url("assets/selectionmode-checkbox-checked-dark@2.png"));
}

checkbutton,
radiobutton {
  outline: none;
}

checkbutton.text-button,
radiobutton.text-button {
  padding: 2px;
}
checkbutton.text-button label:not(:only-child),
radiobutton.text-button label:not(:only-child) {
  margin: 0 4px;
}

check,
radio {
  min-height: 24px;
  min-width: 24px;
  margin: -8px;
  padding: 8px;
  border-radius: 9999px;
  color: rgba(212, 190, 152, 0.7);
}
check:drop(active), check:hover,
radio:drop(active),
radio:hover {
  background-color: rgba(212, 190, 152, 0.08);
}
check:focus,
radio:focus {
  background-color: rgba(212, 190, 152, 0.08);
}
check:active,
radio:active {
  background-image: radial-gradient(circle, rgba(212, 190, 152, 0.12) 10%, transparent 0%);
}
check:checked, check:indeterminate,
radio:checked,
radio:indeterminate {
  color: #${palette[7]};
}
check:checked:drop(active), check:checked:hover, check:indeterminate:drop(active), check:indeterminate:hover,
radio:checked:drop(active),
radio:checked:hover,
radio:indeterminate:drop(active),
radio:indeterminate:hover {
  background-color: rgba(138, 180, 248, 0.12);
}
check:checked:focus, check:indeterminate:focus,
radio:checked:focus,
radio:indeterminate:focus {
  background-color: rgba(138, 180, 248, 0.12);
}
check:checked:active, check:indeterminate:active,
radio:checked:active,
radio:indeterminate:active {
  background-image: radial-gradient(circle, rgba(138, 180, 248, 0.16) 10%, transparent 0%);
}
check:disabled,
radio:disabled {
  color: rgba(212, 190, 152, 0.3);
}
popover modelbutton.flat check, popover modelbutton.flat check:focus, popover modelbutton.flat check:hover, popover modelbutton.flat check:focus:hover, popover modelbutton.flat check:active, popover modelbutton.flat check:disabled,
popover modelbutton.flat radio,
popover modelbutton.flat radio:focus,
popover modelbutton.flat radio:hover,
popover modelbutton.flat radio:focus:hover,
popover modelbutton.flat radio:active,
popover modelbutton.flat radio:disabled {
  transition: none;
  background-color: transparent;
  background-image: none;
}
popover modelbutton.flat check.left:dir(rtl),
popover modelbutton.flat radio.left:dir(rtl) {
  margin-left: -12px;
  margin-right: -4px;
}
popover modelbutton.flat check.right:dir(ltr),
popover modelbutton.flat radio.right:dir(ltr) {
  margin-left: -4px;
  margin-right: -12px;
}
menu menuitem check,
menu menuitem radio {
  transition: none;
  margin: 0;
  padding: 0;
}
menu menuitem check:dir(ltr),
menu menuitem radio:dir(ltr) {
  margin-right: 8px;
}
menu menuitem check:dir(rtl),
menu menuitem radio:dir(rtl) {
  margin-left: 8px;
}
menu menuitem check:hover, menu menuitem check:focus, menu menuitem check:checked:hover, menu menuitem check:checked:focus, menu menuitem check:indeterminate:hover, menu menuitem check:indeterminate:focus,
menu menuitem radio:hover,
menu menuitem radio:focus,
menu menuitem radio:checked:hover,
menu menuitem radio:checked:focus,
menu menuitem radio:indeterminate:hover,
menu menuitem radio:indeterminate:focus {
  background-color: transparent;
}

check {
  -gtk-icon-source: -gtk-recolor(url("icons/checkbox-unchecked-symbolic.svg"));
}
check:checked {
  -gtk-icon-source: -gtk-recolor(url("icons/checkbox-checked-symbolic.svg"));
}
check:indeterminate {
  -gtk-icon-source: -gtk-recolor(url("icons/checkbox-mixed-symbolic.svg"));
}

radio {
  -gtk-icon-source: -gtk-recolor(url("icons/radio-unchecked-symbolic.svg"));
  border-image-slice: 20;
  border-image-width: 20px;
  border-image-source: -gtk-gradient(radial, center center, 0, center center, 0.001, to(#${palette[7]}), to(transparent));
}
radio:indeterminate {
  -gtk-icon-source: -gtk-recolor(url("icons/radio-mixed-symbolic.svg"));
}
radio:checked:not(:indeterminate) {
  border-image-source: -gtk-gradient(radial, center center, 0, center center, 0.125, to(#${palette[7]}), to(transparent));
}
radio:checked:not(:indeterminate):disabled {
  border-image-source: -gtk-gradient(radial, center center, 0, center center, 0.125, to(rgba(212, 190, 152, 0.3)), to(transparent));
}

#MozillaGtkWidget > widget > checkbutton > check,
menu menuitem check {
  min-height: 16px;
  min-width: 16px;
  border-radius: 6px;
  -gtk-icon-source: -gtk-recolor(url("icons/small-checkbox-unchecked-symbolic.svg"));
}
#MozillaGtkWidget > widget > checkbutton > check:checked,
menu menuitem check:checked {
  -gtk-icon-source: -gtk-recolor(url("icons/small-checkbox-checked-symbolic.svg"));
}
#MozillaGtkWidget > widget > checkbutton > check:indeterminate,
menu menuitem check:indeterminate {
  -gtk-icon-source: -gtk-recolor(url("icons/small-checkbox-mixed-symbolic.svg"));
}

#MozillaGtkWidget > widget > radiobutton > radio,
menu menuitem radio {
  min-height: 16px;
  min-width: 16px;
  border-image: none;
  -gtk-icon-source: -gtk-recolor(url("icons/small-radio-unchecked-symbolic.svg"));
}
#MozillaGtkWidget > widget > radiobutton > radio:checked,
menu menuitem radio:checked {
  -gtk-icon-source: -gtk-recolor(url("icons/small-radio-checked-symbolic.svg"));
}
#MozillaGtkWidget > widget > radiobutton > radio:indeterminate,
menu menuitem radio:indeterminate {
  -gtk-icon-source: -gtk-recolor(url("icons/small-radio-mixed-symbolic.svg"));
}

treeview.view check,
treeview.view radio {
  padding: 0;
  color: rgba(212, 190, 152, 0.7);
}
treeview.view check:checked, treeview.view check:indeterminate,
treeview.view radio:checked,
treeview.view radio:indeterminate {
  color: #${palette[7]};
}
treeview.view check:disabled,
treeview.view radio:disabled {
  color: rgba(212, 190, 152, 0.3);
}
treeview.view check, treeview.view check:hover, treeview.view check:selected, treeview.view check:selected:hover,
treeview.view radio,
treeview.view radio:hover,
treeview.view radio:selected,
treeview.view radio:selected:hover {
  box-shadow: none;
  background-color: transparent;
}

treeview.view radio:checked {
  -gtk-icon-source: -gtk-recolor(url("icons/radio-checked-symbolic.svg"));
  border-image: none;
}

/**
 * GtkScale
 */
scale {
  min-height: 2px;
  min-width: 2px;
}
scale.horizontal {
  padding: 15px 12px;
}
scale.vertical {
  padding: 12px 15px;
}
scale slider {
  min-height: 32px;
  min-width: 32px;
  margin: -15px;
}
scale.fine-tune.horizontal {
  min-height: 4px;
  padding-top: 14px;
  padding-bottom: 14px;
}
scale.fine-tune.vertical {
  min-width: 4px;
  padding-left: 14px;
  padding-right: 14px;
}
scale.fine-tune slider {
  margin: -14px;
}
scale trough {
  transition: background-color 75ms cubic-bezier(0, 0, 0.2, 1);
  outline: none;
  background-color: rgba(212, 190, 152, 0.3);
}
scale trough:disabled {
  background-color: rgba(212, 190, 152, 0.2);
}
scale highlight {
  transition: background-image 75ms cubic-bezier(0, 0, 0.2, 1);
  background-image: image(#${palette[7]});
}
scale highlight:disabled {
  background-color: #${palette[0]};
  background-image: image(rgba(212, 190, 152, 0.3));
}
scale fill {
  transition: background-color 75ms cubic-bezier(0, 0, 0.2, 1);
  background-color: rgba(212, 190, 152, 0.3);
}
scale fill:disabled {
  background-color: transparent;
}
scale slider {
  transition: background-color 75ms cubic-bezier(0, 0, 0.2, 1), background-size 300ms cubic-bezier(0, 0, 0.2, 1), background-image 1200ms cubic-bezier(0, 0, 0.2, 1);
  background-repeat: no-repeat;
  background-position: center;
  background-size: auto, 1000% 1000%;
  border-radius: 50%;
  color: #${palette[7]};
}
scale slider {
  background-image: -gtk-scaled(url("assets/scale-slider-dark.png"), url("assets/scale-slider-dark@2.png")), radial-gradient(circle, transparent 10%, transparent 0%);
}
scale slider:disabled {
  background-image: -gtk-scaled(url("assets/scale-slider-disabled-dark.png"), url("assets/scale-slider-disabled-dark@2.png")), radial-gradient(circle, transparent 10%, transparent 0%);
}
scale slider:hover {
  background-color: rgba(138, 180, 248, 0.12);
}
scale slider:focus {
  background-color: rgba(138, 180, 248, 0.12);
}
scale slider:active {
  transition: background-color 75ms cubic-bezier(0, 0, 0.2, 1), background-size 0ms, background-image 0ms;
  animation: ripple-on-slider 225ms cubic-bezier(0, 0, 0.2, 1) forwards;
  background-image: -gtk-scaled(url("assets/scale-slider-dark.png"), url("assets/scale-slider-dark@2.png")), radial-gradient(circle, rgba(138, 180, 248, 0.16) 10%, transparent 0%);
  background-size: auto, 0% 0%;
}
scale marks,
scale value {
  color: rgba(212, 190, 152, 0.7);
}
scale indicator {
  background-color: rgba(212, 190, 152, 0.3);
  color: transparent;
}
scale.horizontal marks.top {
  margin-bottom: 7px;
  margin-top: -15px;
}
scale.horizontal.fine-tune marks.top {
  margin-bottom: 6px;
  margin-top: -14px;
}
scale.horizontal marks.bottom {
  margin-top: 7px;
  margin-bottom: -15px;
}
scale.horizontal.fine-tune marks.bottom {
  margin-top: 6px;
  margin-bottom: -14px;
}
scale.vertical marks.top {
  margin-right: 7px;
  margin-left: -15px;
}
scale.vertical.fine-tune marks.top {
  margin-right: 6px;
  margin-left: -14px;
}
scale.vertical marks.bottom {
  margin-left: 7px;
  margin-right: -15px;
}
scale.vertical.fine-tune marks.bottom {
  margin-left: 6px;
  margin-right: -14px;
}
scale.horizontal indicator {
  min-height: 8px;
  min-width: 1px;
}
scale.vertical indicator {
  min-height: 1px;
  min-width: 8px;
}
scale.horizontal.marks-before:not(.marks-after) slider {
  background-image: -gtk-scaled(url("assets/scale-horz-marks-before-slider-dark.png"), url("assets/scale-horz-marks-before-slider-dark@2.png")), radial-gradient(circle, transparent 10%, transparent 0%);
}
scale.horizontal.marks-before:not(.marks-after) slider:disabled {
  background-image: -gtk-scaled(url("assets/scale-horz-marks-before-slider-disabled-dark.png"), url("assets/scale-horz-marks-before-slider-disabled-dark@2.png")), radial-gradient(circle, transparent 10%, transparent 0%);
}
scale.horizontal.marks-before:not(.marks-after) slider:active {
  background-image: -gtk-scaled(url("assets/scale-horz-marks-before-slider-dark.png"), url("assets/scale-horz-marks-before-slider-dark@2.png")), radial-gradient(circle, rgba(138, 180, 248, 0.16) 10%, transparent 0%);
}
scale.horizontal.marks-after:not(.marks-before) slider {
  background-image: -gtk-scaled(url("assets/scale-horz-marks-after-slider-dark.png"), url("assets/scale-horz-marks-after-slider-dark@2.png")), radial-gradient(circle, transparent 10%, transparent 0%);
}
scale.horizontal.marks-after:not(.marks-before) slider:disabled {
  background-image: -gtk-scaled(url("assets/scale-horz-marks-after-slider-disabled-dark.png"), url("assets/scale-horz-marks-after-slider-disabled-dark@2.png")), radial-gradient(circle, transparent 10%, transparent 0%);
}
scale.horizontal.marks-after:not(.marks-before) slider:active {
  background-image: -gtk-scaled(url("assets/scale-horz-marks-after-slider-dark.png"), url("assets/scale-horz-marks-after-slider-dark@2.png")), radial-gradient(circle, rgba(138, 180, 248, 0.16) 10%, transparent 0%);
}
scale.vertical.marks-before:not(.marks-after) slider {
  background-image: -gtk-scaled(url("assets/scale-vert-marks-before-slider-dark.png"), url("assets/scale-vert-marks-before-slider-dark@2.png")), radial-gradient(circle, transparent 10%, transparent 0%);
}
scale.vertical.marks-before:not(.marks-after) slider:disabled {
  background-image: -gtk-scaled(url("assets/scale-vert-marks-before-slider-disabled-dark.png"), url("assets/scale-vert-marks-before-slider-disabled-dark@2.png")), radial-gradient(circle, transparent 10%, transparent 0%);
}
scale.vertical.marks-before:not(.marks-after) slider:active {
  background-image: -gtk-scaled(url("assets/scale-vert-marks-before-slider-dark.png"), url("assets/scale-vert-marks-before-slider-dark@2.png")), radial-gradient(circle, rgba(138, 180, 248, 0.16) 10%, transparent 0%);
}
scale.vertical.marks-after:not(.marks-before) slider {
  background-image: -gtk-scaled(url("assets/scale-vert-marks-after-slider-dark.png"), url("assets/scale-vert-marks-after-slider-dark@2.png")), radial-gradient(circle, transparent 10%, transparent 0%);
}
scale.vertical.marks-after:not(.marks-before) slider:disabled {
  background-image: -gtk-scaled(url("assets/scale-vert-marks-after-slider-disabled-dark.png"), url("assets/scale-vert-marks-after-slider-disabled-dark@2.png")), radial-gradient(circle, transparent 10%, transparent 0%);
}
scale.vertical.marks-after:not(.marks-before) slider:active {
  background-image: -gtk-scaled(url("assets/scale-vert-marks-after-slider-dark.png"), url("assets/scale-vert-marks-after-slider-dark@2.png")), radial-gradient(circle, rgba(138, 180, 248, 0.16) 10%, transparent 0%);
}
scale.color {
  min-height: 0;
  min-width: 0;
}
scale.color.horizontal {
  padding: 0 0 12px 0;
}
scale.color.horizontal slider:dir(ltr), scale.color.horizontal slider:dir(rtl) {
  margin-bottom: -24px;
  margin-top: 8px;
}
scale.color.vertical:dir(ltr) {
  padding: 0 0 0 12px;
}
scale.color.vertical:dir(ltr) slider {
  margin-left: -24px;
  margin-right: 8px;
}
scale.color.vertical:dir(rtl) {
  padding: 0 12px 0 0;
}
scale.color.vertical:dir(rtl) slider {
  margin-right: -24px;
  margin-left: 8px;
}

/**
 * Progress bars
 */
progressbar {
  color: rgba(212, 190, 152, 0.7);
  font-size: smaller;
}
progressbar.horizontal trough,
progressbar.horizontal progress {
  min-height: 4px;
}
progressbar.vertical trough,
progressbar.vertical progress {
  min-width: 4px;
}
progressbar trough {
  background-color: rgba(212, 190, 152, 0.2);
}
progressbar progress {
  background-color: #${palette[7]};
}
progressbar trough.empty progress {
  all: unset;
}

/**
 * Level Bar
 */
levelbar.horizontal block {
  min-height: 4px;
}
levelbar.horizontal.discrete block {
  min-width: 32px;
}
levelbar.horizontal.discrete block:not(:last-child) {
  margin-right: 2px;
}
levelbar.vertical block {
  min-width: 4px;
}
levelbar.vertical.discrete block {
  min-height: 32px;
}
levelbar.vertical.discrete block:not(:last-child) {
  margin-bottom: 2px;
}
levelbar block.low {
  background-color: #${palette[5]};
}
levelbar block.high, levelbar block:not(.empty) {
  background-color: #${palette[7]};
}
levelbar block.full {
  background-color: #${palette[6]};
}
levelbar block.empty {
  background-color: rgba(212, 190, 152, 0.2);
}

/**
 * Print dialog
 */
printdialog paper {
  padding: 0;
  border: 1px solid rgba(212, 190, 152, 0.2);
  background-clip: padding-box;
  background-color: #${palette[0]};
  color: #${palette[2]};
}
printdialog .dialog-action-box {
  margin: 12px;
}

/**
 * Frames
 */
frame > border,
.frame {
  margin: 0;
  padding: 0;
  border: 1px solid rgba(212, 190, 152, 0.2);
  border-radius: 0;
  box-shadow: none;
  background-clip: padding-box;
  background-color: #${palette[0]};
}
frame > border.flat,
.frame.flat {
  border-style: none;
  background-color: transparent;
}

frame.flat > border {
  border-style: none;
  background-color: transparent;
}

actionbar > revealer > box {
  padding: 4px;
  border-top: 1px solid rgba(212, 190, 152, 0.2);
}
actionbar > revealer > box .linked:not(.vertical) > entry:not(:only-child) {
  border-radius: 6px 6px 0 0;
}

scrolledwindow viewport.frame {
  border-style: none;
  background-color: transparent;
}
overshoot.top {
  background-image: -gtk-gradient(radial, center top, 0, center top, 0.75, to(rgba(138, 180, 248, 0.24)), to(transparent));
  background-repeat: no-repeat;
  background-position: center top;
  background-color: transparent;
  border: none;
  box-shadow: none;
}
overshoot.bottom {
  background-image: -gtk-gradient(radial, center bottom, 0, center bottom, 0.75, to(rgba(138, 180, 248, 0.24)), to(transparent));
  background-repeat: no-repeat;
  background-position: center bottom;
  background-color: transparent;
  border: none;
  box-shadow: none;
}
overshoot.left {
  background-image: -gtk-gradient(radial, left center, 0, left center, 0.75, to(rgba(138, 180, 248, 0.24)), to(transparent));
  background-repeat: no-repeat;
  background-position: left center;
  background-color: transparent;
  border: none;
  box-shadow: none;
}
overshoot.right {
  background-image: -gtk-gradient(radial, right center, 0, right center, 0.75, to(rgba(138, 180, 248, 0.24)), to(transparent));
  background-repeat: no-repeat;
  background-position: right center;
  background-color: transparent;
  border: none;
  box-shadow: none;
}

junction {
  border-style: solid none none solid;
  border-width: 1px;
  border-color: rgba(212, 190, 152, 0.2);
}
junction:dir(rtl) {
  border-style: solid solid none none;
}

separator {
  min-width: 1px;
  min-height: 1px;
  background-color: rgba(212, 190, 152, 0.2);
}

.tweak-categories separator, preferences stacksidebar.sidebar list separator, stacksidebar.sidebar + separator.vertical,
stacksidebar.sidebar separator.horizontal, button.font separator, button.file separator {
  min-width: 0;
  min-height: 0;
  background-color: transparent;
}

/**
 * Lists
 */
list {
  border-color: rgba(212, 190, 152, 0.2);
}
list row {
  padding: 2px;
}

row {
  background-clip: padding-box;
}
row.activatable:drop(active), row.activatable:hover {
  background-color: rgba(212, 190, 152, 0.04);
}
row.activatable:focus {
  background-color: rgba(212, 190, 152, 0.08);
}
row.activatable:active {
  background-image: radial-gradient(circle, rgba(212, 190, 152, 0.12) 10%, transparent 0%);
}
row.activatable:drop(active):not(:active), row.activatable:hover:not(:active) {
  transition-property: all, border-image, background-size, background-image, background-color;
  transition-duration: 75ms, 225ms, 300ms, 1200ms, 0ms;
}
row.activatable.has-open-popup {
  background-color: rgba(212, 190, 152, 0.12);
}
row:selected {
  background-color: rgba(138, 180, 248, 0.6);
}
row:selected:drop(active), row:selected:hover {
  background-color: rgba(138, 180, 248, 0.632);
}
row:selected:focus {
  background-color: rgba(138, 180, 248, 0.648);
}
row:selected:active {
  background-image: radial-gradient(circle, rgba(138, 180, 248, 0.16) 10%, transparent 0%);
}
row:selected.has-open-popup {
  background-color: rgba(138, 180, 248, 0.664);
}

/**
 * App Notifications
 */
.app-notification {
  margin: 8px;
}
.app-notification button.text-button:not(:disabled) {
  color: #${palette[7]};
  box-shadow: none;
  background-color: transparent;
}
.app-notification button.text-button:not(:disabled):drop(active), .app-notification button.text-button:not(:disabled):hover {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.12);
}
.app-notification button.text-button:not(:disabled):focus {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.12);
}
.app-notification button.text-button:not(:disabled):active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(138, 180, 248, 0.16) 10%, transparent 0%);
}
.app-notification.frame {
  border-style: none;
}
.app-notification border {
  border-style: none;
  background-color: transparent;
}

/**
 * Expanders
 */
expander title > arrow {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
  min-width: 16px;
  min-height: 16px;
  -gtk-icon-source: -gtk-icontheme("pan-down-symbolic");
  color: rgba(212, 190, 152, 0.7);
}
expander title > arrow:checked:dir(ltr) {
  -gtk-icon-transform: rotate(-180deg);
}
expander title > arrow:checked:dir(rtl) {
  -gtk-icon-transform: rotate(180deg);
}
expander title > arrow:hover, expander title > arrow:active {
  color: #${palette[2]};
}
expander title > arrow:disabled {
  color: rgba(212, 190, 152, 0.3);
}

/**
 * Calendar
 */
calendar {
  padding: 1px;
  border: 1px solid rgba(212, 190, 152, 0.2);
  background-clip: padding-box;
  background-color: #${palette[0]};
  color: #${palette[2]};
}
calendar:disabled {
  color: rgba(212, 190, 152, 0.5);
}
calendar:selected {
  border-radius: 7px;
  background-color: rgba(138, 180, 248, 0.6);
}
calendar.header {
  border-style: none none solid;
  border-color: rgba(212, 190, 152, 0.2);
  border-radius: 0;
}
calendar.button {
  border-radius: 7px;
  color: rgba(212, 190, 152, 0.7);
}
calendar.button:hover {
  background-image: image(rgba(212, 190, 152, 0.08));
}
calendar.button:disabled {
  color: rgba(212, 190, 152, 0.3);
}
calendar.highlight {
  color: rgba(212, 190, 152, 0.7);
  font-weight: 500;
}
calendar:indeterminate {
  color: rgba(212, 190, 152, 0.3);
}

/**
 * Dialogs
 */
messagedialog.background {
  background-color: #${palette[1]};
}
messagedialog .titlebar {
  min-height: 24px;
  border-style: none;
  box-shadow: inset 0 1px rgba(255, 255, 255, 0.05);
  background-color: #${palette[1]};
  color: #${palette[2]};
}
messagedialog .titlebar:backdrop {
  background-color: #${palette[1]};
  color: rgba(212, 190, 152, 0.7);
}
messagedialog.csd.background {
  border-bottom-left-radius: 6px;
  border-bottom-right-radius: 6px;
}
messagedialog box.vertical > label + label {
  color: rgba(212, 190, 152, 0.7);
}
messagedialog .dialog-action-box {
  margin-top: -4px;
}
messagedialog .dialog-action-box button:not(:last-child) {
  margin-right: 4px;
}
messagedialog .dialog-action-box button:not(:disabled) {
  color: #${palette[7]};
  box-shadow: none;
  background-color: transparent;
}
messagedialog .dialog-action-box button:not(:disabled):drop(active), messagedialog .dialog-action-box button:not(:disabled):hover {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.12);
}
messagedialog .dialog-action-box button:not(:disabled):focus {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.12);
}
messagedialog .dialog-action-box button:not(:disabled):active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(138, 180, 248, 0.16) 10%, transparent 0%);
}
messagedialog .dialog-action-box button.destructive-action:not(:disabled) {
  color: #${palette[4]};
  box-shadow: none;
  background-color: transparent;
}
messagedialog .dialog-action-box button.destructive-action:not(:disabled):drop(active), messagedialog .dialog-action-box button.destructive-action:not(:disabled):hover {
  box-shadow: none;
  background-color: rgba(255, 15, 15, 0.12);
}
messagedialog .dialog-action-box button.destructive-action:not(:disabled):focus {
  box-shadow: none;
  background-color: rgba(255, 15, 15, 0.12);
}
messagedialog .dialog-action-box button.destructive-action:not(:disabled):active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(255, 15, 15, 0.16) 10%, transparent 0%);
}

filechooser .dialog-action-box {
  border-top: 1px solid rgba(212, 190, 152, 0.2);
}
filechooser #pathbarbox {
  border-bottom: 1px solid rgba(212, 190, 152, 0.2);
}
filechooser #pathbarbox > stack > box > button {
  border-radius: 9999px;
}

/**
 * Sidebar
 */
.sidebar {
  border-style: none;
  background-color: transparent;
}
stacksidebar.sidebar:dir(ltr) list, stacksidebar.sidebar.left list, stacksidebar.sidebar.left:dir(rtl) list, .sidebar:not(separator):dir(ltr), .sidebar:not(separator).left, .sidebar:not(separator).left:dir(rtl) {
  border-right: 1px solid rgba(212, 190, 152, 0.2);
  border-left-style: none;
}

stacksidebar.sidebar:dir(rtl) list, stacksidebar.sidebar.right list, .sidebar:not(separator):dir(rtl), .sidebar:not(separator).right {
  border-left: 1px solid rgba(212, 190, 152, 0.2);
  border-right-style: none;
}

paned .sidebar, paned .sidebar.left, paned .sidebar.right, paned .sidebar.left:dir(rtl), paned .sidebar:dir(rtl), paned .sidebar:dir(ltr) {
  border-style: none;
}

stacksidebar.sidebar list {
  padding: 4px;
}
stacksidebar.sidebar row {
  min-height: 32px;
  padding: 0 2px;
  border-radius: 6px;
  color: rgba(212, 190, 152, 0.7);
  font-weight: 500;
}
stacksidebar.sidebar row:selected {
  color: #${palette[7]};
  background-color: rgba(138, 180, 248, 0.16);
}
stacksidebar.sidebar row:selected:drop(active), stacksidebar.sidebar row:selected:hover {
  background-color: rgba(138, 180, 248, 0.2272);
}
stacksidebar.sidebar row:selected:focus {
  background-color: rgba(138, 180, 248, 0.2608);
}
stacksidebar.sidebar row:selected:active {
  background-image: radial-gradient(circle, rgba(138, 180, 248, 0.16) 10%, transparent 0%);
}
stacksidebar.sidebar row + row {
  margin-top: 4px;
}
stacksidebar.sidebar row > label {
  padding-left: 6px;
  padding-right: 6px;
}
separator.sidebar {
  background-color: rgba(212, 190, 152, 0.2);
}
/**
 * File chooser
 */
row image.sidebar-icon {
  transition: color 75ms cubic-bezier(0, 0, 0.2, 1);
  color: rgba(212, 190, 152, 0.7);
}
row image.sidebar-icon:disabled {
  color: rgba(212, 190, 152, 0.3);
}

placessidebar.sidebar > viewport.frame {
  border-style: none;
  background-color: transparent;
}
placessidebar.sidebar list {
  padding: 1px 0 4px;
}
placessidebar.sidebar row {
  min-height: 32px;
  margin: -1px 4px;
  padding: 0;
  border-radius: 6px;
}
placessidebar.sidebar row > revealer {
  padding: 0 8px;
}
placessidebar.sidebar row:selected {
  color: #${palette[7]};
  font-weight: 500;
  background-color: rgba(138, 180, 248, 0.16);
}
placessidebar.sidebar row:selected:drop(active), placessidebar.sidebar row:selected:hover {
  background-color: rgba(138, 180, 248, 0.2272);
}
placessidebar.sidebar row:selected:focus {
  background-color: rgba(138, 180, 248, 0.2608);
}
placessidebar.sidebar row:selected:active {
  background-image: radial-gradient(circle, rgba(138, 180, 248, 0.16) 10%, transparent 0%);
}
placessidebar.sidebar row:selected image.sidebar-icon {
  color: #${palette[7]};
}
placessidebar.sidebar row:disabled {
  color: rgba(212, 190, 152, 0.5);
}
placessidebar.sidebar row image.sidebar-icon:dir(ltr) {
  padding-right: 8px;
}
placessidebar.sidebar row image.sidebar-icon:dir(rtl) {
  padding-left: 8px;
}
placessidebar.sidebar row label.sidebar-label:dir(ltr) {
  padding-right: 2px;
}
placessidebar.sidebar row label.sidebar-label:dir(rtl) {
  padding-left: 2px;
}
placessidebar.sidebar row.sidebar-placeholder-row {
  background-color: rgba(212, 190, 152, 0.08);
}
placessidebar.sidebar row.sidebar-new-bookmark-row {
  color: #${palette[7]};
}
placessidebar.sidebar row.sidebar-new-bookmark-row image.sidebar-icon {
  color: #${palette[7]};
}

placesview .server-list-button > image {
  -gtk-icon-transform: rotate(-0.5turn);
}
placesview .server-list-button:checked > image {
  -gtk-icon-transform: rotate(0turn);
}
placesview > actionbar > revealer > box > label {
  padding-left: 8px;
  padding-right: 8px;
}

/**
 * Paned
 */
paned > separator {
  min-width: 1px;
  min-height: 1px;
  -gtk-icon-source: none;
  border-style: none;
  background-color: transparent;
  background-image: image(rgba(212, 190, 152, 0.2));
  background-size: 1px 1px;
  background-clip: content-box;
}
paned > separator.wide {
  min-width: 6px;
  min-height: 6px;
  background-image: image(rgba(212, 190, 152, 0.2)), image(rgba(212, 190, 152, 0.2));
  background-size: 1px 1px, 1px 1px;
}
paned.horizontal > separator {
  background-repeat: repeat-y;
}
paned.horizontal > separator:dir(ltr) {
  margin: 0 -8px 0 0;
  padding: 0 8px 0 0;
  background-position: left;
}
paned.horizontal > separator:dir(rtl) {
  margin: 0 0 0 -8px;
  padding: 0 0 0 8px;
  background-position: right;
}
paned.horizontal > separator.wide {
  margin: 0;
  padding: 0;
  background-repeat: repeat-y, repeat-y;
  background-position: left, right;
}
paned.vertical > separator {
  margin: 0 0 -8px 0;
  padding: 0 0 8px 0;
  background-repeat: repeat-x;
  background-position: top;
}
paned.vertical > separator.wide {
  margin: 0;
  padding: 0;
  background-repeat: repeat-x, repeat-x;
  background-position: bottom, top;
}

/**
 * GtkInfoBar
 */
infobar {
  border-style: none;
}
infobar.action:hover > revealer > box {
  background-image: image(rgba(212, 190, 152, 0.08));
}
infobar.info > revealer > box, infobar.question > revealer > box {
  border-bottom: 1px solid rgba(212, 190, 152, 0.2);
}
infobar.info > revealer > box button.text-button:not(:disabled), infobar.question > revealer > box button.text-button:not(:disabled) {
  color: #${palette[7]};
  box-shadow: none;
  background-color: transparent;
}
infobar.info > revealer > box button.text-button:not(:disabled):drop(active), infobar.info > revealer > box button.text-button:not(:disabled):hover, infobar.question > revealer > box button.text-button:not(:disabled):drop(active), infobar.question > revealer > box button.text-button:not(:disabled):hover {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.12);
}
infobar.info > revealer > box button.text-button:not(:disabled):focus, infobar.question > revealer > box button.text-button:not(:disabled):focus {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.12);
}
infobar.info > revealer > box button.text-button:not(:disabled):active, infobar.question > revealer > box button.text-button:not(:disabled):active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(138, 180, 248, 0.16) 10%, transparent 0%);
}
infobar.warning > revealer > box {
  background-color: #${palette[5]};
  color: #${palette[0]};
}
infobar.warning > revealer > box button.flat {
  color: #${palette[0]};
  box-shadow: none;
  background-color: transparent;
}
infobar.warning > revealer > box button.flat:drop(active), infobar.warning > revealer > box button.flat:hover {
  box-shadow: none;
  background-color: rgba(0, 0, 0, 0.08);
}
infobar.warning > revealer > box button.flat:focus {
  box-shadow: none;
  background-color: rgba(0, 0, 0, 0.08);
}
infobar.warning > revealer > box button.flat:active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(0, 0, 0, 0.12) 10%, transparent 0%);
}
infobar.warning > revealer > box *:link {
  color: #${palette[0]};
}
infobar.error > revealer > box {
  background-color: #${palette[4]};
  color: #${palette[2]}
}
infobar.error > revealer > box button.flat {
  color: #${palette[2]}
  box-shadow: none;
  background-color: transparent;
}
infobar.error > revealer > box button.flat:drop(active), infobar.error > revealer > box button.flat:hover {
  box-shadow: none;
  background-color: rgba(255, 255, 255, 0.08);
}
infobar.error > revealer > box button.flat:focus {
  box-shadow: none;
  background-color: rgba(255, 255, 255, 0.08);
}
infobar.error > revealer > box button.flat:active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(255, 255, 255, 0.12) 10%, transparent 0%);
}
infobar.error > revealer > box *:link {
  color: #${palette[2]}
}
infobar button label {
  margin: 0 -4px;
}

/**
 * Tooltips
 */
tooltip {
  border-radius: 6px;
  box-shadow: none;
}
tooltip.background {
  background-color: rgba(50, 48, 47, 0.9);
  color: #${palette[2]};
}
tooltip decoration {
  background-color: transparent;
}
tooltip > box {
  margin: -6px;
  min-height: 24px;
  padding: 4px 8px;
}
tooltip .dim-label {
  color: rgba(221, 199, 161, 0.7);
}
/**
 * Color Chooser
 */
colorswatch.top {
  border-top-left-radius: 6.5px;
  border-top-right-radius: 6.5px;
}
colorswatch.top overlay {
  border-top-left-radius: 6px;
  border-top-right-radius: 6px;
}
colorswatch.bottom {
  border-bottom-left-radius: 6.5px;
  border-bottom-right-radius: 6.5px;
}
colorswatch.bottom overlay {
  border-bottom-left-radius: 6px;
  border-bottom-right-radius: 6px;
}
colorswatch.left, colorswatch:first-child:not(.top) {
  border-top-left-radius: 6.5px;
  border-bottom-left-radius: 6.5px;
}
colorswatch.left overlay, colorswatch:first-child:not(.top) overlay {
  border-top-left-radius: 6px;
  border-bottom-left-radius: 6px;
}
colorswatch.right, colorswatch:last-child:not(.bottom) {
  border-top-right-radius: 6.5px;
  border-bottom-right-radius: 6.5px;
}
colorswatch.right overlay, colorswatch:last-child:not(.bottom) overlay {
  border-top-right-radius: 6px;
  border-bottom-right-radius: 6px;
}
colorswatch.dark {
  color: #${palette[2]}
}
colorswatch.light {
  color: #${palette[0]};
}
colorswatch overlay {
  transition: box-shadow 75ms cubic-bezier(0, 0, 0.2, 1);
  box-shadow: 0 2px 2px -2px rgba(0, 0, 0, 0.3), 0 1px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 2px -0.6px rgba(0, 0, 0, 0.17);
}
colorswatch overlay:drop(active), colorswatch overlay:hover {
  box-shadow: 0 3px 2px -2px rgba(0, 0, 0, 0.2), 0 3px 2.4px 0 rgba(0, 0, 0, 0.14), 0 1px 4.8px 0 rgba(0, 0, 0, 0.12);
}
colorswatch#add-color-button {
  border-radius: 6px 6px 0 0;
  color: #${palette[2]};
}
colorswatch#add-color-button:only-child {
  border-radius: 6px;
}
colorswatch#add-color-button overlay {
  background-color: #${palette[1]};
}
colorswatch:disabled {
  opacity: 0.5;
}
colorswatch:disabled overlay {
  box-shadow: none;
}
colorswatch#editor-color-sample {
  border-radius: 6.5px;
}
colorswatch#editor-color-sample overlay {
  border-radius: 6px;
}
colorchooser .popover.osd {
  transition: box-shadow 75ms cubic-bezier(0, 0, 0.2, 1);
  border-radius: 6px;
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2), 0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12), inset 0 1px rgba(255, 255, 255, 0.05);
  background-color: #${palette[1]};
}
colorchooser .popover.osd:backdrop {
  box-shadow: 0 3px 2px -3px rgba(0, 0, 0, 0.3), 0 2px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 3px 0 rgba(0, 0, 0, 0.12), inset 0 1px rgba(255, 255, 255, 0.05);
}

/**
 * Misc
 */
/**
 * Window Decorations
 */
decoration {
  transition: box-shadow 75ms cubic-bezier(0, 0, 0.2, 1);
  border-radius: 6px 6px 0 0;
  box-shadow: 0 8px 6px -5px rgba(0, 0, 0, 0.2), 0 16px 14.4px 2px rgba(0, 0, 0, 0.14), 0 6px 18px 5px rgba(0, 0, 0, 0.12), 0 16px 14.4px 2px transparent, 0 6px 18px 5px transparent;
  margin: 8px;
}
decoration:backdrop {
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2), 0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12), 0 16px 14.4px 2px transparent, 0 6px 18px 5px transparent;
}
.maximized decoration, .fullscreen decoration, .tiled decoration, .tiled-top decoration, .tiled-right decoration, .tiled-bottom decoration, .tiled-left decoration {
  border-radius: 0;
}
.popup decoration {
  box-shadow: none;
}
.ssd decoration {
  box-shadow: 0 3px 3px rgba(0, 0, 0, 0.16);
}
.csd.popup decoration {
  border-radius: 6px;
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2), 0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12);
}
tooltip.csd decoration {
  border-radius: 6px;
  box-shadow: none;
}
messagedialog.csd decoration {
  border-radius: 6px;
}
.solid-csd decoration {
  margin: 0;
  padding: 2px;
  border-radius: 0;
  box-shadow: none;
  box-shadow: inset 0 1px rgba(255, 255, 255, 0.05);
  background-color: #${palette[0]};
}
.solid-csd decoration:backdrop {
  background-color: #${palette[0]};
}

button.titlebutton {
  border-radius: 9999px;
}
.monospace {
  font-family: monospace;
}

/**
 * Touch Copy & Paste
 */
cursor-handle {
  color: #${palette[7]};
  -gtk-icon-source: -gtk-recolor(url("icons/cursor-handle-symbolic.svg"));
}
cursor-handle.top:dir(ltr), cursor-handle.bottom:dir(rtl) {
  -gtk-icon-transform: rotate(90deg);
}
cursor-handle.bottom:dir(ltr), cursor-handle.top:dir(rtl) {
  -gtk-icon-transform: unset;
}
cursor-handle.insertion-cursor:dir(ltr), cursor-handle.insertion-cursor:dir(rtl) {
  padding-top: 6px;
  -gtk-icon-transform: rotate(45deg);
}

.context-menu {
  font: initial;
}

.keycap {
  min-width: 12px;
  min-height: 28px;
  padding-left: 8px;
  padding-right: 8px;
  border-radius: 6px;
  box-shadow: 0 2px 2px -2px rgba(0, 0, 0, 0.3), 0 1px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 2px -0.6px rgba(0, 0, 0, 0.17);
  background-color: #${palette[1]};
  color: #${palette[2]};
  font-size: smaller;
}

shortcut:last-child {
  margin-bottom: 4px;
}

stackswitcher button.text-button {
  min-width: 100px;
}

stackswitcher button.circular,
stackswitcher button.text-button.circular {
  min-width: 32px;
  min-height: 32px;
  padding: 0;
}

/**
 * App Icons
 */
/**
 * Emoji
 */
popover.emoji-picker {
  padding: 0;
}
popover.emoji-picker entry {
  border-bottom: 1px solid rgba(212, 190, 152, 0.2);
  border-image: none;
  border-radius: 0;
  box-shadow: none;
  background-color: transparent;
}
popover.emoji-picker scrolledwindow {
  border-bottom: 1px solid rgba(212, 190, 152, 0.2);
}

button.emoji-section {
  margin: 4px;
}
button.emoji-section:not(:last-child) {
  margin-right: 0;
}

popover.emoji-picker .emoji {
  min-width: 3em;
  min-height: 3em;
  padding: 0 8px;
}
popover.emoji-picker .emoji widget {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
  border-radius: 6px;
}
popover.emoji-picker .emoji widget:hover {
  background-color: rgba(212, 190, 152, 0.08);
}

popover.emoji-completion {
  padding: 8px 0;
}
popover.emoji-completion arrow {
  border: none;
  background: none;
}
popover.emoji-completion .emoji-completion-row {
  min-height: 28px;
  padding: 0 12px;
}
popover.emoji-completion .emoji:hover {
  background-color: rgba(212, 190, 152, 0.08);
}

/**
 * libhandy
 */
popover.combo {
  padding: 8px 0;
}
popover.combo list {
  border-style: none;
  background-color: transparent;
}
popover.combo list > row {
  min-height: 32px;
  padding: 0 12px;
}
keypad .digit {
  font-size: 200%;
  font-weight: bold;
}
keypad .letters {
  font-size: 70%;
}
keypad .symbol {
  font-size: 160%;
}

viewswitcher button {
  margin: 0;
  padding: 0;
  border-radius: 0;
}
viewswitcher button > stack > box.narrow image,
viewswitcher button > stack > box.narrow label {
  padding-left: 8px;
  padding-right: 8px;
}
viewswitcher button > stack > box.wide {
  padding: 8px 12px;
}
viewswitcher button > stack > box.wide label:dir(ltr) {
  padding-right: 8px;
}
viewswitcher button > stack > box.wide label:dir(rtl) {
  padding-left: 8px;
}
list.content {
  border: 1px solid rgba(212, 190, 152, 0.2);
  background-clip: padding-box;
  background-color: #${palette[0]};
}
list.content > row:not(:first-child) {
  border-top: 1px solid rgba(212, 190, 152, 0.2);
}
window.csd.unified:not(.solid-csd):not(.maximized):not(.fullscreen):not(.tiled):not(.tiled-top):not(.tiled-bottom):not(.tiled-left):not(.tiled-right) headerbar {
  box-shadow: 0 2px 2px -2px rgba(0, 0, 0, 0.3), 0 1px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 2px -0.6px rgba(0, 0, 0, 0.17);
}
window.csd.unified:not(.solid-csd):not(.maximized):not(.fullscreen):not(.tiled):not(.tiled-top):not(.tiled-bottom):not(.tiled-left):not(.tiled-right) > decoration-overlay {
  box-shadow: inset 0 1px rgba(255, 255, 255, 0.05);
}
window.csd.unified:not(.solid-csd):not(.maximized):not(.fullscreen):not(.tiled):not(.tiled-top):not(.tiled-bottom):not(.tiled-left):not(.tiled-right),
window.csd.unified:not(.solid-csd):not(.maximized):not(.fullscreen):not(.tiled):not(.tiled-top):not(.tiled-bottom):not(.tiled-left):not(.tiled-right) > decoration,
window.csd.unified:not(.solid-csd):not(.maximized):not(.fullscreen):not(.tiled):not(.tiled-top):not(.tiled-bottom):not(.tiled-left):not(.tiled-right) > decoration-overlay {
  border-radius: 6px;
}

/**
 * Nautilus
 */
.nautilus-canvas-item.dim-label,
.nautilus-list-dim-label {
  color: rgba(212, 190, 152, 0.7);
}

@keyframes nautilus-operations-button-needs-attention {
  to {
    background-color: rgba(221, 199, 161, 0.08);
  }
}
.nautilus-operations-button-needs-attention {
  animation: nautilus-operations-button-needs-attention 300ms cubic-bezier(0.4, 0, 0.2, 1) 2 alternate;
}

.nautilus-operations-button-needs-attention-multiple {
  animation: nautilus-operations-button-needs-attention 300ms cubic-bezier(0.4, 0, 0.2, 1) 6 alternate;
}

.linked:not(.vertical) > button:not(.suggested-action):not(.destructive-action):not(:only-child).disclosure-button {
  border-radius: 9999px;
}

.path-bar-box {
  transition: background-color 75ms cubic-bezier(0, 0, 0.2, 1);
  margin: 4px 0;
  border-radius: 6px;
}
.path-bar-box button {
  margin: 0;
}
.path-bar-box.width-maximized {
  background-color: rgba(221, 199, 161, 0.04);
}
.path-bar-box.background.frame {
  border-style: none;
  background-color: rgba(221, 199, 161, 0.04);
}
.path-bar-box .path-bar button label:not(:only-child):first-child {
  margin-left: 0;
}
.path-bar-box .path-bar button label:not(:only-child):last-child {
  margin-right: 0;
}
.path-bar-box .nautilus-path-bar button:not(.suggested-action):not(.destructive-action) {
  padding-left: 4px;
  padding-right: 4px;
}
.path-bar-box .nautilus-path-bar button:not(.suggested-action):not(.destructive-action).text-button {
  min-width: 0;
}
.path-bar-box .nautilus-path-bar button:not(.suggested-action):not(.destructive-action) label:not(:only-child):first-child {
  margin-left: 0;
}
.path-bar-box .nautilus-path-bar button:not(.suggested-action):not(.destructive-action) label:not(:only-child):last-child {
  margin-right: 0;
}
.path-bar-box .nautilus-path-bar button:not(.suggested-action):not(.destructive-action).text-button.image-button image:not(:only-child) {
  margin: 0;
}
.nautilus-window .floating-bar {
  min-height: 32px;
  padding: 0;
  border-style: solid solid none;
  border-width: 1px;
  border-color: rgba(212, 190, 152, 0.2);
  border-radius: 7px 7px 0 0;
  background-clip: padding-box;
  background-color: #${palette[1]};
}
.nautilus-window .floating-bar.bottom.left {
  margin-right: 7px;
  border-left-style: none;
  border-top-left-radius: 0;
}
.nautilus-window .floating-bar.bottom.right {
  margin-left: 7px;
  border-right-style: none;
  border-top-right-radius: 0;
}
.nautilus-window .floating-bar button {
  margin: 4px;
}

.disk-space-display.unknown {
  background-color: rgba(212, 190, 152, 0.3);
  color: rgba(212, 190, 152, 0.3);
}
.disk-space-display.used {
  background-color: #${palette[7]};
  color: #${palette[7]};
}
.disk-space-display.free {
  background-color: rgba(212, 190, 152, 0.08);
  color: rgba(212, 190, 152, 0.08);
}

.nautilus-empty-state-icon + .large-title {
  color: rgba(212, 190, 152, 0.7);
}

.search-information {
  padding: 2px;
  border-bottom: 1px solid rgba(212, 190, 152, 0.2);
}

.conflict-row:not(:selected) {
  background-color: #${palette[5]};
}

.nautilus-window flowboxchild .icon-item-background {
  padding: 4px;
  border-radius: 6px;
}
.nautilus-window flowboxchild:selected {
  background-color: transparent;
}
.nautilus-window flowboxchild:selected .icon-item-background {
  background-color: rgba(138, 180, 248, 0.6);
}

dialog.background > box.dialog-vbox.vertical > grid.horizontal > scrolledwindow.frame {
  border-style: none;
}
dialog.background > box.dialog-vbox.vertical > grid.horizontal > box.horizontal:last-child {
  margin: -6px 0 0 -6px;
  border-top: 1px solid rgba(212, 190, 152, 0.2);
}
dialog.background > box.dialog-vbox.vertical > grid.horizontal > box.horizontal:last-child > label {
  margin: 0 8px;
}
dialog.background > box.dialog-vbox.vertical > grid.horizontal > box.horizontal:last-child > box > button {
  border-radius: 0;
}

.nautilus-window > popover.menu:not(:last-child) {
  padding: 3px;
}
.nautilus-window > popover.menu:not(:last-child) > stack > box > box > box {
  margin-top: -6px;
}
.nautilus-window > popover.menu:not(:last-child) > stack > box > box > box > box {
  margin-bottom: -6px;
}
.nautilus-window > popover.menu:not(:last-child) > stack > box > box > box > box.linked {
  margin-top: 1px;
}
.nautilus-window > popover.menu:not(:last-child) separator {
  margin-bottom: -2px;
}

.nautilus-menu-sort-heading {
  margin: 1px 3px;
  font-weight: 500;
}
.nautilus-menu-sort-heading:disabled {
  color: rgba(212, 190, 152, 0.7);
}

.nautilus-window headerbar revealer > button {
  border-radius: 9999px;
}

.nautilus-window paned > separator {
  background-color: #${palette[0]};
}

/**
 * gedit
 */
.open-document-selector-path-label {
  color: rgba(212, 190, 152, 0.7);
  font-size: smaller;
}

.open-document-selector-match {
  background-color: #${palette[5]};
  color: #${palette[0]};
}

.gedit-document-panel row button.flat {
  margin-top: 8px;
  margin-bottom: 8px;
}

.gedit-document-panel-group-row:not(:first-child) {
  border-top: 1px solid rgba(212, 190, 152, 0.2);
}

.gedit-side-panel-paned statusbar {
  border-top: 1px solid rgba(212, 190, 152, 0.2);
}

.gedit-search-slider {
  margin: 4px 4px 8px;
}
.gedit-search-slider .linked:not(.vertical) > entry {
  border-radius: 6px;
}
.gedit-search-slider .linked:not(.vertical) > entry .gedit-search-entry-occurrences-tag {
  all: unset;
  color: rgba(212, 190, 152, 0.7);
}
.gedit-search-slider .linked:not(.vertical) > entry:dir(ltr) {
  margin-right: -60px;
  padding-right: 60px;
}
.gedit-search-slider .linked:not(.vertical) > entry:dir(ltr) .gedit-search-entry-occurrences-tag {
  margin-left: 4px;
}
.gedit-search-slider .linked:not(.vertical) > entry:dir(ltr) image.right {
  margin-right: 0;
}
.gedit-search-slider .linked:not(.vertical) > entry:dir(rtl) {
  margin-left: -60px;
  padding-left: 60px;
}
.gedit-search-slider .linked:not(.vertical) > entry:dir(rtl) .gedit-search-entry-occurrences-tag {
  margin-right: 4px;
}
.gedit-search-slider .linked:not(.vertical) > entry:dir(rtl) image.left {
  margin-left: 0;
}
.gedit-search-slider .linked:not(.vertical) > entry:not(.error) {
  background-color: #${palette[1]};
}
.gedit-search-slider .linked:not(.vertical) > entry.error ~ button {
  color: rgba(255, 255, 255, 0.7);
  box-shadow: none;
  background-color: transparent;
}
.gedit-search-slider .linked:not(.vertical) > entry.error ~ button:drop(active), .gedit-search-slider .linked:not(.vertical) > entry.error ~ button:hover {
  box-shadow: none;
  background-color: rgba(255, 255, 255, 0.08);
}
.gedit-search-slider .linked:not(.vertical) > entry.error ~ button:focus {
  box-shadow: none;
  background-color: rgba(255, 255, 255, 0.08);
}
.gedit-search-slider .linked:not(.vertical) > entry.error ~ button:active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(255, 255, 255, 0.12) 10%, transparent 0%);
}
.gedit-search-slider .linked:not(.vertical) > entry.error ~ button:disabled {
  color: rgba(255, 255, 255, 0.3);
}
.gedit-search-slider .linked:not(.vertical) > button {
  border: solid 4px transparent;
  border-radius: 9999px;
  background-clip: padding-box;
}
.gedit-search-slider .linked:not(.vertical) > button:last-child:dir(ltr), .gedit-search-slider .linked:not(.vertical) > button:not(:first-child):dir(rtl) {
  margin-left: -2px;
}
.gedit-search-slider .linked:not(.vertical) > button:first-child:dir(rtl), .gedit-search-slider .linked:not(.vertical) > button:not(:last-child):dir(ltr) {
  margin-right: -2px;
}

frame.gedit-map-frame > border:dir(ltr) {
  border-style: none none none solid;
}
frame.gedit-map-frame > border:dir(rtl) {
  border-style: none solid none none;
}

/**
 * Tweaks
 */
.tweak-categories {
  background-image: image(#${palette[0]});
}
.tweak {
  padding: 3px;
}
.tweak.title:hover {
  box-shadow: none;
}

.tweak-group-white,
.tweak-white,
.tweak-white:hover {
  background-image: image(#${palette[0]});
}

.tweak-startup,
.tweak-startup:hover {
  background-image: image(#${palette[0]});
}

.tweak-group-startup {
  border: 1px solid rgba(212, 190, 152, 0.2);
  background-clip: padding-box;
  background-image: image(#${palette[0]});
}

row#Focus,
row#ClickMethod,
row#StaticWorkspaceTweak,
row#dynamic-workspaces,
row#PrimaryWorkspaceTweak,
row#workspaces-only-on-primary {
  padding: 0;
  border: 1px solid rgba(212, 190, 152, 0.2);
  background-clip: padding-box;
  background-image: image(#${palette[0]});
}
row#Focus row:not(:last-child),
row#ClickMethod row:not(:last-child),
row#StaticWorkspaceTweak row:not(:last-child),
row#dynamic-workspaces row:not(:last-child),
row#PrimaryWorkspaceTweak row:not(:last-child),
row#workspaces-only-on-primary row:not(:last-child) {
  border-bottom: 1px solid rgba(212, 190, 152, 0.2);
}
row#Focus.tweak > list,
row#ClickMethod.tweak > list,
row#StaticWorkspaceTweak.tweak > list,
row#dynamic-workspaces.tweak > list,
row#PrimaryWorkspaceTweak.tweak > list,
row#workspaces-only-on-primary.tweak > list {
  margin-top: -3px;
}

row#Focus,
row#ClickMethod,
row#PrimaryWorkspaceTweak,
row#workspaces-only-on-primary {
  margin-top: 4px;
}

leaflet.titlebar > .titlebar.tweak-titlebar-left,
leaflet.titlebar > .titlebar.tweak-titlebar-right,
hdyleaflet.titlebar > .titlebar.tweak-titlebar-left,
hdyleaflet.titlebar > .titlebar.tweak-titlebar-right {
  background-color: #${palette[1]};
  box-shadow: inherit;
  transition: color 75ms cubic-bezier(0, 0, 0.2, 1);
}
leaflet.titlebar > .titlebar.tweak-titlebar-left + separator,
leaflet.titlebar > .titlebar.tweak-titlebar-right + separator,
hdyleaflet.titlebar > .titlebar.tweak-titlebar-left + separator,
hdyleaflet.titlebar > .titlebar.tweak-titlebar-right + separator {
  background-color: #${palette[1]};
  background-image: image(rgba(221, 199, 161, 0.2));
}

/**
 * Builder
 */
layouttabbar {
  border-bottom: 1px solid rgba(212, 190, 152, 0.2);
  background-color: #${palette[0]};
}
layouttabbar > box > button {
  margin: 4px 0;
}

layouttab {
  margin: 0 8px;
  border-style: none solid;
  border-width: 1px;
  border-color: rgba(212, 190, 152, 0.2);
  box-shadow: inset 0 -2px #${palette[7]};
  background-color: #${palette[0]};
}
layouttab separator.vertical {
  margin: 8px 4px;
}
layouttab button, layouttab button.text-button, layouttab button.image-button {
  margin-top: 8px;
  margin-bottom: 8px;
  padding: 0 4px;
}
layout {
  border: 1px solid rgba(212, 190, 152, 0.2);
  -PnlDockBin-handle-size: 1;
}

entry.search-missing {
  background-color: #${palette[4]};
  color: #${palette[2]}
}

window.workbench treeview.image {
  color: rgba(212, 190, 152, 0.7);
}

popover.popover-selector list {
  padding: 6px;
}
popover.popover-selector list row {
  border-radius: 6px;
}
popover.popover-selector list row image:dir(ltr) {
  margin-right: 6px;
}
popover.popover-selector list row image:dir(rtl) {
  margin-left: 6px;
}
popover.popover-selector list row .accel:dir(ltr) {
  margin-left: 6px;
}
popover.popover-selector list row .accel:dir(rtl) {
  margin-right: 6px;
}

omnibar.linked:not(.vertical) entry {
  border-radius: 6px;
}
omnibar entry {
  color: rgba(212, 190, 152, 0.7);
}

popover.omnibar list row:not(:last-child) {
  border-bottom: 1px solid rgba(212, 190, 152, 0.2);
}

entry.preferences-search {
  border-bottom: 1px solid rgba(212, 190, 152, 0.2);
  box-shadow: none;
  background-color: transparent;
}
preferences stacksidebar.sidebar:dir(ltr) list, preferences stacksidebar.sidebar:dir(rtl) list {
  border-style: none;
}
preferences > box > box:dir(ltr) {
  border-right: 1px solid rgba(212, 190, 152, 0.2);
}
preferences > box > box:dir(rtl) {
  border-left: 1px solid rgba(212, 190, 152, 0.2);
}

popover.messagepopover.background {
  padding: 0;
}
popover.messagepopover .popover-action-area button {
  padding: 8px 16px;
  border-top: 1px solid rgba(212, 190, 152, 0.2);
  border-radius: 0;
}
popover.messagepopover .popover-action-area button:first-child {
  border-bottom-left-radius: 6px;
}
popover.messagepopover .popover-action-area button:last-child {
  border-bottom-right-radius: 6px;
}
popover.messagepopover .popover-content-area {
  margin: 16px;
}

popover.transfers list {
  background-color: transparent;
}
popover.transfers list row:not(:first-child) {
  border-top: 1px solid rgba(212, 190, 152, 0.2);
}
popover.transfers list row > box {
  padding: 10px;
}

dockbin {
  border: 1px solid rgba(212, 190, 152, 0.2);
  -PnlDockBin-handle-size: 1;
}

dockpaned {
  border: 1px solid rgba(212, 190, 152, 0.2);
}

eggsearchbar box.search-bar {
  padding: 0 8px;
  border-bottom: 1px solid rgba(212, 190, 152, 0.2);
  background-color: #${palette[0]};
}

docktabstrip {
  padding: 0 8px;
  border-bottom: 1px solid rgba(212, 190, 152, 0.2);
  background-color: #${palette[0]};
}

docktab {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1), background-size 0ms, background-image 0ms;
  min-height: 24px;
  min-width: 24px;
  margin-bottom: -1px;
  padding: 4px 6px;
  border-width: 1px;
  border-color: transparent;
  box-shadow: inset 0 -2px transparent;
  background-image: radial-gradient(circle, #${palette[7]} 10%, transparent 0%);
  background-repeat: no-repeat;
  background-position: center;
  background-size: 0% 0%;
  color: rgba(212, 190, 152, 0.7);
  font-weight: 500;
}
docktab:hover {
  background-color: rgba(212, 190, 152, 0.08);
}
docktab:checked {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1), background-size 225ms cubic-bezier(0, 0, 0.2, 1), background-image 525ms cubic-bezier(0, 0, 0.2, 1);
  box-shadow: inset 0 -2px #${palette[7]};
  background-color: transparent;
  background-image: radial-gradient(circle, transparent 10%, transparent 0%);
  background-size: 1000% 1000%;
  color: #${palette[2]};
}

dockoverlayedge {
  background-color: #${palette[0]};
}
dockoverlayedge docktabstrip {
  padding: 0;
  border: none;
}
dockoverlayedge.left-edge docktab:checked {
  box-shadow: inset -2px 0 #${palette[7]};
}
dockoverlayedge.right-edge docktab:checked {
  box-shadow: inset 2px 0 #${palette[7]};
}

pillbox {
  background-color: #${palette[0]};
  border-radius: 6px;
}

layoutpane entry.search {
  border-bottom: 1px solid rgba(212, 190, 152, 0.2);
  box-shadow: none;
  background-color: #${palette[0]};
}

editortweak entry.search {
  margin-bottom: -1px;
  box-shadow: none;
  background-color: transparent;
}

.gb-search-entry-occurrences-tag {
  box-shadow: none;
  background-color: transparent;
}

docktabstrip {
  min-height: 39px;
}

window.workbench preferences preferencesgroup list entry {
  padding-top: 8px;
  padding-bottom: 8px;
}

button.run-arrow-button {
  padding-left: 8px;
  padding-right: 8px;
}

button.dzlmenubutton image {
  min-width: 26px;
}
button.dzlmenubutton image.arrow {
  min-width: 23px;
}

button.dzlmenubuttonitem {
  color: #${palette[2]};
  font-weight: normal;
}
button.dzlmenubuttonitem:disabled {
  color: rgba(212, 190, 152, 0.5);
}

idelayoutstackheader {
  border-bottom: 1px solid rgba(212, 190, 152, 0.2);
}
idelayoutstackheader button:checked {
  color: #${palette[2]};
}

ideeditorutilities > dzldockpaned > box > stackswitcher {
  padding: 8px 0;
  background-color: #${palette[0]};
}
ideeditorutilities > dzldockpaned > box > stackswitcher:dir(ltr) {
  border-right: 1px solid rgba(212, 190, 152, 0.2);
}
ideeditorutilities > dzldockpaned > box > stackswitcher:dir(rtl) {
  border-left: 1px solid rgba(212, 190, 152, 0.2);
}
ideeditorutilities > dzldockpaned > box > stackswitcher button {
  border-radius: 0;
  box-shadow: none;
  background-color: transparent;
}
ideeditorutilities > dzldockpaned > box > stackswitcher button:active {
  background-image: radial-gradient(circle, rgba(138, 180, 248, 0.7) 10%, transparent 0%);
}
ideeditorutilities > dzldockpaned > box > stackswitcher button:checked {
  background-color: transparent;
  color: #${palette[2]};
}
ideeditorutilities > dzldockpaned > box > stackswitcher button:dir(ltr) {
  margin-right: -1px;
}
ideeditorutilities > dzldockpaned > box > stackswitcher button:dir(ltr):checked {
  box-shadow: inset -2px 0 #${palette[7]};
}
ideeditorutilities > dzldockpaned > box > stackswitcher button:dir(rtl) {
  margin-left: -1px;
}
ideeditorutilities > dzldockpaned > box > stackswitcher button:dir(rtl):checked {
  box-shadow: inset 2px 0 #${palette[7]};
}

ideeditorsidebar notebook header {
  background: transparent;
}

popover.messagepopover list {
  border: 1px solid rgba(212, 190, 152, 0.2);
  background-clip: padding-box;
}
popover.messagepopover list row:not(:last-child) {
  border-bottom: 1px solid rgba(212, 190, 152, 0.2);
}

dzlsuggestionpopover > revealer > box > elastic > scrolledwindow > viewport > list > row:selected {
  background-color: #${palette[7]};
  color: #${palette[0]};
}
#titlebar_container .suggestionbutton button {
  padding: 0;
  border-radius: 0;
  box-shadow: inset 0 0 0 9999px #${palette[0]};
}
#titlebar_container .suggestionbutton button:backdrop {
  box-shadow: inset 0 0 0 9999px #${palette[0]};
}
#titlebar_container .suggestionbutton button image {
  transition: box-shadow 75ms cubic-bezier(0, 0, 0.2, 1), background-color 225ms cubic-bezier(0, 0, 0.2, 1);
  min-width: 32px;
  min-height: 32px;
  border-radius: 9999px;
  box-shadow: inset 0 0 0 9999px transparent;
}
#titlebar_container .suggestionbutton button:hover image {
  box-shadow: inset 0 0 0 9999px rgba(221, 199, 161, 0.08);
}
#titlebar_container .suggestionbutton button:focus image {
  box-shadow: inset 0 0 0 9999px rgba(221, 199, 161, 0.08);
}
#titlebar_container .suggestionbutton button:active image {
  background-color: #${palette[0]};
}

/**
 * Photos
 */
GdMainIconView.content-view {
  -GdMainIconView-icon-size: 48;
}
.documents-counter {
  margin: 8px;
  border-radius: 9999px;
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2), 0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12);
  background-color: #${palette[7]};
  color: #${palette[0]};
  font-weight: bold;
}

.documents-scrolledwin.frame {
  border-style: none;
  background-color: transparent;
}
.documents-scrolledwin.frame frame.content-view > border {
  border-style: none;
  background-color: transparent;
}

.photos-fade-in {
  opacity: 1;
  transition: opacity 75ms cubic-bezier(0, 0, 0.2, 1);
}

.photos-fade-out {
  opacity: 0;
  transition: opacity 75ms cubic-bezier(0, 0, 0.2, 1);
}

button.photos-filter-preview {
  color: #${palette[2]};
  font-weight: normal;
}
button.photos-filter-preview:checked {
  background-color: rgba(138, 180, 248, 0.6);
  color: #${palette[2]};
}
button.photos-filter-preview:checked image {
  color: #${palette[2]}
  -gtk-icon-shadow: 0 1px 1px rgba(0, 0, 0, 0.2), 0 1px 2px rgba(0, 0, 0, 0.14), 0 1px 3px rgba(0, 0, 0, 0.12);
}

overlay grid.horizontal > revealer > scrolledwindow.frame {
  border-style: none;
  background-color: transparent;
}
overlay grid.horizontal > revealer > scrolledwindow.frame:dir(ltr) {
  border-left-style: solid;
}
overlay grid.horizontal > revealer > scrolledwindow.frame:dir(rtl) {
  border-right-style: solid;
}

/**
 * Music
 */
.side-panel:dir(ltr) {
  border-style: solid;
  border-color: rgba(212, 190, 152, 0.2);
}

.side-panel:dir(rtl) {
  border-style: solid;
  border-color: rgba(212, 190, 152, 0.2);
}

.side-panel .view {
  background-image: image(#${palette[0]});
}
.side-panel .view:hover {
  background-image: image(#${palette[1]});
}

.side-panel .view:selected {
  background-image: image(#${palette[7]});
}
.side-panel .view:selected:hover {
  background-image: image(#${palette[7]});
}

.songs-list:hover {
  background-image: image(rgba(212, 190, 152, 0.08));
}

frame.documents-dropdown {
  margin: 8px;
}
frame.documents-dropdown > border {
  border: none;
}

box.vertical > revealer > toolbar.search-bar {
  border-bottom: 1px solid rgba(212, 190, 152, 0.2);
}
box.vertical > revealer > toolbar.search-bar button > widget {
  -gtk-icon-source: -gtk-icontheme("pan-down-symbolic");
}

/**
 * Terminal
 */
terminal-window notebook > header > box {
  margin: -2px;
}
terminal-window notebook > header > box button {
  border-radius: 0;
}

/**
 * To Do
 */
task-list-view taskrow {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
  margin: 0 -8px;
}
task-list-view taskrow:hover {
  transition: none;
}
task-list-view taskrow label {
  margin: 0 8px;
}
task-list-view taskrow image.dim-label {
  min-width: 16px;
}
task-list-view > box > revealer > box > button {
  margin: -4px;
}
task-list-view > box > revealer > box > button .dim-label {
  color: inherit;
}

tasklistview taskrow {
  outline: none;
}
tasklistview taskrow entry, tasklistview taskrow entry:focus, tasklistview taskrow entry:disabled {
  box-shadow: none;
}
tasklistview taskrow image.dim-label {
  min-width: 16px;
}
tasklistview > box > revealer > box > button {
  margin: -4px;
}
tasklistview > box > revealer > box > button .dim-label {
  color: inherit;
}

/**
 * eog
 */
#eog-thumb-nav scrolledwindow.frame {
  border-top: none;
}

/**
 * Evolution
 */
frame.taskbar > border {
  border-style: solid none none;
}

box.vertical > paned.horizontal notebook widget .frame {
  border-style: none;
}

/**
 * gitg
 */
frame.commit-frame > border {
  border-style: solid none none;
}

/**
 * Characters
 */
box.dialog-vbox scrolledwindow.related {
  border: 1px solid rgba(212, 190, 152, 0.2);
  background-clip: padding-box;
  background-color: #${palette[0]};
}

list.categories {
  background-image: image(#${palette[0]});
}

/**
 * Boxes
 */
.transparent-bg + stack overlay > label {
  min-height: 24px;
  padding: 0 4px;
  border-radius: 6px;
  background-color: black;
  color: rgba(255, 255, 255, 0.87);
}

/**
 * Evince
 */
evview.content-view.view:selected {
  background-color: #${palette[7]};
  color: #${palette[0]};
}

/**
 * Polari
 */
.polari-room-list row:selected {
  background-color: rgba(138, 180, 248, 0.5);
}

/**
 * Fractal
 */
button.osd.scroll_button {
  margin: 4px;
}

/**
 * Mines
 */
grid.minefield > button.tile {
  border-style: solid;
}

/**
 * Tilix
 */
overlay > revealer.left > scrolledwindow.frame, overlay > revealer.right > scrolledwindow.frame {
  border-style: none;
  box-shadow: 0 8px 6px -5px rgba(0, 0, 0, 0.2), 0 16px 14.4px 2px rgba(0, 0, 0, 0.14), 0 6px 18px 5px rgba(0, 0, 0, 0.12);
}
overlay > revealer.left > scrolledwindow.frame {
  margin-right: 32px;
}
overlay > revealer.right > scrolledwindow.frame {
  margin-left: 32px;
}

.terminix-session-sidebar,
.tilix-session-sidebar {
  background-image: image(#${palette[1]});
}

.terminal-titlebar button {
  border-radius: 0;
}

button.image-button.session-new-button {
  min-width: 28px;
}

notebook.tilix-background tab > box > stack {
  margin: -6px;
}

button.flat.tilix-small-button {
  min-height: 20px;
  min-width: 16px;
}

/**
 * Terminator
 */
.terminator-terminal-window paned > separator {
  background-color: #${palette[0]};
}
.terminator-terminal-window notebook.frame {
  border-style: none;
  background-color: transparent;
}

/**
 * Ubitquity
 */
#live_installer .menubar progressbar trough {
  border-radius: 4px;
  background-color: rgba(221, 199, 161, 0.2);
}

/**
 * Eclipse
 */
window.background > box.vertical > scrolledwindow > widget toolbar {
  padding: 2px;
}
window.background > box.vertical > scrolledwindow > widget toolbar separator,
window.background > box.vertical > scrolledwindow > widget toolbar button {
  margin: 2px;
}
window.background > box.vertical > scrolledwindow > widget toolbar button {
  border-radius: 6px;
}

/**
 * FileZilla
 */
window.background > box.vertical > widget > widget > widget > widget > widget > widget > widget > scrolledwindow > widget > entry {
  all: unset;
  padding: 5px;
  box-shadow: inset 0 0 0 1px rgba(138, 180, 248, 0.6);
  background-color: #${palette[0]};
}
window.background > box.vertical > widget > widget > widget > widget > widget > widget > widget > scrolledwindow > widget > widget > entry {
  all: unset;
  padding: 0 3px 1px;
  box-shadow: inset 0 0 0 1px rgba(138, 180, 248, 0.6);
  background-color: #${palette[0]};
}

/**
 * Chromium
 */
window.background.chromium {
  background-color: #${palette[1]};
}
window.background.chromium entry,
window.background.chromium > button {
  border: 1px solid rgba(212, 190, 152, 0.3);
}
window.background.chromium > button {
  color: #${palette[7]};
}
window.background.chromium > button:disabled {
  color: rgba(212, 190, 152, 0.3);
}
window.background.chromium menubar,
window.background.chromium headerbar {
  color: rgba(221, 199, 161, 0.7);
}
window.background.chromium headerbar button:active {
  background-color: rgba(221, 199, 161, 0.12);
}
window.background.chromium textview.view {
  background-color: transparent;
}
window.background.chromium treeview.view.cell:selected:focus {
  background-color: #${palette[7]};
  color: #${palette[0]};
}
window.background.chromium treeview.view button {
  border: 1px solid rgba(212, 190, 152, 0.3);
  background-color: #${palette[0]};
}

tooltip.background.chromium {
  background-color: #${palette[0]};
}

/**
 * Firefox
 */
#MozillaGtkWidget > widget text {
  background-color: #${palette[1]};
}
#MozillaGtkWidget > widget text:selected {
  background-color: #${palette[7]};
  color: #${palette[0]};
}
#MozillaGtkWidget > widget > separator {
  color: rgba(212, 190, 152, 0.2);
}
#MozillaGtkWidget > widget > frame > border {
  border-color: #${palette[3]};
}
#MozillaGtkWidget > widget > entry,
#MozillaGtkWidget > widget > button > button {
  border: 1px solid rgba(212, 190, 152, 0.3);
  border-radius: 6px;
  box-shadow: none;
}
#MozillaGtkWidget > widget > entry:disabled,
#MozillaGtkWidget > widget > button > button:disabled {
  border-color: rgba(212, 190, 152, 0.2);
}
#MozillaGtkWidget > widget > entry {
  min-height: 30px;
  background-color: #${palette[0]};
}
#MozillaGtkWidget > widget > entry:focus {
  border-color: #${palette[7]};
  box-shadow: inset 0 0 0 1px #${palette[7]};
}
#MozillaGtkWidget > widget > entry:disabled {
  background-color: #${palette[0]};
}
#MozillaGtkWidget > widget > button > button {
  padding: 4px 8px;
}
#MozillaGtkWidget > widget > button > button:active {
  background-size: 1000% 1000%;
}
#MozillaGtkWidget > widget > checkbutton > check,
#MozillaGtkWidget > widget > radiobutton > radio {
  margin: 0;
  padding: 0;
}
#MozillaGtkWidget > widget > checkbutton > check:not(:checked):not(:indeterminate),
#MozillaGtkWidget > widget > radiobutton > radio:not(:checked):not(:indeterminate) {
  color: #${palette[2]};
}
#MozillaGtkWidget > widget > checkbutton > check:not(:checked):not(:indeterminate):disabled,
#MozillaGtkWidget > widget > radiobutton > radio:not(:checked):not(:indeterminate):disabled {
  color: rgba(117, 117, 117, 0.5);
}
#MozillaGtkWidget menuitem label:disabled {
  color: rgba(212, 190, 152, 0.5);
}

#MozillaGtkWidget > widget > menubar {
  color: rgba(221, 199, 161, 0.7);
}
#MozillaGtkWidget > widget > menubar:hover {
  color: #${palette[2]};
}
#MozillaGtkWidget > widget > menubar:disabled {
  color: rgba(221, 199, 161, 0.3);
}
#MozillaGtkWidget > widget > frame {
  color: rgba(212, 190, 152, 0.3);
}
#MozillaGtkWidget menu > separator {
  color: rgba(212, 190, 152, 0.2);
}

/**
 * Inkscape
 */
#ToolboxCommon > #AuxToolbox #StyleSwatch {
  font-size: smaller;
}
#ToolboxCommon > #AuxToolbox #Kludge {
  padding: 0;
}
#ToolboxCommon > #AuxToolbox spinbutton,
#ToolboxCommon > #AuxToolbox entry {
  min-height: 32px;
}
#ToolboxCommon > #AuxToolbox button:not(.up):not(.down) {
  min-height: 24px;
  min-width: 16px;
  padding: 4px 8px;
  border-radius: 6px;
}
#ToolboxCommon > #AuxToolbox spinbutton button {
  border-width: 4px;
}
#ToolboxCommon > toolbar.vertical {
  margin-top: -4px;
}
#ToolboxCommon > toolbar.vertical button {
  min-height: 24px;
  min-width: 24px;
  padding: 4px;
  border-radius: 6px;
}

#CanvasTable button {
  min-height: 16px;
  min-width: 16px;
  padding: 0;
  border-radius: 0;
}
#CanvasTable #HorizontalScrollbar {
  border-top: 1px solid rgba(212, 190, 152, 0.2);
}
#CanvasTable #VerticalScrollbar:dir(ltr) {
  border-left: 1px solid rgba(212, 190, 152, 0.2);
}
#CanvasTable #VerticalScrollbar:dir(rtl) {
  border-right: 1px solid rgba(212, 190, 152, 0.2);
}

#Canvas_and_Dock frame > border {
  border: none;
  background-color: transparent;
}
#Canvas_and_Dock widget > widget > button.flat {
  min-height: 16px;
  min-width: 16px;
  padding: 4px;
}
#Canvas_and_Dock widget > widget > box.horizontal image {
  padding: 4px;
}
#Canvas_and_Dock box.horizontal > box.vertical > button.flat {
  min-height: 16px;
  min-width: 24px;
  padding: 8px 4px;
}

/**
 * Synapse
 */
box.vertical > widget > widget:selected {
  background-color: rgba(138, 180, 248, 0.6);
}

/**
 * Unity
 */
UnityDecoration {
  -UnityDecoration-extents: 28px 0 0 0;
  -UnityDecoration-input-extents: 8px;
  -UnityDecoration-shadow-offset-x: 0;
  -UnityDecoration-shadow-offset-y: 3px;
  -UnityDecoration-active-shadow-color: rgba(0, 0, 0, 0.48);
  -UnityDecoration-active-shadow-radius: 18px;
  -UnityDecoration-inactive-shadow-color: rgba(0, 0, 0, 0.32);
  -UnityDecoration-inactive-shadow-radius: 6px;
  -UnityDecoration-glow-size: 8px;
  -UnityDecoration-glow-color: #${palette[7]};
  -UnityDecoration-title-indent: 4px;
  -UnityDecoration-title-fade: 32px;
  -UnityDecoration-title-alignment: 0;
}
UnityDecoration .top {
  padding: 0 2px;
  border-style: none;
  border-radius: 6px 6px 0 0;
  box-shadow: inset 0 1px rgba(255, 255, 255, 0.05);
  background-color: #${palette[0]};
  color: #${palette[2]};
}
UnityDecoration .top:backdrop {
  background-color: #${palette[0]};
  color: rgba(221, 199, 161, 0.7);
}
UnityDecoration .menuitem {
  border-radius: 6px 6px 0 0;
  box-shadow: none;
  color: rgba(221, 199, 161, 0.7);
}
UnityDecoration .menuitem:hover {
  background-color: rgba(221, 199, 161, 0.12);
  color: #${palette[2]};
}

.background:not(.csd) headerbar:not(.titlebar) {
  border-radius: 0;
  box-shadow: 0 2px 2px -2px rgba(0, 0, 0, 0.3), 0 1px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 2px -0.6px rgba(0, 0, 0, 0.17);
}
.background:not(.csd) headerbar:not(.titlebar).inline-toolbar {
  border-style: none;
}

UnityPanelWidget,
.unity-panel {
  background-color: #${palette[0]};
  color: #${palette[2]};
}
UnityPanelWidget:backdrop,
.unity-panel:backdrop {
  color: rgba(221, 199, 161, 0.7);
}

.unity-panel.menuitem,
.unity-panel .menuitem {
  color: rgba(221, 199, 161, 0.7);
}

.unity-panel.menubar.menuitem:hover,
.unity-panel.menubar .menuitem *:hover {
  background-color: rgba(221, 199, 161, 0.12);
  color: #${palette[2]};
}

.menu IdoPlaybackMenuItem.menuitem:active {
  -gtk-icon-source: -gtk-icontheme("process-working-symbolic");
  animation: spin 1s linear infinite;
  color: #${palette[7]};
}

/**
 * Mate-Panel
 */
.mate-panel-menu-bar menubar,
#PanelApplet-window-menu-applet-button {
  background-color: transparent;
}

.mate-panel-menu-bar {
  background-color: #${palette[0]};
  color: rgba(221, 199, 161, 0.7);
  font-weight: 500;
}
.mate-panel-menu-bar button {
  min-height: 16px;
  min-width: 16px;
  padding: 0;
  border-radius: 0;
  color: rgba(221, 199, 161, 0.7);
  box-shadow: none;
  background-color: transparent;
}
.mate-panel-menu-bar button:drop(active), .mate-panel-menu-bar button:hover {
  box-shadow: none;
  background-color: rgba(221, 199, 161, 0.08);
}
.mate-panel-menu-bar button:focus {
  box-shadow: none;
  background-color: rgba(221, 199, 161, 0.08);
}
.mate-panel-menu-bar button:active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(221, 199, 161, 0.12) 10%, transparent 0%);
}
.mate-panel-menu-bar button:disabled {
  background-color: transparent;
  color: rgba(221, 199, 161, 0.3);
}
.mate-panel-menu-bar button:checked {
  color: #${palette[2]};
  box-shadow: none;
  background-color: rgba(221, 199, 161, 0.12);
}
.mate-panel-menu-bar button:checked:drop(active), .mate-panel-menu-bar button:checked:hover {
  box-shadow: none;
  background-color: rgba(221, 199, 161, 0.1904);
}
.mate-panel-menu-bar button:checked:focus {
  box-shadow: none;
  background-color: rgba(221, 199, 161, 0.1904);
}
.mate-panel-menu-bar button:checked:active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(221, 199, 161, 0.12) 10%, transparent 0%);
}
.mate-panel-menu-bar button:checked:disabled {
  background-color: rgba(221, 199, 161, 0.12);
  color: rgba(221, 199, 161, 0.5);
}

PanelToplevel.horizontal > grid > button {
  min-width: 24px;
}

PanelToplevel.vertical > grid > button {
  min-height: 24px;
}

PanelSeparator {
  color: rgba(221, 199, 161, 0.2);
}

MatePanelAppletFrameDBus > MatePanelAppletFrameDBus {
  background-image: repeating-linear-gradient(currentcolor, currentcolor 4px, transparent 4px, transparent 6px);
  background-repeat: no-repeat;
  background-size: 4px 10px;
  color: rgba(221, 199, 161, 0.3);
}
MatePanelAppletFrameDBus > MatePanelAppletFrameDBus:dir(ltr) {
  background-position: 3px;
}
MatePanelAppletFrameDBus > MatePanelAppletFrameDBus:dir(rtl) {
  background-position: calc(100% - 3px);
}

.mate-panel-menu-bar menubar > menuitem {
  color: rgba(221, 199, 161, 0.7);
}
.mate-panel-menu-bar menubar > menuitem:hover {
  background-color: rgba(221, 199, 161, 0.12);
  color: #${palette[2]};
}
.mate-panel-menu-bar menubar > menuitem:disabled {
  color: rgba(221, 199, 161, 0.3);
}
.mate-panel-menu-bar.horizontal menubar > menuitem {
  padding: 0 8px;
}
.mate-panel-menu-bar.vertical menubar > menuitem {
  padding: 8px 0;
}
.mate-panel-menu-bar menubar menu > menuitem {
  min-height: 28px;
  padding: 0 6px;
}

.mate-panel-menu-bar #PanelApplet button {
  -GtkWidget-window-dragging: true;
}

.mate-panel-menu-bar #tasklist-button {
  border-image: radial-gradient(circle closest-corner at center calc(100% - 1px), currentcolor 0%, transparent 0%) 0 0 0/0 0 0;
}
.mate-panel-menu-bar #tasklist-button:checked {
  border-image: radial-gradient(circle closest-corner at center calc(100% - 1px), currentcolor 100%, transparent 0%) 0 0 2/0 0 2px;
}
.mate-panel-menu-bar #tasklist-button image:dir(ltr),
.mate-panel-menu-bar #tasklist-button label:dir(rtl) {
  padding-left: 4px;
}
.mate-panel-menu-bar #tasklist-button label:dir(ltr),
.mate-panel-menu-bar #tasklist-button image:dir(rtl) {
  padding-right: 4px;
}

.mate-panel-menu-bar.vertical #tasklist-button {
  min-height: 32px;
}

.mate-panel-menu-bar.horizontal #showdesktop-button image {
  min-width: 24px;
  padding: 0 4px;
}
.mate-panel-menu-bar.vertical #showdesktop-button image {
  min-height: 24px;
  padding: 4px 0;
}

PanelApplet.wnck-applet .wnck-pager {
  background-color: transparent;
  color: #${palette[7]};
}
PanelApplet.wnck-applet .wnck-pager:hover {
  background-color: rgba(221, 199, 161, 0.08);
}
PanelApplet.wnck-applet .wnck-pager:active {
  background-color: rgba(221, 199, 161, 0.12);
}
PanelApplet.wnck-applet .wnck-pager:selected {
  background-color: #${palette[7]};
}

.mate-panel-menu-bar.horizontal #clock-applet-button label {
  padding: 0 8px;
}
.mate-panel-menu-bar.vertical #clock-applet-button label {
  padding: 8px 0;
}

#MatePanelPopupWindow {
  border: 1px solid rgba(212, 190, 152, 0.2);
  border-radius: 7px;
  box-shadow: inset 0 1px rgba(255, 255, 255, 0.05);
  background-clip: padding-box;
  background-color: #${palette[1]};
}
#MatePanelPopupWindow frame > border {
  border-style: none;
  background-color: transparent;
}
#MatePanelPopupWindow calendar {
  border-style: none;
}
#MatePanelPopupWindow calendar:not(:selected) {
  background-color: transparent;
}
#MatePanelPopupWindow calendar + box {
  margin-top: -5px;
  padding-top: 5px;
  border-top: 1px solid rgba(212, 190, 152, 0.2);
}
#MatePanelPopupWindow expander > title {
  min-height: 32px;
}
#MatePanelPopupWindow button {
  padding: 4px 16px;
}
#MatePanelPopupWindow > frame > box > box > box > widget {
  color: rgba(212, 190, 152, 0.2);
}

na-tray-applet {
  -NaTrayApplet-icon-padding: 3px;
  -NaTrayApplet-icon-size: 16;
}

.mate-panel-menu-bar {
  -PanelMenuBar-icon-visible: true;
}

.mate-panel-applet-slider {
  border: 1px solid rgba(212, 190, 152, 0.2);
  border-radius: 7px;
  box-shadow: inset 0 1px rgba(255, 255, 255, 0.05);
  background-clip: padding-box;
  background-color: #${palette[1]};
}
.mate-panel-applet-slider frame > border {
  border-style: none;
  background-color: transparent;
}

#PanelApplet:not(:selected) > box {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
}
#PanelApplet:selected > box {
  background-color: rgba(221, 199, 161, 0.12);
  color: #${palette[2]};
}

#mate-menu {
  border: 1px solid rgba(212, 190, 152, 0.2);
  box-shadow: inset 0 1px rgba(255, 255, 255, 0.05);
  background-clip: padding-box;
  background-color: #${palette[1]};
}
#mate-menu button {
  min-height: 24px;
  min-width: 24px;
  padding: 4px 0;
  color: #${palette[2]};
  font-weight: normal;
}
#mate-menu button:not(.flat) {
  background-color: rgba(212, 190, 152, 0.12);
}
#mate-menu button image,
#mate-menu button label + label {
  color: rgba(212, 190, 152, 0.7);
}
#mate-menu entry {
  margin: 0 0 4px;
}
#mate-menu entry image {
  margin: 0;
}
#mate-menu entry + button {
  margin: 0 4px 4px;
  padding: 4px;
}

.brisk-menu {
  box-shadow: inset 0 1px rgba(255, 255, 255, 0.05);
  background-color: #${palette[1]};
}
.brisk-menu entry {
  margin-bottom: -2px;
  border-bottom: 1px solid rgba(212, 190, 152, 0.2);
  border-image: none;
  box-shadow: none;
  background-color: transparent;
}
.brisk-menu entry + box > box:dir(ltr) {
  margin-right: -2px;
  border-right: 1px solid rgba(212, 190, 152, 0.2);
}
.brisk-menu entry + box > box:dir(rtl) {
  margin-left: -2px;
  border-left: 1px solid rgba(212, 190, 152, 0.2);
}
.brisk-menu .categories-list {
  padding-top: 4px;
}
.brisk-menu .categories-list button {
  margin: 0 4px;
}
.brisk-menu .session-button {
  padding: 8px;
}
.brisk-menu .frame {
  border-style: none;
  background-color: transparent;
}
.brisk-menu .apps-list {
  padding: 4px 0;
  background-color: transparent;
}
.brisk-menu .apps-list row {
  padding: 0;
}
.brisk-menu .apps-list row:hover {
  box-shadow: none;
}
.brisk-menu .apps-list button {
  border-radius: 0;
  color: #${palette[2]};
  font-weight: normal;
}

/**
 * CAJA File manager
 */
.caja-navigation-window box.horizontal > button.toggle.image-button {
  border-radius: 6px;
}

.caja-pathbar button {
  margin: 0 -1px 0 -2px;
}
.caja-pathbar button.slider-button {
  min-width: 24px;
}
.caja-pathbar button > widget {
  -gtk-icon-source: -gtk-icontheme("pan-down-symbolic");
  -GtkArrow-arrow-scaling: 1;
}

.caja-side-pane notebook,
.caja-notebook {
  border-top: 1px solid rgba(212, 190, 152, 0.2);
}
.caja-side-pane notebook .frame,
.caja-notebook .frame {
  border-style: none;
  background-color: transparent;
}

.caja-canvas-item {
  border-radius: 6px;
}

.caja-desktop.view .entry,
.caja-navigation-window .view .entry {
  border: none;
  border-radius: 6px;
  background-color: rgba(212, 190, 152, 0.04);
  background-image: none;
  color: #${palette[2]};
}
.caja-desktop.view .entry:selected,
.caja-navigation-window .view .entry:selected {
  background-color: rgba(138, 180, 248, 0.6);
}

.caja-desktop.view .entry {
  background-color: rgba(0, 0, 0, 0.3);
  color: #${palette[2]};
  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.2), 0 1px 2px rgba(0, 0, 0, 0.14), 0 1px 3px rgba(0, 0, 0, 0.12);
  caret-color: currentcolor;
}
.caja-desktop.view .entry:selected {
  background-color: rgba(138, 180, 248, 0.6);
}

.caja-navigation-window statusbar {
  margin: 0 -10px;
  padding: 0 4px;
  border-top: 1px solid rgba(212, 190, 152, 0.2);
}

.caja-notebook frame > border {
  border-style: none;
  background-color: transparent;
}

#caja-extra-view-widget {
  border-bottom: 1px solid rgba(212, 190, 152, 0.2);
}
#caja-extra-view-widget > box > box > label {
  font-weight: bold;
}
#caja-extra-view-widget button:not(:disabled) {
  color: #${palette[7]};
  box-shadow: none;
  background-color: transparent;
}
#caja-extra-view-widget button:not(:disabled):drop(active), #caja-extra-view-widget button:not(:disabled):hover {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.12);
}
#caja-extra-view-widget button:not(:disabled):focus {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.12);
}
#caja-extra-view-widget button:not(:disabled):active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(138, 180, 248, 0.16) 10%, transparent 0%);
}

/**
 * Pluma
 */
.pluma-window statusbar {
  margin: 0 -10px;
  padding: 0 4px;
  border-top: 1px solid rgba(212, 190, 152, 0.2);
}
.pluma-window statusbar frame > border {
  border-style: none;
  background-color: transparent;
}
.pluma-window statusbar frame button.flat {
  padding: 0 4px;
  border-radius: 0;
}
.pluma-window statusbar frame button.flat widget {
  -gtk-icon-source: -gtk-icontheme("pan-down-symbolic");
  -GtkArrow-arrow-scaling: 1;
}

.pluma-print-preview toolbar {
  border-bottom: 1px solid rgba(212, 190, 152, 0.2);
}
.pluma-window paned.horizontal box.vertical box.horizontal button.flat {
  margin: 1px;
}
.pluma-window paned.horizontal box.vertical .frame {
  border-style: none;
  background-color: transparent;
}
.pluma-window paned.horizontal box.vertical notebook.frame {
  margin-top: -1px;
  border-top: 1px solid rgba(212, 190, 152, 0.2);
}
.pluma-window paned.horizontal box.vertical notebook.frame box.vertical toolbar.horizontal {
  border-bottom: 1px solid rgba(212, 190, 152, 0.2);
}

/**
 * Atril
 */
.atril-window paned.horizontal box.vertical .frame {
  border-style: none;
  background-color: transparent;
}
.atril-window paned.horizontal box.vertical notebook .frame {
  border-top: 1px solid rgba(212, 190, 152, 0.2);
}

/* mate-screensaver lock dialog */
.lock-dialog {
  border: 1px solid rgba(212, 190, 152, 0.2);
  border-radius: 7px;
  box-shadow: 0 3px 3px -1px rgba(0, 0, 0, 0.2), 0 6px 6px 0 rgba(0, 0, 0, 0.14), 0 1px 10.8px 0 rgba(0, 0, 0, 0.12), inset 0 1px rgba(255, 255, 255, 0.05);
  background-clip: padding-box;
  background-color: #${palette[1]};
}
.lock-dialog frame > border {
  border-style: none;
  background-color: transparent;
}
.lock-dialog button:not(:disabled) {
  color: #${palette[0]};
  box-shadow: none;
  background-color: transparent;
}
.lock-dialog button:not(:disabled):drop(active), .lock-dialog button:not(:disabled):hover {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.12);
}
.lock-dialog button:not(:disabled):focus {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.12);
}
.lock-dialog button:not(:disabled):active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(138, 180, 248, 0.16) 10%, transparent 0%);
}

/* multimedia OSD */
MsdOsdWindow.background.osd {
  border-radius: 6px;
  background-color: rgba(50, 48, 47, 0.9);
  color: #${palette[2]};
}
MsdOsdWindow.background.osd .trough {
  border-radius: 0;
  background-color: rgba(221, 199, 161, 0.2);
}
MsdOsdWindow.background.osd .progressbar {
  border-radius: 0;
  background-color: #${palette[2]};
}
/**
 * Budgie Desktop
 */
.budgie-container {
  background-color: transparent;
}

.budgie-settings-window buttonbox.inline-toolbar {
  border-style: none none solid;
}
.budgie-settings-window buttonbox.inline-toolbar button {
  border-radius: 6px;
}

.budgie-popover {
  border-style: solid;
  border-width: 1px;
  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.2) rgba(0, 0, 0, 0.3);
  border-radius: 7px;
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2), 0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12);
  background-clip: padding-box;
  background-color: #${palette[1]};
}
.budgie-popover .container {
  padding: 2px;
}
.budgie-popover border {
  border: none;
  background-color: transparent;
}
.budgie-popover row {
  padding: 0;
}
.budgie-popover row:hover {
  box-shadow: none;
}
.budgie-popover button.flat:not(.image-button) {
  min-height: 28px;
  padding: 0 8px;
  color: #${palette[2]};
  font-weight: normal;
}
.budgie-popover button.flat:not(.image-button):disabled {
  color: rgba(212, 190, 152, 0.5);
}
.budgie-popover.budgie-menu .container {
  padding: 0;
}
.budgie-popover.budgie-menu scrollbar,
.budgie-popover.budgie-menu entry.search {
  background-color: transparent;
}
.budgie-popover.budgie-menu entry.search {
  border-bottom: 1px solid rgba(212, 190, 152, 0.2);
  border-image: none;
  border-radius: 0;
  box-shadow: none;
  font-size: 120%;
}
.budgie-popover.budgie-menu button.flat:not(.image-button) {
  min-height: 32px;
  padding: 0 8px;
  border-radius: 0;
}
.budgie-popover.budgie-menu button.flat:not(.image-button):drop(active):not(:active), .budgie-popover.budgie-menu button.flat:not(.image-button):hover:not(:active) {
  transition-property: all, border-image, background-size, background-image, background-color;
  transition-duration: 75ms, 225ms, 300ms, 1200ms, 0ms;
}
.budgie-popover.budgie-menu button.flat:not(.image-button):checked {
  background-color: rgba(138, 180, 248, 0.6);
}
.budgie-popover.budgie-menu button.flat:not(.image-button):checked:disabled {
  background-color: transparent;
}
.budgie-popover.user-menu .container {
  padding: 8px;
}
.budgie-popover.user-menu separator {
  margin: 4px 0;
}
.budgie-popover.sound-popover separator {
  margin: 3px 0;
}
.budgie-popover.night-light-indicator .container {
  padding: 8px;
}
.budgie-popover.places-menu .container {
  padding: 8px;
}
.budgie-popover.places-menu .name-button image:dir(ltr) {
  margin-right: 3px;
}
.budgie-popover.places-menu .name-button image:dir(rtl) {
  margin-left: 3px;
}
.budgie-popover.places-menu .unmount-button {
  margin: 2px;
  padding: 0;
}
.budgie-popover.places-menu .places-list:not(.always-expand) {
  margin-top: 4px;
  padding-top: 4px;
  border-top: 1px solid rgba(212, 190, 152, 0.2);
}
.budgie-popover.places-menu .alternative-label {
  padding: 3px;
  font-size: 15px;
}
.budgie-popover.workspace-popover .container {
  padding: 8px;
}
.budgie-popover.workspace-popover separator {
  margin: 4px 0;
}
.budgie-popover.workspace-popover flowboxchild {
  padding: 0;
}

.workspace-switcher .workspace-layout {
  border: 0 solid rgba(221, 199, 161, 0.2);
}
.top .workspace-switcher .workspace-layout:dir(ltr), .bottom .workspace-switcher .workspace-layout:dir(ltr) {
  border-left-width: 1px;
}
.top .workspace-switcher .workspace-layout:dir(rtl), .bottom .workspace-switcher .workspace-layout:dir(rtl) {
  border-right-width: 1px;
}
.left .workspace-switcher .workspace-layout, .right .workspace-switcher .workspace-layout {
  border-top-width: 1px;
}
.workspace-switcher .workspace-item,
.workspace-switcher .workspace-add-button {
  border: 0 solid rgba(221, 199, 161, 0.2);
}
.top .workspace-switcher .workspace-item:dir(ltr), .bottom .workspace-switcher .workspace-item:dir(ltr),
.top .workspace-switcher .workspace-add-button:dir(ltr),
.bottom .workspace-switcher .workspace-add-button:dir(ltr) {
  border-right-width: 1px;
}
.top .workspace-switcher .workspace-item:dir(rtl), .bottom .workspace-switcher .workspace-item:dir(rtl),
.top .workspace-switcher .workspace-add-button:dir(rtl),
.bottom .workspace-switcher .workspace-add-button:dir(rtl) {
  border-left-width: 1px;
}
.left .workspace-switcher .workspace-item, .right .workspace-switcher .workspace-item,
.left .workspace-switcher .workspace-add-button,
.right .workspace-switcher .workspace-add-button {
  border-bottom-width: 1px;
}
.workspace-switcher .workspace-item {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
}
.workspace-switcher .workspace-item.current-workspace {
  background-color: rgba(221, 199, 161, 0.12);
}
.workspace-switcher .workspace-add-button:hover {
  box-shadow: none;
}
.workspace-switcher .workspace-add-button:active {
  background-image: none;
}
.workspace-switcher .workspace-add-button:active image {
  margin: 1px 0 -1px;
}
.budgie-panel .workspace-switcher .workspace-icon-button {
  min-height: 24px;
  min-width: 24px;
  padding: 0;
  border-radius: 6px;
}

.budgie-panel {
  transition: background-color 75ms cubic-bezier(0, 0, 0.2, 1);
  background-color: #${palette[0]};
  color: rgba(221, 199, 161, 0.7);
  font-weight: 500;
}
.budgie-panel.transparent {
  background-color: black;
  color: rgba(255, 255, 255, 0.6);
}
.budgie-panel button {
  min-height: 16px;
  min-width: 16px;
  padding: 0;
  border-radius: 0;
  color: rgba(221, 199, 161, 0.7);
  box-shadow: none;
  background-color: transparent;
}
.budgie-panel button:drop(active), .budgie-panel button:hover {
  box-shadow: none;
  background-color: rgba(221, 199, 161, 0.08);
}
.budgie-panel button:focus {
  box-shadow: none;
  background-color: rgba(221, 199, 161, 0.08);
}
.budgie-panel button:active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(221, 199, 161, 0.12) 10%, transparent 0%);
}
.budgie-panel button:disabled {
  background-color: transparent;
  color: rgba(221, 199, 161, 0.3);
}
.budgie-panel button:checked {
  color: #${palette[2]};
  box-shadow: none;
  background-color: rgba(221, 199, 161, 0.12);
}
.budgie-panel button:checked:drop(active), .budgie-panel button:checked:hover {
  box-shadow: none;
  background-color: rgba(221, 199, 161, 0.1904);
}
.budgie-panel button:checked:focus {
  box-shadow: none;
  background-color: rgba(221, 199, 161, 0.1904);
}
.budgie-panel button:checked:active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(221, 199, 161, 0.12) 10%, transparent 0%);
}
.budgie-panel button:checked:disabled {
  background-color: rgba(221, 199, 161, 0.12);
  color: rgba(221, 199, 161, 0.5);
}
.budgie-panel.horizontal button {
  padding: 0 4px;
}
.budgie-panel.vertical button {
  padding: 4px 0;
}
.budgie-panel separator {
  background-color: rgba(221, 199, 161, 0.3);
}
.budgie-panel .alert {
  color: #${palette[0]};
}
.budgie-panel .titlebar:not(headerbar) {
  min-height: 0;
  padding: 0;
  box-shadow: none;
  background-color: transparent;
  color: #${palette[2]};
}
.budgie-panel .titlebar:not(headerbar) button:not(.suggested-action):not(.destructive-action) {
  color: rgba(221, 199, 161, 0.7);
}
.budgie-panel #tasklist-button {
  padding: 0 4px;
}
.budgie-panel.vertical #tasklist-button {
  min-height: 32px;
}
.budgie-panel button.flat.launcher {
  padding: 0;
}
.budgie-panel button.flat.launcher:not(:checked) {
  color: rgba(221, 199, 161, 0.5);
}
.budgie-panel button.flat.launcher:not(:checked):disabled {
  color: rgba(221, 199, 161, 0.3);
}
.top .budgie-panel #tasklist-button, .budgie-panel .top #tasklist-button, .top .budgie-panel button.flat.launcher, .budgie-panel .top button.flat.launcher {
  border-image: radial-gradient(circle closest-corner at center calc(1px), currentcolor 0%, transparent 0%) 0 0 0 0/0 0 0 0;
}
.budgie-panel .unpinned button.flat.launcher,
.budgie-panel .pinned button.flat.launcher.running, .top .budgie-panel #tasklist-button:checked, .budgie-panel .top #tasklist-button:checked, .top .budgie-panel button.flat.launcher:checked, .budgie-panel .top button.flat.launcher:checked {
  border-image: radial-gradient(circle closest-corner at center calc(1px), currentcolor 100%, transparent 0%) 2 0 0 0/2px 0 0 0;
}

.bottom .budgie-panel #tasklist-button, .budgie-panel .bottom #tasklist-button, .bottom .budgie-panel button.flat.launcher, .budgie-panel .bottom button.flat.launcher {
  border-image: radial-gradient(circle closest-corner at center calc(100% - 1px), currentcolor 0%, transparent 0%) 0 0 0 0/0 0 0 0;
}
.budgie-panel .unpinned button.flat.launcher,
.budgie-panel .pinned button.flat.launcher.running, .bottom .budgie-panel #tasklist-button:checked, .budgie-panel .bottom #tasklist-button:checked, .bottom .budgie-panel button.flat.launcher:checked, .budgie-panel .bottom button.flat.launcher:checked {
  border-image: radial-gradient(circle closest-corner at center calc(100% - 1px), currentcolor 100%, transparent 0%) 0 0 2 0/0 0 2px 0;
}

.left .budgie-panel #tasklist-button, .budgie-panel .left #tasklist-button, .left .budgie-panel button.flat.launcher, .budgie-panel .left button.flat.launcher {
  border-image: radial-gradient(circle closest-corner at calc(1px) center, currentcolor 0%, transparent 0%) 0 0 0 0/0 0 0 0;
}
.budgie-panel .unpinned button.flat.launcher,
.budgie-panel .pinned button.flat.launcher.running, .left .budgie-panel #tasklist-button:checked, .budgie-panel .left #tasklist-button:checked, .left .budgie-panel button.flat.launcher:checked, .budgie-panel .left button.flat.launcher:checked {
  border-image: radial-gradient(circle closest-corner at calc(1px) center, currentcolor 100%, transparent 0%) 0 0 0 2/0 0 0 2px;
}

.right .budgie-panel #tasklist-button, .budgie-panel .right #tasklist-button, .right .budgie-panel button.flat.launcher, .budgie-panel .right button.flat.launcher {
  border-image: radial-gradient(circle closest-corner at calc(100% - 1px) center, currentcolor 0%, transparent 0%) 0 0 0 0/0 0 0 0;
}
.budgie-panel .unpinned button.flat.launcher,
.budgie-panel .pinned button.flat.launcher.running, .right .budgie-panel #tasklist-button:checked, .budgie-panel .right #tasklist-button:checked, .right .budgie-panel button.flat.launcher:checked, .budgie-panel .right button.flat.launcher:checked {
  border-image: radial-gradient(circle closest-corner at calc(100% - 1px) center, currentcolor 100%, transparent 0%) 0 2 0 0/0 2px 0 0;
}

frame.raven-frame > border {
  border-style: none;
  box-shadow: 0 8px 6px -5px rgba(0, 0, 0, 0.2), 0 16px 14.4px 2px rgba(0, 0, 0, 0.14), 0 6px 18px 5px rgba(0, 0, 0, 0.12);
}

.top frame.raven-frame > border {
  margin-bottom: 32px;
}

.bottom frame.raven-frame > border {
  margin-top: 32px;
}

.left frame.raven-frame > border {
  margin-right: 32px;
}

.right frame.raven-frame > border {
  margin-left: 32px;
}

.raven {
  background-color: #${palette[1]};
}
.raven > box:not(:only-child) {
  margin-bottom: -10px;
}
.raven .raven-header {
  min-height: 32px;
  padding: 3px;
}
.raven .raven-header.top {
  padding: 0;
  border-bottom: 1px solid rgba(212, 190, 152, 0.2);
}
.raven .raven-header.top stackswitcher.linked > button {
  margin: -4px 0 -5px;
  padding: 0 16px;
  min-height: 40px;
  border-image: radial-gradient(circle closest-corner at center calc(100% - 1px), #${palette[0]} 0%, transparent 0%) 0 0 0/0 0 0;
  border-radius: 0;
}
.raven .raven-header.top stackswitcher.linked > button:checked {
  border-image: radial-gradient(circle closest-corner at center calc(100% - 1px), #${palette[0]} 100%, transparent 0%) 0 0 2/0 0 2px;
  background-color: transparent;
}
.raven .raven-header.bottom {
  border-top: 1px solid rgba(212, 190, 152, 0.2);
}
.raven stack .raven-header {
  margin-top: -6px;
}
.raven stack scrolledwindow .raven-header {
  margin-top: -8px;
}
.raven .expander-button {
  border-radius: 9999px;
}
.raven .raven-background stackswitcher.linked > button {
  margin: -2px 8px 9px;
  padding: 0 12px;
  min-height: 32px;
  border-radius: 9999px;
  color: rgba(212, 190, 152, 0.7);
  font-weight: normal;
  box-shadow: none;
  background-color: rgba(212, 190, 152, 0.08);
}
.raven .raven-background stackswitcher.linked > button:drop(active), .raven .raven-background stackswitcher.linked > button:hover {
  box-shadow: none;
  background-color: rgba(212, 190, 152, 0.1536);
}
.raven .raven-background stackswitcher.linked > button:focus {
  box-shadow: none;
  background-color: rgba(212, 190, 152, 0.1536);
}
.raven .raven-background stackswitcher.linked > button:active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(212, 190, 152, 0.12) 10%, transparent 0%);
}
.raven .raven-background stackswitcher.linked > button:checked {
  color: #${palette[0]};
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.16);
}
.raven .raven-background stackswitcher.linked > button:checked:drop(active), .raven .raven-background stackswitcher.linked > button:checked:hover {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.2608);
}
.raven .raven-background stackswitcher.linked > button:checked:focus {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.2608);
}
.raven .raven-background stackswitcher.linked > button:checked:active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(138, 180, 248, 0.16) 10%, transparent 0%);
}
.raven .raven-background stackswitcher.linked > button:not(:first-child) {
  margin-left: 0;
}
.raven .raven-background > overlay > widget > image {
  color: rgba(212, 190, 152, 0.08);
}
.raven revealer > .raven-background {
  border-bottom: 1px solid rgba(212, 190, 152, 0.2);
}
.raven .raven-header + .raven-background {
  border-top: 1px solid rgba(212, 190, 152, 0.2);
}
.raven viewport.frame > list > row {
  padding: 0;
  box-shadow: none;
  background: none;
}
.raven viewport.frame > list > row:not(:first-child) {
  border-top: 1px solid rgba(212, 190, 152, 0.2);
}
.raven viewport.frame > list > row > box {
  margin-top: -5px;
  margin-left: -5px;
  margin-bottom: -5px;
}
.raven viewport.frame > list > row > box > box {
  padding: 6px;
  margin-bottom: -10px;
}
.raven viewport.frame > list > row > box > list > row {
  padding: 8px;
}
.raven viewport.frame > list > row > box > list > row > box {
  margin-bottom: -5px;
}
.raven viewport.frame > list > row > box > list > row > box > box > label {
  font-weight: bold;
}
.raven viewport.frame > list > row > box > list > row > box > box > button.image-button {
  padding: 0;
}
.raven viewport.frame > list > row > box > list > row > box > label {
  margin-top: -6px;
  font-size: smaller;
}
.raven .powerstrip button {
  margin: 2px 0 1px;
  padding: 8px;
}
.raven .option-subtitle {
  font-size: smaller;
}

calendar.raven-calendar {
  border-style: none;
  background-color: transparent;
}
calendar.raven-calendar:selected {
  border-radius: 6px;
  background-color: rgba(138, 180, 248, 0.6);
}

.raven-mpris {
  background-color: black;
  color: rgba(255, 255, 255, 0.87);
}
.raven-mpris label {
  min-height: 24px;
}
.raven-mpris button.image-button {
  padding: 8px;
  color: rgba(255, 255, 255, 0.6);
  box-shadow: none;
  background-color: transparent;
}
.raven-mpris button.image-button:drop(active), .raven-mpris button.image-button:hover {
  box-shadow: none;
  background-color: rgba(255, 255, 255, 0.08);
}
.raven-mpris button.image-button:focus {
  box-shadow: none;
  background-color: rgba(255, 255, 255, 0.08);
}
.raven-mpris button.image-button:active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(255, 255, 255, 0.12) 10%, transparent 0%);
}

.budgie-notification-window, .budgie-switcher-window, .budgie-osd-window {
  background-color: transparent;
}

.budgie-notification .notification-title, .budgie-switcher .notification-title {
  font-size: 120%;
}
.budgie-notification .notification-body, .budgie-switcher .notification-body {
  color: rgba(212, 190, 152, 0.7);
}

.budgie-osd .budgie-osd-text {
  font-size: 120%;
}

.drop-shadow {
  margin: 5px 9px;
  padding: 3px;
  border-radius: 6px;
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2), 0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12), inset 0 1px rgba(255, 255, 255, 0.05);
  background-color: #${palette[1]};
}
.drop-shadow button.text-button:not(:disabled) {
  color: #${palette[0]};
  box-shadow: none;
  background-color: transparent;
}
.drop-shadow button.text-button:not(:disabled):drop(active), .drop-shadow button.text-button:not(:disabled):hover {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.12);
}
.drop-shadow button.text-button:not(:disabled):focus {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.12);
}
.drop-shadow button.text-button:not(:disabled):active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(138, 180, 248, 0.16) 10%, transparent 0%);
}
.drop-shadow .linked > button {
  margin-right: 4px;
}

.budgie-run-dialog, .budgie-polkit-dialog, .budgie-session-dialog {
  border-radius: 6px;
  box-shadow: inset 0 1px rgba(255, 255, 255, 0.05);
  background-color: #${palette[1]};
}
.budgie-run-dialog decoration, .budgie-polkit-dialog decoration, .budgie-session-dialog decoration {
  border-radius: 6px;
}

.budgie-session-dialog > box {
  padding: 8px;
}
.budgie-session-dialog image {
  margin: -8px;
  -gtk-icon-transform: scale(0);
}
.budgie-session-dialog label:not(:last-child),
.budgie-session-dialog .dialog-title {
  margin-bottom: 8px;
  font-size: 20px;
  font-weight: 500;
}
.budgie-session-dialog .dialog-title + label {
  color: rgba(212, 190, 152, 0.7);
}
.budgie-session-dialog .linked.horizontal > button:not(:last-child) {
  margin-right: 8px;
}
.budgie-session-dialog .linked.horizontal > button:not(:disabled) {
  color: #${palette[0]};
  box-shadow: none;
  background-color: transparent;
}
.budgie-session-dialog .linked.horizontal > button:not(:disabled):drop(active), .budgie-session-dialog .linked.horizontal > button:not(:disabled):hover {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.12);
}
.budgie-session-dialog .linked.horizontal > button:not(:disabled):focus {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.12);
}
.budgie-session-dialog .linked.horizontal > button:not(:disabled):active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(138, 180, 248, 0.16) 10%, transparent 0%);
}

.budgie-polkit-dialog .message {
  color: rgba(212, 190, 152, 0.7);
}
.budgie-polkit-dialog .failure {
  color: #${palette[0]};
}

.budgie-run-dialog entry.search {
  font-size: 120%;
  padding: 4px 12px;
  border-image: none;
  box-shadow: none;
  background-color: transparent;
}
.budgie-run-dialog list {
  padding: 4px 0;
}
.budgie-run-dialog list .dim-label {
  color: inherit;
}
.budgie-run-dialog scrolledwindow {
  border-top: 1px solid rgba(212, 190, 152, 0.2);
}
.budgie-run-dialog scrollbar.right, .budgie-run-dialog scrollbar.bottom {
  border-bottom-right-radius: 6px;
}
.budgie-run-dialog scrollbar.left, .budgie-run-dialog scrollbar.bottom {
  border-bottom-left-radius: 6px;
}

/**
 * Xfce4 Apps
 */
/**
 * xfce4-panel
 */
.xfce4-panel.background {
  border: none;
  background-color: #${palette[0]};
  color: rgba(221, 199, 161, 0.7);
  font-weight: 500;
}
.xfce4-panel.background button {
  min-height: 16px;
  min-width: 16px;
  padding: 0;
  border-radius: 0;
  color: rgba(221, 199, 161, 0.7);
  box-shadow: none;
  background-color: transparent;
}
.xfce4-panel.background button:drop(active), .xfce4-panel.background button:hover {
  box-shadow: none;
  background-color: rgba(221, 199, 161, 0.08);
}
.xfce4-panel.background button:focus {
  box-shadow: none;
  background-color: rgba(221, 199, 161, 0.08);
}
.xfce4-panel.background button:active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(221, 199, 161, 0.12) 10%, transparent 0%);
}
.xfce4-panel.background button:disabled {
  background-color: transparent;
  color: rgba(221, 199, 161, 0.3);
}
.xfce4-panel.background button:checked {
  color: #${palette[2]};
  box-shadow: none;
  background-color: rgba(221, 199, 161, 0.12);
}
.xfce4-panel.background button:checked:drop(active), .xfce4-panel.background button:checked:hover {
  box-shadow: none;
  background-color: rgba(221, 199, 161, 0.1904);
}
.xfce4-panel.background button:checked:focus {
  box-shadow: none;
  background-color: rgba(221, 199, 161, 0.1904);
}
.xfce4-panel.background button:checked:active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(221, 199, 161, 0.12) 10%, transparent 0%);
}
.xfce4-panel.background button:checked:disabled {
  background-color: rgba(221, 199, 161, 0.12);
  color: rgba(221, 199, 161, 0.5);
}
.xfce4-panel.background .tasklist button {
  border-image: image(transparent) 0 0 2/0 0 2px;
}
.xfce4-panel.background .tasklist button:checked {
  border-image: image(currentcolor) 0 0 2/0 0 2px;
}
.xfce4-panel.background .tasklist button image {
  padding: 4px;
}
.xfce4-panel.background frame > border {
  border-style: none;
  background-color: transparent;
}
.xfce4-panel.background progressbar progress {
  background-color: #${palette[0]};
}
.xfce4-panel.background progressbar trough {
  background-color: rgba(221, 199, 161, 0.2);
}

wnck-pager:hover {
  background-color: rgba(221, 199, 161, 0.08);
}
wnck-pager:active {
  background-color: rgba(221, 199, 161, 0.12);
}
wnck-pager:selected {
  background-color: #${palette[0]};
}

XfdesktopIconView.view {
  border-radius: 6px;
  color: #${palette[2]}
  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.2), 0 1px 2px rgba(0, 0, 0, 0.14), 0 1px 3px rgba(0, 0, 0, 0.12);
}
XfdesktopIconView.view:active {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.6);
}
XfdesktopIconView.view .rubberband {
  border-radius: 0;
}

#XfceNotifyWindow {
  border-radius: 6px;
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2), 0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12), inset 0 1px rgba(255, 255, 255, 0.05);
  background-color: #${palette[1]};
  color: #${palette[2]};
}
#XfceNotifyWindow buttonbox button:not(:disabled) {
  color: #${palette[0]};
  box-shadow: none;
  background-color: transparent;
}
#XfceNotifyWindow buttonbox button:not(:disabled):drop(active), #XfceNotifyWindow buttonbox button:not(:disabled):hover {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.12);
}
#XfceNotifyWindow buttonbox button:not(:disabled):focus {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.12);
}
#XfceNotifyWindow buttonbox button:not(:disabled):active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(138, 180, 248, 0.16) 10%, transparent 0%);
}
#XfceNotifyWindow label#summary {
  font-weight: bold;
}
#XfceNotifyWindow label#summary + label {
  color: rgba(212, 190, 152, 0.7);
}
#xfwm-tabwin {
  padding: 12px;
  border-radius: 6px;
  -XfwmTabwinWidget-icon-size: 64px;
  -XfwmTabwinWidget-preview-size: 64px;
}
/**
 * Thunar
 */
.thunar #location-toolbar {
  border-bottom: 1px solid rgba(212, 190, 152, 0.2);
}
.thunar #location-toolbar > toolitem > button {
  min-width: 24px;
  padding: 4px;
  border-radius: 9999px;
}
.thunar .shortcuts-pane.frame,
.thunar .standard-view.frame {
  border-width: 0;
  background-color: transparent;
}
.thunar statusbar {
  margin: 0 -10px;
  padding: 0 4px;
  border-top: 1px solid rgba(212, 190, 152, 0.2);
}

/**
 * LightDM GTK+ Greeter
 */
#panel_window {
  background-color: rgba(0, 0, 0, 0.3);
  color: #${palette[2]}
}
#panel_window menubar,
#panel_window separator {
  background-color: transparent;
}
#panel_window separator {
  padding: 0 4px;
}
#panel_window separator:first-child {
  padding: 0 8px;
}
#panel_window menubar > menuitem {
  color: rgba(255, 255, 255, 0.7);
}
#panel_window menubar > menuitem:hover {
  background-color: rgba(255, 255, 255, 0.12);
  color: #${palette[2]}
}
#panel_window menubar > menuitem:disabled {
  color: rgba(255, 255, 255, 0.3);
}

#login_window,
#shutdown_dialog,
#restart_dialog {
  margin: 8px;
  border-radius: 6px;
  box-shadow: 0 3px 3px -1px rgba(0, 0, 0, 0.2), 0 6px 6px 0 rgba(0, 0, 0, 0.14), 0 1px 10.8px 0 rgba(0, 0, 0, 0.12), inset 0 1px rgba(255, 255, 255, 0.05);
  background-color: #${palette[1]};
  color: #${palette[2]};
}

#content_frame {
  padding-bottom: 16px;
}

#buttonbox_frame {
  padding-top: 24px;
}
#buttonbox_frame > box,
#buttonbox_frame > buttonbox {
  margin: -16px;
}
#buttonbox_frame button:not(:disabled) {
  color: #${palette[0]};
  box-shadow: none;
  background-color: transparent;
}
#buttonbox_frame button:not(:disabled):drop(active), #buttonbox_frame button:not(:disabled):hover {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.12);
}
#buttonbox_frame button:not(:disabled):focus {
  box-shadow: none;
  background-color: rgba(138, 180, 248, 0.12);
}
#buttonbox_frame button:not(:disabled):active {
  box-shadow: none;
  background-image: radial-gradient(circle, rgba(138, 180, 248, 0.16) 10%, transparent 0%);
}

/**
 * Nemo
 */
.nemo-window .primary-toolbar {
  border-bottom: 1px solid rgba(212, 190, 152, 0.2);
}
.nemo-window .primary-toolbar stack > box {
  margin: -2px;
}
.nemo-window .primary-toolbar button.text-button {
  padding-left: 8px;
  padding-right: 8px;
}
.nemo-window .primary-toolbar button:not(.text-button):not(.image-button) {
  padding-left: 4px;
  padding-right: 4px;
}
.nemo-window scrolledwindow.frame {
  border-style: none;
  background-color: transparent;
}
.nemo-window .nemo-window-pane widget.entry {
  border-radius: 6px;
  background-color: rgba(212, 190, 152, 0.04);
}
.nemo-window .nemo-window-pane widget.entry:selected {
  background-color: rgba(138, 180, 248, 0.6);
}
.places-treeview {
  -NemoPlacesTreeView-disk-full-bg-color: #${palette[1]};
  -NemoPlacesTreeView-disk-full-fg-color: #${palette[0]};
  -NemoPlacesTreeView-disk-full-bar-width: 2px;
  -NemoPlacesTreeView-disk-full-bar-radius: 0;
  -NemoPlacesTreeView-disk-full-bottom-padding: 1px;
  -NemoPlacesTreeView-disk-full-max-length: 80px;
}

/* GTK NAMED COLORS
   ----------------
   use responsibly! */
/*
widget text/foreground color */
@define-color theme_fg_color #${palette[2]};
/*
text color for entries, views and content in general */
@define-color theme_text_color #${palette[2]};
/*
widget base background color */
@define-color theme_bg_color #${palette[0]};
/*
text widgets and the like base background color */
@define-color theme_base_color #${palette[0]};
/*
base background color of selections */
@define-color theme_selected_bg_color #${palette[0]};
/*
text/foreground color of selections */
@define-color theme_selected_fg_color #${palette[2]};
/*
base background color of insensitive widgets */
@define-color insensitive_bg_color #${palette[0]};
/*
text foreground color of insensitive widgets */
@define-color insensitive_fg_color #${palette[0]};
/*
insensitive text widgets and the like base background color */
@define-color insensitive_base_color #${palette[0]};
/*
widget text/foreground color on backdrop windows */
@define-color theme_unfocused_fg_color #${palette[2]};
/*
text color for entries, views and content in general on backdrop windows */
@define-color theme_unfocused_text_color #${palette[2]};
/*
widget base background color on backdrop windows */
@define-color theme_unfocused_bg_color #${palette[0]};
/*
text widgets and the like base background color on backdrop windows */
@define-color theme_unfocused_base_color #${palette[1]};
/*
base background color of selections on backdrop windows */
@define-color theme_unfocused_selected_bg_color #${palette[0]};
/*
text/foreground color of selections on backdrop windows */
@define-color theme_unfocused_selected_fg_color #${palette[2]};
/*
insensitive color on backdrop windows */
@define-color unfocused_insensitive_color #${palette[1]};
/*
widgets main borders color */
@define-color borders #${palette[1]};
/*
widgets main borders color on backdrop windows */
@define-color unfocused_borders #${palette[0]};
/*
these are pretty self explicative */
@define-color warning_color #${palette[4]};
@define-color error_color #${palette[6]};
@define-color success_color #${palette[5]};
/*
these colors are exported for the window manager and shouldn't be used in applications,
read if you used those and something break with a version upgrade you're on your own... */
@define-color wm_title #${palette[2]};
@define-color wm_unfocused_title #${palette[2]};
@define-color wm_highlight #${palette[2]};
@define-color wm_bg #${palette[0]};
@define-color wm_unfocused_bg #${palette[0]};
@define-color xfwm4_title #${palette[2]};
@define-color xfwm4_unfocused_title #${palette[3]};
/* content view background such as thumbnails view in Photos or Boxes */
@define-color content_view_bg #${palette[0]};
/* Very contrasty background for text views (@theme_text_color foreground) */
@define-color text_view_bg #${palette[0]};
/* placeholder for entries */
@define-color placeholder_text_color #${palette[0]};
THEME
)"

printf '%s' "$output" > "${dest_dir}/${dest_file}"
