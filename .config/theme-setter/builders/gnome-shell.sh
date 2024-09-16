#!/bin/bash
palette=("${@}")

dest_dir="$HOME/.local/share/themes/${palette[13]}/gnome-shell"
dest_file="gnome-shell.css"

output="$(cat << THEME
/* This stylesheet is generated, DO NOT EDIT */
/* Copyright 2009, 2015 Red Hat, Inc.
 *
 * Portions adapted from Mx's data/style/default.css
 *   Copyright 2009 Intel Corporation
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms and conditions of the GNU Lesser General Public License,
 * version 2.1, as published by the Free Software Foundation.
 *
 * This program is distributed in the hope it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for
 * more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St - Fifth Floor, Boston, MA 02110-1301 USA.
 */
/* Global Values */
stage {
  font-size: 11pt;
  color: #${palette[2]}; }

/* Common Stylings */
.app-well-app.app-folder .overview-icon, .app-folder.grid-search-result .overview-icon, .app-well-app .overview-icon, .grid-search-result .overview-icon, .dash-item-container .show-apps .overview-icon, .list-search-result, .search-provider-icon, .switcher-list .item-box {
  border-radius: 16px;
  padding: 6px;
  spacing: 6px;
  border: 2px solid transparent;
  transition-duration: 200ms;
  text-align: center;
  color: inherit; }

#LookingGlassDialog .notebook-tab, #LookingGlassDialog > #Toolbar .lg-toolbar-button, .screenshot-ui-show-pointer-button, .screenshot-ui-type-button, .app-folder-dialog .folder-name-container .edit-folder-button, .button, .icon-button, .login-dialog-button.cancel-button, .login-dialog-button.switch-user-button, .login-dialog-button.login-dialog-session-list-button, .background-app-item .close-button {
  border-radius: 8px;
  border-style: solid;
  border-width: 1px;
  font-weight: bold;
  padding: 3px 24px; }

.app-folder-dialog .folder-name-container .edit-folder-button, .button, .icon-button, .login-dialog-button.cancel-button, .login-dialog-button.switch-user-button, .login-dialog-button.login-dialog-session-list-button, .background-app-item .close-button {
  transition-duration: 100ms;
  color: #${palette[2]};
  background-color: #${palette[0]}; }
  .app-folder-dialog .folder-name-container .edit-folder-button:focus, .button:focus, .icon-button:focus, .login-dialog-button.cancel-button:focus, .login-dialog-button.switch-user-button:focus, .login-dialog-button.login-dialog-session-list-button:focus, .background-app-item .close-button:focus {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]};
    box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.6) !important; }
    .app-folder-dialog .folder-name-container .edit-folder-button:focus:hover, .button:focus:hover, .icon-button:focus:hover, .login-dialog-button.cancel-button:focus:hover, .login-dialog-button.switch-user-button:focus:hover, .login-dialog-button.login-dialog-session-list-button:focus:hover, .background-app-item .close-button:focus:hover {
      background-color: #${palette[0]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7) !important; }
    .app-folder-dialog .folder-name-container .edit-folder-button:focus:active, .button:focus:active, .icon-button:focus:active, .login-dialog-button.cancel-button:focus:active, .login-dialog-button.switch-user-button:focus:active, .login-dialog-button.login-dialog-session-list-button:focus:active, .background-app-item .close-button:focus:active {
      background-color: #${palette[0]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7) !important; }
  .app-folder-dialog .folder-name-container .edit-folder-button:hover, .button:hover, .icon-button:hover, .login-dialog-button.cancel-button:hover, .login-dialog-button.switch-user-button:hover, .login-dialog-button.login-dialog-session-list-button:hover, .background-app-item .close-button:hover {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]}; }
  .app-folder-dialog .folder-name-container .edit-folder-button:insensitive, .button:insensitive, .icon-button:insensitive, .login-dialog-button.cancel-button:insensitive, .login-dialog-button.switch-user-button:insensitive, .login-dialog-button.login-dialog-session-list-button:insensitive, .background-app-item .close-button:insensitive {
    transition-duration: 100ms;
    color: rgba(255, 255, 255, 0.5);
    background-color: rgba(255, 255, 255, 0.05); }
  .app-folder-dialog .folder-name-container .edit-folder-button:selected, .button:selected, .icon-button:selected, .login-dialog-button.cancel-button:selected, .login-dialog-button.switch-user-button:selected, .login-dialog-button.login-dialog-session-list-button:selected, .background-app-item .close-button:selected, .app-folder-dialog .folder-name-container .edit-folder-button:active, .button:active, .icon-button:active, .login-dialog-button.cancel-button:active, .login-dialog-button.switch-user-button:active, .login-dialog-button.login-dialog-session-list-button:active, .background-app-item .close-button:active {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]}; }
  .app-folder-dialog .folder-name-container .edit-folder-button:checked, .button:checked, .icon-button:checked, .login-dialog-button.cancel-button:checked, .login-dialog-button.switch-user-button:checked, .login-dialog-button.login-dialog-session-list-button:checked, .background-app-item .close-button:checked {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]}; }
    .app-folder-dialog .folder-name-container .edit-folder-button:checked:hover, .button:checked:hover, .icon-button:checked:hover, .login-dialog-button.cancel-button:checked:hover, .login-dialog-button.switch-user-button:checked:hover, .login-dialog-button.login-dialog-session-list-button:checked:hover, .background-app-item .close-button:checked:hover {
      background-color: #${palette[3]}; }
    .app-folder-dialog .folder-name-container .edit-folder-button:checked:active, .button:checked:active, .icon-button:checked:active, .login-dialog-button.cancel-button:checked:active, .login-dialog-button.switch-user-button:checked:active, .login-dialog-button.login-dialog-session-list-button:checked:active, .background-app-item .close-button:checked:active {
      background-color: #${palette[3]}; }
  .app-folder-dialog .folder-name-container .flat.edit-folder-button, .flat.button, .flat.icon-button, .flat.login-dialog-button.cancel-button, .flat.login-dialog-button.switch-user-button, .flat.login-dialog-button.login-dialog-session-list-button, .background-app-item .flat.close-button {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]};
    background-color: transparent; }
    .app-folder-dialog .folder-name-container .flat.edit-folder-button:focus, .flat.button:focus, .flat.icon-button:focus, .flat.login-dialog-button.cancel-button:focus, .flat.login-dialog-button.switch-user-button:focus, .flat.login-dialog-button.login-dialog-session-list-button:focus, .background-app-item .flat.close-button:focus {
      transition-duration: 100ms;
      color: #${palette[2]};
      background-color: #${palette[0]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.6) !important; }
      .app-folder-dialog .folder-name-container .flat.edit-folder-button:focus:hover, .flat.button:focus:hover, .flat.icon-button:focus:hover, .flat.login-dialog-button.cancel-button:focus:hover, .flat.login-dialog-button.switch-user-button:focus:hover, .flat.login-dialog-button.login-dialog-session-list-button:focus:hover, .background-app-item .flat.close-button:focus:hover {
        background-color: #${palette[0]};
        box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7) !important; }
      .app-folder-dialog .folder-name-container .flat.edit-folder-button:focus:active, .flat.button:focus:active, .flat.icon-button:focus:active, .flat.login-dialog-button.cancel-button:focus:active, .flat.login-dialog-button.switch-user-button:focus:active, .flat.login-dialog-button.login-dialog-session-list-button:focus:active, .background-app-item .flat.close-button:focus:active {
        background-color: #${palette[0]};
        box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7) !important; }
    .app-folder-dialog .folder-name-container .flat.edit-folder-button:hover, .flat.button:hover, .flat.icon-button:hover, .flat.login-dialog-button.cancel-button:hover, .flat.login-dialog-button.switch-user-button:hover, .flat.login-dialog-button.login-dialog-session-list-button:hover, .background-app-item .flat.close-button:hover {
      transition-duration: 100ms;
      color: #${palette[2]};
      background-color: #${palette[0]}; }
    .app-folder-dialog .folder-name-container .flat.edit-folder-button:insensitive, .flat.button:insensitive, .flat.icon-button:insensitive, .flat.login-dialog-button.cancel-button:insensitive, .flat.login-dialog-button.switch-user-button:insensitive, .flat.login-dialog-button.login-dialog-session-list-button:insensitive, .background-app-item .flat.close-button:insensitive {
      transition-duration: 100ms;
      color: rgba(255, 255, 255, 0.5);
      background-color: rgba(255, 255, 255, 0.05); }
    .app-folder-dialog .folder-name-container .flat.edit-folder-button:selected, .flat.button:selected, .flat.icon-button:selected, .flat.login-dialog-button.cancel-button:selected, .flat.login-dialog-button.switch-user-button:selected, .flat.login-dialog-button.login-dialog-session-list-button:selected, .background-app-item .flat.close-button:selected, .app-folder-dialog .folder-name-container .flat.edit-folder-button:active, .flat.button:active, .flat.icon-button:active, .flat.login-dialog-button.cancel-button:active, .flat.login-dialog-button.switch-user-button:active, .flat.login-dialog-button.login-dialog-session-list-button:active, .background-app-item .flat.close-button:active {
      transition-duration: 100ms;
      color: #${palette[2]};
      background-color: #${palette[0]}; }
    .app-folder-dialog .folder-name-container .flat.edit-folder-button:checked, .flat.button:checked, .flat.icon-button:checked, .flat.login-dialog-button.cancel-button:checked, .flat.login-dialog-button.switch-user-button:checked, .flat.login-dialog-button.login-dialog-session-list-button:checked, .background-app-item .flat.close-button:checked {
      transition-duration: 100ms;
      color: #${palette[2]};
      background-color: #${palette[0]}; }
      .app-folder-dialog .folder-name-container .flat.edit-folder-button:checked:hover, .flat.button:checked:hover, .flat.icon-button:checked:hover, .flat.login-dialog-button.cancel-button:checked:hover, .flat.login-dialog-button.switch-user-button:checked:hover, .flat.login-dialog-button.login-dialog-session-list-button:checked:hover, .background-app-item .flat.close-button:checked:hover {
        background-color: #${palette[3]}; }
      .app-folder-dialog .folder-name-container .flat.edit-folder-button:checked:active, .flat.button:checked:active, .flat.icon-button:checked:active, .flat.login-dialog-button.cancel-button:checked:active, .flat.login-dialog-button.switch-user-button:checked:active, .flat.login-dialog-button.login-dialog-session-list-button:checked:active, .background-app-item .flat.close-button:checked:active {
        background-color: #${palette[3]}; }

.login-dialog-prompt-entry, .search-entry, .lg-dialog StEntry, StEntry {
  border-radius: 8px;
  padding: 9px 9px;
  selection-background-color: #${palette[7]};
  selected-color: #${palette[2]}; }

StEntry {
  transition-duration: 100ms;
  background-color: rgba(255, 255, 255, 0.15);
  color: rgba(255, 255, 255, 0.7); }
  StEntry:hover {
    transition-duration: 100ms;
    background-color: rgba(255, 255, 255, 0.25); }
  StEntry:focus {
    transition-duration: 100ms;
    background-color: rgba(201, 222, 248, 0.2875);
    box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7);
    color: #${palette[2]}; }
  StEntry:insensitive {
    transition-duration: 100ms;
    background-color: rgba(255, 255, 255, 0.25);
    color: rgba(255, 255, 255, 0.5); }
  StEntry StLabel.hint-text {
    color: rgba(255, 255, 255, 0.7); }

.modal-dialog .modal-dialog-linked-button, .hotplug-notification-item, .notification-banner .notification-button {
  padding: 12px;
  font-weight: bold !important;
  transition-duration: 100ms;
  color: #${palette[2]};
  background-color: #${palette[0]}; }
  .modal-dialog .modal-dialog-linked-button:ltr, .hotplug-notification-item:ltr, .notification-banner .notification-button:ltr {
    margin-right: 1px; }
  .modal-dialog .modal-dialog-linked-button:rtl, .hotplug-notification-item:rtl, .notification-banner .notification-button:rtl {
    margin-left: 1px; }
  .modal-dialog .modal-dialog-linked-button:insensitive, .hotplug-notification-item:insensitive, .notification-banner .notification-button:insensitive {
    transition-duration: 100ms;
    color: rgba(255, 255, 255, 0.5);
    background-color: rgba(255, 255, 255, 0.05); }
  .modal-dialog .modal-dialog-linked-button:focus, .hotplug-notification-item:focus, .notification-banner .notification-button:focus {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[1]};
    box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.6) !important; }
    .modal-dialog .modal-dialog-linked-button:focus:hover, .hotplug-notification-item:focus:hover, .notification-banner .notification-button:focus:hover {
      background-color: #${palette[1]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7) !important; }
    .modal-dialog .modal-dialog-linked-button:focus:active, .hotplug-notification-item:focus:active, .notification-banner .notification-button:focus:active {
      background-color: #${palette[1]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7) !important; }
  .modal-dialog .modal-dialog-linked-button:hover, .hotplug-notification-item:hover, .notification-banner .notification-button:hover {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[1]}; }
  .modal-dialog .modal-dialog-linked-button:active, .hotplug-notification-item:active, .notification-banner .notification-button:active {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[1]}; }
  .modal-dialog .modal-dialog-linked-button:checked, .hotplug-notification-item:checked, .notification-banner .notification-button:checked {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[1]}; }
    .modal-dialog .modal-dialog-linked-button:checked:hover, .hotplug-notification-item:checked:hover, .notification-banner .notification-button:checked:hover {
      background-color: #${palette[1]}; }
    .modal-dialog .modal-dialog-linked-button:checked:active, .hotplug-notification-item:checked:active, .notification-banner .notification-button:checked:active {
      background-color: #${palette[1]}; }
  .modal-dialog .modal-dialog-linked-button:first-child:ltr, .hotplug-notification-item:first-child:ltr, .notification-banner .notification-button:first-child:ltr {
    border-radius: 0 0 0 16px; }
  .modal-dialog .modal-dialog-linked-button:last-child:ltr, .hotplug-notification-item:last-child:ltr, .notification-banner .notification-button:last-child:ltr {
    border-radius: 0 0 16px;
    margin-right: 0 !important; }
  .modal-dialog .modal-dialog-linked-button:first-child:rtl, .hotplug-notification-item:first-child:rtl, .notification-banner .notification-button:first-child:rtl {
    border-radius: 0 0 16px; }
  .modal-dialog .modal-dialog-linked-button:last-child:rtl, .hotplug-notification-item:last-child:rtl, .notification-banner .notification-button:last-child:rtl {
    border-radius: 0 0 0 16px;
    margin-left: 0 !important; }
  .modal-dialog .modal-dialog-linked-button:first-child:last-child, .hotplug-notification-item:first-child:last-child, .notification-banner .notification-button:first-child:last-child {
    border-radius: 0 0 16px 16px;
    margin-left: 0 !important;
    margin-right: 0 !important; }

.dash-label, .window-caption {
  background-color: rgba(0, 0, 0, 0.9);
  color: #${palette[2]};
  border-radius: 99px;
  padding: 6px 12px;
  text-align: center; }

/* General Typography */
.user-widget.vertical .user-widget-label, .unlock-dialog-clock .unlock-dialog-clock-date, .app-folder-dialog .folder-name-container .folder-name-label, .app-folder-dialog .folder-name-container .folder-name-entry, .search-statustext {
  font-weight: 800;
  font-size: 20pt; }

.lg-debug-flags-header, .message-dialog-content .message-dialog-title, .message-list .message-list-placeholder, .datemenu-today-button .date-label {
  font-weight: 800;
  font-size: 15pt; }

.user-widget.horizontal .user-widget-label, .quick-toggle-menu .header .title {
  font-weight: 700;
  font-size: 15pt; }

.bt-menu-placeholder.popup-menu-item, .message-dialog-content .message-dialog-title.lightweight, .headline {
  font-weight: 700;
  font-size: 13pt; }

.lg-extension-name, .background-app-item .title, .osd-window, .dialog-list .dialog-list-title, .message-list-controls, .weather-button .weather-forecast-temp, .weather-button .weather-header, .world-clocks-button .world-clocks-time, .world-clocks-button .world-clocks-header, .events-button .events-title, .calendar .calendar-month-header .calendar-month-label, .datemenu-today-button .day-label, .popup-menu-ornament {
  font-weight: 700;
  font-size: 11pt; }

.quick-toggle-menu .header .subtitle, .app-menu .popup-inactive-menu-item:first-child > StLabel {
  font-weight: 700;
  font-size: 9pt; }

.lg-completions-text, .caps-lock-warning-label, #dash, .background-app-item .subtitle, .icon-label-button-container, .prompt-dialog-error-label,
.prompt-dialog-info-label,
.prompt-dialog-null-label, .run-dialog .run-dialog-description, .dialog-list .dialog-list-box .dialog-list-item .dialog-list-item-description, .weather-button .weather-forecast-time, .world-clocks-button .world-clocks-timezone, .events-button .event-time {
  font-weight: 400;
  font-size: 9pt; }

.calendar .calendar-day-base.calendar-day-heading, .calendar .calendar-day-base {
  font-weight: 400;
  font-size: 8pt; }

.unlock-dialog-clock .unlock-dialog-clock-time, #panel, .weather-button .weather-forecast-time, .world-clocks-button .world-clocks-timezone, .world-clocks-button .world-clocks-time, .events-button .event-time, .calendar .calendar-day-base {
  font-feature-settings: "tnum"; }

/* OSD Elements */
#LookingGlassDialog, .screenshot-ui-panel, .workspace-switcher, .switcher-list, .resize-popup, .osd-monitor-label, .osd-window {
  color: #${palette[2]};
  background-color: #${palette[0]};
  border: 1px solid rgba(255, 255, 255, 0.02);
  border-radius: 999px;
  padding: 12px; }

.lg-dialog StEntry {
  transition-duration: 100ms;
  background-color: rgba(255, 255, 255, 0.15);
  color: rgba(255, 255, 255, 0.7); }
  .lg-dialog StEntry:hover {
    transition-duration: 100ms;
    background-color: rgba(255, 255, 255, 0.25); }
  .lg-dialog StEntry:focus {
    transition-duration: 100ms;
    background-color: rgba(201, 222, 248, 0.2875);
    box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7);
    color: #${palette[2]}; }
  .lg-dialog StEntry:insensitive {
    transition-duration: 100ms;
    background-color: rgba(255, 255, 255, 0.25);
    color: rgba(255, 255, 255, 0.5); }
  .lg-dialog StEntry StLabel.hint-text {
    color: rgba(255, 255, 255, 0.7); }

#LookingGlassDialog .notebook-tab, #LookingGlassDialog > #Toolbar .lg-toolbar-button, .screenshot-ui-show-pointer-button, .screenshot-ui-type-button {
  transition-duration: 100ms;
  color: #${palette[2]};
  background-color: #${palette[0]}; }
  #LookingGlassDialog .notebook-tab:insensitive, #LookingGlassDialog > #Toolbar .lg-toolbar-button:insensitive, .screenshot-ui-show-pointer-button:insensitive, .screenshot-ui-type-button:insensitive {
    transition-duration: 100ms;
    color: rgba(255, 255, 255, 0.5);
    background-color: rgba(255, 255, 255, 0.05); }
  #LookingGlassDialog .notebook-tab:focus, #LookingGlassDialog > #Toolbar .lg-toolbar-button:focus, .screenshot-ui-show-pointer-button:focus, .screenshot-ui-type-button:focus {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]};
    box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.6) !important; }
    #LookingGlassDialog .notebook-tab:focus:hover, #LookingGlassDialog > #Toolbar .lg-toolbar-button:focus:hover, .screenshot-ui-show-pointer-button:focus:hover, .screenshot-ui-type-button:focus:hover {
      background-color: #${palette[0]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7) !important; }
    #LookingGlassDialog .notebook-tab:focus:active, #LookingGlassDialog > #Toolbar .lg-toolbar-button:focus:active, .screenshot-ui-show-pointer-button:focus:active, .screenshot-ui-type-button:focus:active {
      background-color: #${palette[0]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7) !important; }
  #LookingGlassDialog .notebook-tab:hover, #LookingGlassDialog > #Toolbar .lg-toolbar-button:hover, .screenshot-ui-show-pointer-button:hover, .screenshot-ui-type-button:hover {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]}; }
  #LookingGlassDialog .notebook-tab:active, #LookingGlassDialog > #Toolbar .lg-toolbar-button:active, .screenshot-ui-show-pointer-button:active, .screenshot-ui-type-button:active {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]}; }
  #LookingGlassDialog .notebook-tab:outlined, #LookingGlassDialog > #Toolbar .lg-toolbar-button:outlined, .screenshot-ui-show-pointer-button:outlined, .screenshot-ui-type-button:outlined, #LookingGlassDialog .notebook-tab:checked, #LookingGlassDialog > #Toolbar .lg-toolbar-button:checked, .screenshot-ui-show-pointer-button:checked, .screenshot-ui-type-button:checked {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]}; }
    #LookingGlassDialog .notebook-tab:outlined:hover, #LookingGlassDialog > #Toolbar .lg-toolbar-button:outlined:hover, .screenshot-ui-show-pointer-button:outlined:hover, .screenshot-ui-type-button:outlined:hover, #LookingGlassDialog .notebook-tab:checked:hover, #LookingGlassDialog > #Toolbar .lg-toolbar-button:checked:hover, .screenshot-ui-show-pointer-button:checked:hover, .screenshot-ui-type-button:checked:hover {
      background-color: #${palette[3]}; }
    #LookingGlassDialog .notebook-tab:outlined:active, #LookingGlassDialog > #Toolbar .lg-toolbar-button:outlined:active, .screenshot-ui-show-pointer-button:outlined:active, .screenshot-ui-type-button:outlined:active, #LookingGlassDialog .notebook-tab:checked:active, #LookingGlassDialog > #Toolbar .lg-toolbar-button:checked:active, .screenshot-ui-show-pointer-button:checked:active, .screenshot-ui-type-button:checked:active {
      background-color: #${palette[3]}; }

.screenshot-ui-show-pointer-button, .screenshot-ui-type-button {
  transition-duration: 100ms;
  background-color: transparent;
  background-color: none;
  box-shadow: none; }
  .screenshot-ui-show-pointer-button:insensitive, .screenshot-ui-type-button:insensitive {
    transition-duration: 100ms;
    color: rgba(255, 255, 255, 0.5);
    background-color: rgba(255, 255, 255, 0.05);
    background-color: transparent;
    color: rgba(255, 255, 255, 0.5); }
  .screenshot-ui-show-pointer-button:insensitive, .screenshot-ui-type-button:insensitive {
    transition-duration: 100ms;
    background-color: transparent;
    background-color: none;
    box-shadow: none; }
    .screenshot-ui-show-pointer-button:insensitive:insensitive, .screenshot-ui-type-button:insensitive:insensitive {
      transition-duration: 100ms;
      color: rgba(255, 255, 255, 0.5);
      background-color: rgba(255, 255, 255, 0.05);
      background-color: transparent;
      color: rgba(255, 255, 255, 0.5); }

/* System Elements */
.login-dialog-prompt-entry, .search-entry {
  transition-duration: 100ms;
  background-color: rgba(246, 245, 244, 0.15);
  color: rgba(246, 245, 244, 0.7); }
  .login-dialog-prompt-entry:hover, .search-entry:hover {
    transition-duration: 100ms;
    background-color: rgba(246, 245, 244, 0.25); }
  .login-dialog-prompt-entry:focus, .search-entry:focus {
    transition-duration: 100ms;
    background-color: rgba(194, 215, 240, 0.2875);
    box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7);
    color: #${palette[2]}; }
  .login-dialog-prompt-entry:insensitive, .search-entry:insensitive {
    transition-duration: 100ms;
    background-color: rgba(246, 245, 244, 0.25);
    color: rgba(246, 245, 244, 0.5); }
  .login-dialog-prompt-entry StLabel.hint-text, .search-entry StLabel.hint-text {
    color: rgba(246, 245, 244, 0.7); }

.login-dialog-button.cancel-button, .login-dialog-button.switch-user-button, .login-dialog-button.login-dialog-session-list-button {
  transition-duration: 100ms;
  color: #${palette[2]};
  background-color: #${palette[1]}; }
  .login-dialog-button.cancel-button:insensitive, .login-dialog-button.switch-user-button:insensitive, .login-dialog-button.login-dialog-session-list-button:insensitive {
    transition-duration: 100ms;
    color: rgba(246, 245, 244, 0.5);
    background-color: rgba(246, 245, 244, 0.05); }
  .login-dialog-button.cancel-button:focus, .login-dialog-button.switch-user-button:focus, .login-dialog-button.login-dialog-session-list-button:focus {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[1]};
    box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.6) !important; }
    .login-dialog-button.cancel-button:focus:hover, .login-dialog-button.switch-user-button:focus:hover, .login-dialog-button.login-dialog-session-list-button:focus:hover {
      background-color: #${palette[3]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7) !important; }
    .login-dialog-button.cancel-button:focus:active, .login-dialog-button.switch-user-button:focus:active, .login-dialog-button.login-dialog-session-list-button:focus:active {
      background-color: #${palette[3]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7) !important; }
  .login-dialog-button.cancel-button:hover, .login-dialog-button.switch-user-button:hover, .login-dialog-button.login-dialog-session-list-button:hover {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[1]}; }
  .login-dialog-button.cancel-button:active, .login-dialog-button.switch-user-button:active, .login-dialog-button.login-dialog-session-list-button:active {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[1]}; }
  .login-dialog-button.cancel-button:outlined, .login-dialog-button.switch-user-button:outlined, .login-dialog-button.login-dialog-session-list-button:outlined, .login-dialog-button.cancel-button:checked, .login-dialog-button.switch-user-button:checked, .login-dialog-button.login-dialog-session-list-button:checked {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[1]}; }
    .login-dialog-button.cancel-button:outlined:hover, .login-dialog-button.switch-user-button:outlined:hover, .login-dialog-button.login-dialog-session-list-button:outlined:hover, .login-dialog-button.cancel-button:checked:hover, .login-dialog-button.switch-user-button:checked:hover, .login-dialog-button.login-dialog-session-list-button:checked:hover {
      background-color: #${palette[1]}; }
    .login-dialog-button.cancel-button:outlined:active, .login-dialog-button.switch-user-button:outlined:active, .login-dialog-button.login-dialog-session-list-button:outlined:active, .login-dialog-button.cancel-button:checked:active, .login-dialog-button.switch-user-button:checked:active, .login-dialog-button.login-dialog-session-list-button:checked:active {
      background-color: #${palette[1]}; }

/* WIDGETS */
.shell-link {
  color: #${palette[7]}; }
  .shell-link:hover {
    color: #${palette[7]}; }

.lowres-icon {
  icon-shadow: 0 1px 2px rgba(0, 0, 0, 0.3); }

.icon-dropshadow {
  icon-shadow: 0 1px 5px rgba(0, 0, 0, 0.8); }

/* Entries */
StEntry StIcon.capslock-warning {
  icon-size: 1.09em;
  warning-color: #${palette[5]};
  padding: 0 4px; }

StEntry StIcon.peek-password {
  icon-size: 1.09em;
  padding: 0 4px; }

StEntry StLabel.hint-text {
  margin-left: 2px; }

/* Buttons */
.button, .icon-button, .login-dialog-button.cancel-button, .login-dialog-button.switch-user-button, .login-dialog-button.login-dialog-session-list-button, .background-app-item .close-button {
  min-height: 22px; }

.icon-button, .login-dialog-button.cancel-button, .login-dialog-button.switch-user-button, .login-dialog-button.login-dialog-session-list-button, .background-app-item .close-button {
  border-radius: 99px;
  padding: 12px;
  min-height: 16px; }
  .icon-button StIcon, .login-dialog-button.cancel-button StIcon, .login-dialog-button.switch-user-button StIcon, .login-dialog-button.login-dialog-session-list-button StIcon, .background-app-item .close-button StIcon {
    icon-size: 1.09em;
    -st-icon-style: symbolic; }

/* Check Boxes */
.check-box StBoxLayout {
  spacing: .8em; }

.check-box StBin {
  width: 24px;
  height: 24px;
  background-image: url("resource:///org/gnome/shell/theme/checkbox-off.svg"); }

.check-box:focus StBin {
  background-image: url("resource:///org/gnome/shell/theme/checkbox-off-focused.svg"); }

.check-box:checked StBin {
  background-image: url("resource:///org/gnome/shell/theme/checkbox.svg"); }

.check-box:focus:checked StBin {
  background-image: url("resource:///org/gnome/shell/theme/checkbox-focused.svg"); }

/* Switches */
.toggle-switch {
  color: #${palette[2]};
  height: 26px;
  width: 48px;
  background-size: contain;
  background-image: url("resource:///org/gnome/shell/theme/toggle-off.svg"); }
  .toggle-switch:checked {
    background-image: url("resource:///org/gnome/shell/theme/toggle-on.svg"); }

/* Slider */
.slider {
  -barlevel-height: 4px;
  -barlevel-background-color: rgba(255, 255, 255, 0.2);
  -barlevel-border-width: 2px;
  -barlevel-border-color: transparent;
  -barlevel-active-background-color: #${palette[7]};
  -barlevel-active-border-color: transparent;
  -barlevel-overdrive-color: #${palette[4]};
  -barlevel-overdrive-border-color: transparent;
  -barlevel-overdrive-separator-width: 1px;
  -slider-handle-radius: 8px;
  -slider-handle-border-width: 0;
  -slider-handle-border-color: transparent; }

/* Scrollbars */
StScrollView.vfade {
  -st-vfade-offset: 68px; }

StScrollView.hfade {
  -st-hfade-offset: 68px; }

StScrollBar {
  padding: 0; }
  StScrollView StScrollBar {
    min-width: 8px;
    min-height: 8px; }
  StScrollBar StBin#trough {
    border-radius: 0;
    background-color: transparent; }
  StScrollBar StButton#vhandle, StScrollBar StButton#hhandle {
    border-radius: 8px;
    background-color: #${palette[1]};
    border: 3px solid transparent;
    transition: 500ms all ease; }
    StScrollBar StButton#vhandle:hover, StScrollBar StButton#hhandle:hover {
      background-color: #${palette[3]}; }
    StScrollBar StButton#vhandle:active, StScrollBar StButton#hhandle:active {
      background-color: #${palette[1]}; }

/* Popovers/Menus */
.popup-menu-boxpointer, .candidate-popup-boxpointer {
  -arrow-rise: 6px; }

.popup-menu {
  min-width: 15em;
  color: #${palette[2]}; }
  .popup-menu.panel-menu {
    margin-bottom: 1.75em; }

.popup-menu-content, .candidate-popup-content {
  padding: 6px;
  background-color: #${palette[0]};
  border-radius: 20px;
  border: 1px solid #${palette[2]};
  box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2); }

.popup-menu-item {
  font-weight: normal;
  spacing: 6px;
  transition-duration: 100ms;
  padding: 9px 12px;
  transition-duration: 100ms;
  background-color: transparent;
  background-color: none;
  box-shadow: none;
  box-shadow: none !important;
  border-radius: 12px; }
  .popup-menu-item:ltr {
    padding-left: 6px; }
  .popup-menu-item:rtl {
    padding-right: 6px; }
  .popup-menu-item:insensitive {
    transition-duration: 100ms;
    color: rgba(255, 255, 255, 0.5);
    background-color: rgba(255, 255, 255, 0.05);
    background-color: transparent;
    color: rgba(255, 255, 255, 0.5); }
  .popup-menu-item:focus, .popup-menu-item:hover {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[1]}; }
  .popup-menu-item:active {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[1]}; }
  .popup-menu-item:checked {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[1]}; }
    .popup-menu-item:checked:hover {
      background-color: #${palette[1]}; }
    .popup-menu-item:checked:active {
      background-color: #${palette[1]}; }
  .popup-menu-item:checked {
    border-radius: 12px 12px 0 0 !important; }
  .popup-menu-item .toggle-switch:ltr {
    margin-left: 4px; }
  .popup-menu-item .toggle-switch:rtl {
    margin-right: 4px; }

.popup-inactive-menu-item {
  color: #${palette[2]}; }
  .popup-inactive-menu-item:insensitive {
    color: #${palette[3]}; }

.popup-menu-arrow,
.popup-menu-icon {
  icon-size: 16px !important; }

.popup-sub-menu {
  border-radius: 0 0 13px 13px;
  margin-bottom: 6px; }
  .popup-sub-menu .popup-menu-ornament {
    min-width: 1.09em !important; }
  .popup-sub-menu .popup-menu-item {
    border-radius: 0;
    font-weight: normal;
    spacing: 6px;
    transition-duration: 100ms;
    padding: 9px 12px;
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[1]};
    border-top-width: 0; }
    .popup-sub-menu .popup-menu-item:ltr {
      padding-left: 6px; }
    .popup-sub-menu .popup-menu-item:rtl {
      padding-right: 6px; }
    .popup-sub-menu .popup-menu-item:focus, .popup-sub-menu .popup-menu-item:hover {
      transition-duration: 100ms;
      color: #${palette[2]};
      background-color: #${palette[1]}; }
    .popup-sub-menu .popup-menu-item:active {
      transition-duration: 100ms;
      color: #${palette[2]};
      background-color: #${palette[1]}; }
    .popup-sub-menu .popup-menu-item:checked {
      transition-duration: 100ms;
      color: #${palette[2]};
      background-color: #${palette[1]}; }
      .popup-sub-menu .popup-menu-item:checked:hover {
        background-color: #${palette[1]}; }
      .popup-sub-menu .popup-menu-item:checked:active {
        background-color: #${palette[1]}; }
    .popup-sub-menu .popup-menu-item:last-child {
      border-radius: 0 0 12px 12px;
      border-bottom-width: 0; }
  .popup-sub-menu .popup-menu-section .popup-menu-item:last-child:hover, .popup-sub-menu .popup-menu-section .popup-menu-item:last-child:focus {
    border-radius: 0; }
  .popup-sub-menu .popup-menu-section:last-child .popup-menu-item:last-child {
    border-radius: 0 0 12px 12px; }

.popup-menu-ornament {
  width: 1.2em;
  text-align: center !important; }
  .popup-menu-ornament:ltr {
    text-align: right; }
  .popup-menu-ornament:rtl {
    text-align: left; }

.popup-separator-menu-item {
  border: none !important; }
  .popup-separator-menu-item .popup-separator-menu-item-separator {
    height: 1px;
    background-color: rgba(255, 255, 255, 0.1); }
  .popup-separator-menu-item .popup-menu-ornament {
    width: 0 !important; }
  .popup-sub-menu .popup-separator-menu-item {
    background-color: transparent; }
    .popup-sub-menu .popup-separator-menu-item:ltr {
      margin-right: 2.5em; }
    .popup-sub-menu .popup-separator-menu-item:rtl {
      margin-left: 2.5em; }
    .popup-sub-menu .popup-separator-menu-item .popup-separator-menu-item-separator {
      background-color: rgba(255, 255, 255, 0.1); }

.background-menu {
  -boxpointer-gap: 0px;
  -arrow-rise: 0px; }

.app-menu {
  max-width: 27.25em; }
  .app-menu .popup-menu-ornament {
    width: 0 !important; }
  .app-menu .popup-inactive-menu-item:first-child > StLabel:ltr {
    margin-right: 8px; }
  .app-menu .popup-inactive-menu-item:first-child > StLabel:rtl {
    margin-left: 8px; }

/* Date/Time Menu */
#calendarArea {
  padding: 4px; }

.datemenu-calendar-column {
  color: #${palette[2]};
  spacing: 6px; }
  .datemenu-calendar-column:ltr {
    padding-left: 6px; }
  .datemenu-calendar-column:rtl {
    padding-right: 6px; }
  .datemenu-calendar-column .datemenu-displays-box {
    spacing: 6px; }

/* today button (the date) */
.datemenu-today-button {
  color: #${palette[2]};
  border-radius: 12px;
  margin: 4px;
  transition-duration: 100ms;
  background-color: transparent;
  background-color: none;
  box-shadow: none;
  box-shadow: none !important;
  padding: 9px; }
  .datemenu-today-button:insensitive {
    transition-duration: 100ms;
    color: #${palette[2]}; 
    background-color: rgba(255, 255, 255, 0.05);
    background-color: transparent;
    color: #${palette[2]}; }
  .datemenu-today-button:hover {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]}; }
  .datemenu-today-button:active {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]}; }
  .datemenu-today-button:focus {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]};
    box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.6) !important; }
    .datemenu-today-button:focus:hover {
      background-color: #${palette[0]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7) !important; }
    .datemenu-today-button:focus:active {
      background-color: #${palette[0]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7) !important; }
  .datemenu-today-button:insensitive {
    transition-duration: 100ms;
    color: #${palette[2]}; 
    background-color: rgba(255, 255, 255, 0.05);
    background-color: transparent; }

/* Calendar */
.calendar {
  color: #${palette[2]};
  border-radius: 12px;
  margin: 4px;
  transition-duration: 100ms;
  background-color: transparent;
  background-color: none;
  box-shadow: none;
  box-shadow: none !important;
  margin-top: 0; }
  .calendar:insensitive {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: rgba(255, 255, 255, 0.05);
    background-color: transparent;
    color: #${palette[2]}; }
  .calendar:hover {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]}; }
  .calendar:active {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]}; }
  .calendar:focus {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]};
    box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.6) !important; }
    .calendar:focus:hover {
      background-color: #${palette[0]};
      color: #${palette[2]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7) !important; }
    .calendar:focus:active {
      background-color: #${palette[0]};
      color: #${palette[2]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7) !important; }
  .calendar:insensitive {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: rgba(255, 255, 255, 0.05);
    background-color: transparent; }
  .calendar .calendar-month-header .calendar-change-month-back StIcon,
  .calendar .calendar-month-header .calendar-change-month-forward StIcon {
    icon-size: 1.09em; }
  .calendar .calendar-month-header .calendar-month-label {
    padding: 8px 0; }
  .calendar .calendar-month-header .pager-button {
    background-color: transparent;
    height: 32px;
    width: 32px;
    margin: 2px;
    border-radius: 8px; }
    .calendar .calendar-month-header .pager-button:hover, .calendar .calendar-month-header .pager-button:focus {
      background-color: #${palette[1]}; }
    .calendar .calendar-month-header .pager-button:active {
      background-color: #${palette[0]}; }
  .calendar .calendar-day-base {
    color: #${palette[2]};
    text-align: center;
    margin: 2px;
    padding: 0 !important;
    height: 3em !important;
    width: 3em !important;
    border-radius: 99px;
    transition-duration: 100ms; }
    .calendar .calendar-day-base:hover {
      background-color: #${palette[1]}; }
    .calendar .calendar-day-base:focus {
      background-color: #${palette[7]};
      color: #${palette[0]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.6); }
    .calendar .calendar-day-base:active, .calendar .calendar-day-base:selected {
      color: #${palette[0]};
      background-color: #${palette[0]}; }
      .calendar .calendar-day-base:active:focus, .calendar .calendar-day-base:selected:focus {
        background-color: #${palette[8]};
        border-color: #${palette[8]}; }
    .calendar .calendar-day-base.calendar-day-heading {
      color: #${palette[3]};
      padding-top: 6px;
      height: 1.1em !important;
      font-weight: 600; }
  .calendar .calendar-day {
    color: #${palette[2]};
    font-weight: 600; }
  .calendar .calendar-nonwork-day {
    color: #${palette[3]}; }
  .calendar .calendar-other-month-day {
    color: #${palette[3]}; }
    .calendar .calendar-other-month-day.calendar-nonwork-day {
      color: #${palette[3]}; }
  .calendar .calendar-today {
    background-color: #${palette[7]};
    border-color: #${palette[7]};
    font-weight: 800;
    color: #${palette[0]} !important; }
    .calendar .calendar-today:hover, .calendar .calendar-today:focus {
      background-color: #${palette[7]};
      color: inherit; }
    .calendar .calendar-today:active, .calendar .calendar-today:selected {
      background-color: #${palette[8]};
      border-color: #${palette[8]};
      color: inherit; }
      .calendar .calendar-today:active:hover, .calendar .calendar-today:active:focus, .calendar .calendar-today:selected:hover, .calendar .calendar-today:selected:focus {
        background-color: #${palette[8]};
        border-color: #${palette[8]};
        color: inherit; }
  .calendar .calendar-day-with-events {
    background-image: url("resource:///org/gnome/shell/theme/calendar-today.svg");
    background-size: contain; }
  .calendar .calendar-week-number {
    font-size: 7pt;
    font-weight: bold;
    font-feature-settings: "tnum";
    margin: 6px;
    padding: 0 6px;
    border-radius: 3px;
    background-color: rgba(255, 255, 255, 0.1);
    color: #${palette[2]}; }

/* Events */
.events-button {
  border-radius: 12px;
  margin: 4px;
  transition-duration: 100ms;
  color: #${palette[2]};
  background-color: #${palette[0]};
  padding: 12px; }
  .events-button:hover {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]}; }
  .events-button:active {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]}; }
  .events-button:focus {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]};
    box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.6) !important; }
    .events-button:focus:hover {
      background-color: #${palette[0]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7) !important; }
    .events-button:focus:active {
      background-color: #${palette[0]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7) !important; }
  .events-button:insensitive {
    transition-duration: 100ms;
    color: rgba(255, 255, 255, 0.5);
    background-color: rgba(255, 255, 255, 0.05); }
  .events-button .events-box {
    spacing: 6px; }
  .events-button .events-list {
    spacing: 12px;
    color: #${palette[2]}; }
  .events-button .events-title {
    margin-bottom: 4px; }
  .events-button .event-time {
    color: #${palette[3]}; }

/* World clocks */
.world-clocks-button {
  border-radius: 12px;
  margin: 4px;
  transition-duration: 100ms;
  color: #${palette[2]};
  background-color: #${palette[0]};
  padding: 12px; }
  .world-clocks-button:hover {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]}; }
  .world-clocks-button:active {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]}; }
  .world-clocks-button:focus {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]};
    box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.6) !important; }
    .world-clocks-button:focus:hover {
      background-color: #${palette[0]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7) !important; }
    .world-clocks-button:focus:active {
      background-color: #${palette[0]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7) !important; }
  .world-clocks-button:insensitive {
    transition-duration: 100ms;
    color: rgba(255, 255, 255, 0.5);
    background-color: rgba(255, 255, 255, 0.05); }
  .world-clocks-button .world-clocks-grid {
    spacing-rows: 6px;
    spacing-columns: 12px; }
  .world-clocks-button .world-clocks-header {
    color: #${palette[3]}; }
  .world-clocks-button .world-clocks-city {
    color: #${palette[2]}; }
  .world-clocks-button .world-clocks-time {
    color: #${palette[2]}; }
    .world-clocks-button .world-clocks-time:ltr {
      text-align: right; }
    .world-clocks-button .world-clocks-time:rtl {
      text-align: left; }
  .world-clocks-button .world-clocks-timezone {
    color: #${palette[3]}; }

/* Weather */
.weather-button {
  border-radius: 12px;
  margin: 4px;
  transition-duration: 100ms;
  color: #${palette[2]};
  background-color: #${palette[0]};
  padding: 12px; }
  .weather-button:hover {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]}; }
  .weather-button:active {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]}; }
  .weather-button:focus {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]};
    box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.6) !important; }
    .weather-button:focus:hover {
      background-color: #${palette[0]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7) !important; }
    .weather-button:focus:active {
      background-color: #${palette[0]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7) !important; }
  .weather-button:insensitive {
    transition-duration: 100ms;
    color: rgba(255, 255, 255, 0.5);
    background-color: rgba(255, 255, 255, 0.05); }
  .weather-button .weather-box {
    spacing: 10px; }
  .weather-button .weather-header-box {
    spacing: 6px; }
  .weather-button .weather-header {
    color: #${palette[3]}; }
    .weather-button .weather-header.location {
      font-weight: normal; }
  .weather-button .weather-grid {
    spacing-rows: 6px;
    spacing-columns: 12px; }
  .weather-button .weather-forecast-time {
    color: #${palette[3]};
    padding-top: 0.2em;
    padding-bottom: 0.4em; }
  .weather-button .weather-forecast-icon {
    icon-size: 2.18em; }

/* Message List */
.message-list {
  width: 29em;
  border: solid rgba(255, 255, 255, 0.1); }
  .message-list:ltr {
    margin-left: 0;
    margin-right: 4px;
    padding-right: 6px;
    border-right-width: 1px; }
  .message-list:rtl {
    margin-right: 0;
    margin-left: 4px;
    padding-left: 6px;
    border-left-width: 1px; }
  .message-list .message-list-placeholder {
    color: #${palette[3]}; }
    .message-list .message-list-placeholder > StIcon {
      icon-size: 3.27em;
      margin-bottom: 12px;
      -st-icon-style: symbolic; }

.message-list-sections {
  spacing: 6px;
  margin: 0;
  padding-bottom: 6px; }
  .message-list-sections:ltr {
    margin-right: 12px; }
  .message-list-sections:rtl {
    margin-left: 12px; }

.message-list-section,
.message-list-section-list {
  spacing: 6px; }

.message-list-controls {
  padding: 6px;
  spacing: 6px; }
  .message-list-controls .dnd-button {
    border-width: 2px;
    border-color: transparent;
    border-radius: 32px;
    border-style: solid; }
    .message-list-controls .dnd-button:focus {
      border-color: rgba(53, 132, 228, 0.6); }

.message {
  border-radius: 12px;
  margin: 4px;
  transition-duration: 100ms;
  color: #${palette[2]};
  background-color: #${palette[0]}; }
  .message:hover {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]}; }
  .message:active {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]}; }
  .message:focus {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]};
    box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.6) !important; }
    .message:focus:hover {
      background-color: #${palette[0]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7) !important; }
    .message:focus:active {
      background-color: #${palette[0]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7) !important; }
  .message:insensitive {
    transition-duration: 100ms;
    color: rgba(255, 255, 255, 0.5);
    background-color: rgba(255, 255, 255, 0.05); }
  .message .message-icon-bin {
    padding: 18px; }
    .message .message-icon-bin:ltr {
      padding-right: 6px; }
    .message .message-icon-bin:rtl {
      padding-left: 6px; }
    .message .message-icon-bin > StIcon {
      icon-size: 2.18em;
      -st-icon-style: symbolic; }
    .message .message-icon-bin > .fallback-app-icon {
      width: 1.09em;
      height: 1.09em; }
  .message .message-content {
    spacing: 4px;
    padding: 9px;
    margin-bottom: 8px; }
  .message .message-title {
    font-weight: bold;
    /* HACK: the label should be baseline-aligned with a 1em label, fake this with some bottom padding */
    padding-top: 0.57em; }
  .message .message-secondary-bin {
    padding: 0 8px; }
    .message .message-secondary-bin > .event-time {
      color: rgba(255, 255, 255, 0.5);
      font-size: 9pt;
      /* HACK: the label should be baseline-aligned with a 1em label, fake this with some bottom padding */
      padding-bottom: 0.13em; }
      .message .message-secondary-bin > .event-time:ltr {
        text-align: right; }
      .message .message-secondary-bin > .event-time:rtl {
        text-align: left; }
  .message .message-close-button {
    color: #${palette[2]};
    background-color: rgba(255, 255, 255, 0.2);
    border-radius: 99px;
    padding: 5px;
    margin: 1px; }
    .message .message-close-button:hover {
      background-color: rgba(255, 255, 255, 0.3); }
    .message .message-close-button:active {
      background-color: rgba(255, 255, 255, 0.2); }
    .message .message-close-button > StIcon {
      icon-size: 1.09em; }
  .message .message-body {
    color: #${palette[2]}; }

.url-highlighter {
  link-color: #${palette[7]}; }

/* Media Controls */
.message-media-control {
  padding: 0 18px;
  margin: 12px 0;
  border-radius: 8px;
  color: #${palette[2]}; }
  .message-media-control:hover {
    background-color: #${palette[1]};
    color: #${palette[2]}; }
  .message-media-control:active {
    background-color: #${palette[1]};
    color: #${palette[2]}; }
  .message-media-control:insensitive {
    color: #${palette[3]}; }
  .message-media-control:last-child:ltr {
    margin-right: 12px; }
  .message-media-control:last-child:rtl {
    margin-left: 12px; }
  .message-media-control StIcon {
    icon-size: 1.09em; }

.media-message-cover-icon {
  icon-size: 3.27em !important;
  border-radius: 8px; }
  .media-message-cover-icon.fallback {
    color: #${palette[3]};
    background-color: #${palette[0]};
    border: 1px solid transparent;
    border-radius: 8px;
    icon-size: 2.18em !important;
    padding: 14px; }

.candidate-popup-content {
  padding: 6px;
  spacing: 6px; }

.candidate-index {
  padding: 0;
  padding-right: 6px;
  color: #${palette[3]}; }

.candidate-box {
  padding: 6px 12px 6px 12px;
  border-radius: 8px; }
  .candidate-box:selected {
    background-color: #${palette[7]};
    color: #${palette[2]}; }
  .candidate-box:hover {
    background-color: #${palette[1]};
    color: #${palette[2]}; }

.candidate-page-button-box {
  height: 2em; }
  .vertical .candidate-page-button-box {
    padding-top: 12px; }
  .horizontal .candidate-page-button-box {
    padding-left: 12px; }

.candidate-page-button {
  padding: 6px; }
  .candidate-page-button StIcon {
    icon-size: 1.09em; }

.candidate-page-button-previous {
  border-radius: 8px 0px 0px 8px;
  border-right-width: 0;
  box-shadow: none; }

.candidate-page-button-next {
  border-radius: 0px 8px 8px 0px;
  box-shadow: none; }

/* Notifications & Message Tray */
.notification-banner {
  min-height: 64px;
  width: 34em;
  box-shadow: 0 2px 4px 2px rgba(0, 0, 0, 0.2);
  border-radius: 12px;
  margin: 4px; }
  .notification-banner .notification-actions {
    spacing: 0; }

.summary-source-counter {
  font-size: 10pt;
  font-weight: bold;
  height: 1.6em;
  width: 1.6em;
  -shell-counter-overlap-x: 3px;
  -shell-counter-overlap-y: 3px;
  background-color: #${palette[7]};
  color: #${palette[2]};
  border: 2px solid #${palette[2]};
  box-shadow: 0 2px 2px rgba(0, 0, 0, 0.5);
  border-radius: 0.9em; }

.chat-body {
  spacing: 5px; }

.chat-response {
  margin: 5px; }

.chat-log-message {
  color: #${palette[2]}; }

.chat-new-group {
  padding-top: 1em; }

.chat-received {
  padding-left: 4px; }
  .chat-received:rtl {
    padding-left: 0px;
    padding-right: 4px; }

.chat-sent {
  padding-left: 18pt;
  color: #${palette[2]}; }
  .chat-sent:rtl {
    padding-left: 0;
    padding-right: 18pt; }

.chat-meta-message {
  padding-left: 4px;
  font-size: 9pt;
  font-weight: bold;
  color: #${palette[2]}; }
  .chat-meta-message:rtl {
    padding-left: 0;
    padding-right: 4px; }

.hotplug-notification-item-icon {
  icon-size: 24px;
  padding: 0 4px; }

/* Modal Dialogs */
.modal-dialog {
  background-color: #${palette[0]};
  border-radius: 16px;
  box-shadow: inset 0 0 0 1px #${palette[2]}; }
  .modal-dialog .modal-dialog-content-box {
    margin: 32px 40px;
    spacing: 32px;
    max-width: 28em; }

/* End Session Dialog */
.end-session-dialog {
  width: 30em; }
  .end-session-dialog .end-session-dialog-battery-warning,
  .end-session-dialog .dialog-list-title {
    color: #${palette[5]}; }

/* Message Dialog */
.message-dialog-content {
  spacing: 18px; }
  .message-dialog-content .message-dialog-title {
    text-align: center; }
  .message-dialog-content .message-dialog-description {
    text-align: center; }

/* Dialog List */
.dialog-list {
  spacing: 18px; }
  .dialog-list .dialog-list-title {
    text-align: center; }
  .dialog-list .dialog-list-scrollview {
    max-height: 200px; }
  .dialog-list .dialog-list-box {
    spacing: 1em; }
    .dialog-list .dialog-list-box .dialog-list-item {
      spacing: 1em; }
      .dialog-list .dialog-list-box .dialog-list-item .dialog-list-item-title {
        font-weight: bold; }
      .dialog-list .dialog-list-box .dialog-list-item .dialog-list-item-description {
        color: #${palette[2]}; }

/* Run Dialog */
.run-dialog .modal-dialog-content-box {
  margin-top: 24px;
  margin-bottom: 14px; }

.run-dialog .run-dialog-entry {
  width: 20em; }

.run-dialog .run-dialog-description {
  text-align: center;
  color: #${palette[3]}; }

/* Password or Authentication Dialog */
.prompt-dialog {
  width: 28em; }
  .prompt-dialog .modal-dialog-content-box {
    margin-bottom: 24px; }

.prompt-dialog-password-grid {
  spacing-rows: 8px;
  spacing-columns: 4px; }
  .prompt-dialog-password-grid .prompt-dialog-password-entry {
    width: auto; }
    .prompt-dialog-password-grid .prompt-dialog-password-entry:ltr {
      margin-left: 20px; }
    .prompt-dialog-password-grid .prompt-dialog-password-entry:rtl {
      margin-right: 20px; }

.prompt-dialog-password-layout {
  spacing: 8px; }

.prompt-dialog-password-entry {
  width: 20em; }

.prompt-dialog-error-label,
.prompt-dialog-info-label,
.prompt-dialog-null-label {
  text-align: center; }

.prompt-dialog-error-label {
  color: #${palette[5]}; }

/* Polkit Dialog */
.polkit-dialog-user-layout {
  text-align: center;
  spacing: 8px;
  margin-bottom: 6px; }
  .polkit-dialog-user-layout .polkit-dialog-user-root-label {
    color: #${palette[5]}; }

/* Audio selection dialog */
.audio-device-selection-dialog .modal-dialog-content-box {
  margin-bottom: 28px; }

.audio-device-selection-dialog .audio-selection-box {
  spacing: 20px; }

.audio-selection-device {
  border-radius: 16px; }
  .audio-selection-device:hover, .audio-selection-device:focus {
    background-color: #${palette[1]}; }
  .audio-selection-device:active {
    background-color: #${palette[7]};
    color: #${palette[2]}; }

.audio-selection-device-box {
  padding: 20px;
  spacing: 20px; }

.audio-selection-device-icon {
  icon-size: 4.36em; }

/* Welcome dialog */
.welcome-dialog-image {
  background-image: url("resource:///org/gnome/shell/theme/gnome-shell-start.svg");
  background-size: contain;
  /* Reasonable maximum dimensions */
  height: 300px;
  width: 300px; }

/* Access portal dialog */
.access-dialog {
  text-align: center; }

/* OSD */
.osd-window {
  text-align: center;
  font-weight: bold;
  spacing: 12px;
  padding: 12px 18px;
  margin-bottom: 4em; }
  .osd-window > * {
    spacing: 8px; }
  .osd-window StIcon {
    icon-size: 2.18em; }
  .osd-window StLabel:ltr {
    margin-right: 6px; }
  .osd-window StLabel:rtl {
    margin-left: 6px; }
  .osd-window .level {
    margin-bottom: 4px;
    height: 6px;
    min-width: 10.9em;
    -barlevel-height: 6px;
    -barlevel-background-color: rgba(255, 255, 255, 0.1);
    -barlevel-active-background-color: #${palette[2]};
    -barlevel-overdrive-color: #${palette[4]};
    -barlevel-overdrive-separator-width: 3px; }
    .osd-window .level:first-child {
      margin-bottom: 0px; }
    .osd-window .level:ltr {
      margin-right: 6px; }
    .osd-window .level:rtl {
      margin-left: 6px; }

.osd-monitor-label {
  border-radius: 16px;
  font-size: 3em;
  font-weight: bold;
  margin: 12px;
  text-align: center;
  min-width: 1.3em; }

/* Pad OSD */
.pad-osd-window {
  padding: 32px;
  background-color: rgba(0, 0, 0, 0.8); }
  .pad-osd-window .pad-osd-title-box {
    spacing: 12px; }
  .pad-osd-window .pad-osd-title-menu-box {
    spacing: 6px; }

.combo-box-label {
  width: 15em; }

/* App Switcher */
.switcher-popup {
  padding: 0;
  spacing: 24px; }

.switcher-list {
  padding: 12px;
  border-radius: 28px;
  box-shadow: 0 8px 8px 0 rgba(0, 0, 0, 0.2); }
  .switcher-list .switcher-list-item-container {
    spacing: 12px; }
  .switcher-list .item-box {
    background-color: transparent; }
    .switcher-list .item-box:hover {
      background-color: rgba(255, 255, 255, 0.1); }
    .switcher-list .item-box:selected, .switcher-list .item-box:focus {
      background-color: rgba(255, 255, 255, 0.13); }
      .switcher-list .item-box:selected:hover, .switcher-list .item-box:focus:hover {
        background-color: rgba(255, 255, 255, 0.16); }
      .switcher-list .item-box:selected:active, .switcher-list .item-box:focus:active {
        background-color: rgba(255, 255, 255, 0.13); }
    .switcher-list .item-box:active {
      background-color: rgba(255, 255, 255, 0.16); }
    .switcher-list .item-box:outlined, .switcher-list .item-box:checked {
      background-color: rgba(255, 255, 255, 0.19); }
      .switcher-list .item-box:outlined:active, .switcher-list .item-box:checked:active {
        background-color: rgba(255, 255, 255, 0.22); }
      .switcher-list .item-box:outlined:hover, .switcher-list .item-box:checked:hover {
        background-color: rgba(255, 255, 255, 0.25); }
    .switcher-list .item-box:drop {
      border: 2px solid rgba(53, 132, 228, 0.8);
      background-color: rgba(53, 132, 228, 0.2); }
    .switcher-list .item-box:hover {
      background: none; }
  .switcher-list .separator {
    width: 1px;
    background: rgba(255, 255, 255, 0.1); }
  .switcher-list .thumbnail-box {
    padding: 2px;
    spacing: 6px; }
  .switcher-list .thumbnail {
    width: 256px;
    border-radius: 8px; }

.switcher-arrow {
  border-color: rgba(255, 255, 255, 0.8);
  color: rgba(255, 255, 255, 0.8); }
  .switcher-arrow:highlighted {
    border-color: #${palette[0]};
    color: #${palette[2]}; }

.input-source-switcher-symbol {
  font-size: 34pt;
  width: 96px;
  height: 96px; }

.cycler-highlight {
  border: 5px solid #${palette[7]}; }

/* Workspace Switcher */
.workspace-switcher {
  margin-bottom: 4em;
  spacing: 12px;
  padding: 12px 18px; }

.ws-switcher-indicator {
  background-color: rgba(255, 255, 255, 0.5);
  padding: 0.1816666667em;
  margin: 0.9083333333em;
  border-radius: 2.18em; }
  .ws-switcher-indicator:active {
    background-color: #${palette[2]};
    padding: 0.3633333333em;
    margin: 0.7266666667em; }

.icon-label-button-container {
  spacing: 6px; }
  .icon-label-button-container StIcon {
    icon-size: 32px; }

.screenshot-ui-panel {
  border-radius: 37px;
  padding: 18px;
  padding-bottom: 12px;
  margin-bottom: 4em;
  spacing: 12px; }

.screenshot-ui-close-button {
  padding: 6px !important;
  margin-top: 12px;
  box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2); }
  .screenshot-ui-close-button.left {
    margin-left: 12px; }
  .screenshot-ui-close-button.right {
    margin-right: 12px; }

.screenshot-ui-type-button {
  min-width: 48px;
  padding: 12px 18px !important;
  border-radius: 19px; }

.screenshot-ui-capture-button {
  width: 36px;
  height: 36px;
  border-radius: 99px;
  border: 4px #${palette[2]};
  padding: 4px; }
  .screenshot-ui-capture-button .screenshot-ui-capture-button-circle {
    background-color: #${palette[3]};
    transition-duration: 200ms;
    border-radius: 99px; }
    .screenshot-ui-capture-button .screenshot-ui-capture-button-circle:hover, .screenshot-ui-capture-button .screenshot-ui-capture-button-circle:focus {
      background-color: #${palette[4]}; }
  .screenshot-ui-capture-button:hover .screenshot-ui-capture-button-circle, .screenshot-ui-capture-button:focus .screenshot-ui-capture-button-circle {
    background-color: #${palette[4]}; }
  .screenshot-ui-capture-button:active .screenshot-ui-capture-button-circle {
    background-color: gray; }
  .screenshot-ui-capture-button:cast .screenshot-ui-capture-button-circle {
    background-color: #${palette[4]}; }
  .screenshot-ui-capture-button:cast:hover .screenshot-ui-capture-button-circle, .screenshot-ui-capture-button:cast:focus .screenshot-ui-capture-button-circle {
    background-color: #${palette[4]}; }
  .screenshot-ui-capture-button:cast:active .screenshot-ui-capture-button-circle {
    background-color: #${palette[4]}; }

.screenshot-ui-shot-cast-container {
  background-color: #${palette[1]};
  border-radius: 16px;
  padding: 3px;
  spacing: 3px; }
  .screenshot-ui-shot-cast-container:ltr {
    margin-left: 3px; }
  .screenshot-ui-shot-cast-container:rtl {
    margin-right: 3px; }

.screenshot-ui-shot-cast-button {
  padding: 6px 12px;
  background-color: transparent;
  border-radius: 13px; }
  .screenshot-ui-shot-cast-button:hover, .screenshot-ui-shot-cast-button:focus {
    background-color: #${palette[2]}; }
  .screenshot-ui-shot-cast-button:active {
    background-color: #${palette[0]}; }
  .screenshot-ui-shot-cast-button:checked {
    background-color: #${palette[7]};
    color: #${palette[0]}; }
  .screenshot-ui-shot-cast-button:insensitive {
    color: rgba(255, 255, 255, 0.5); }
  .screenshot-ui-shot-cast-button StIcon {
    icon-size: 1.09em; }

.screenshot-ui-show-pointer-button {
  border-radius: 99px;
  padding: 12px !important; }
  .screenshot-ui-show-pointer-button StIcon {
    icon-size: 1.09em; }

.screenshot-ui-area-indicator-shade {
  background-color: rgba(0, 0, 0, 0.3); }

.screenshot-ui-area-selector .screenshot-ui-area-indicator-shade {
  background-color: rgba(0, 0, 0, 0.5); }

.screenshot-ui-area-selector .screenshot-ui-area-indicator-selection {
  border: 2px #${palette[2]}; }

.screenshot-ui-area-selector-handle {
  border-radius: 99px;
  background-color: #${palette[0]};
  box-shadow: 0 1px 3px 2px rgba(0, 0, 0, 0.2);
  width: 24px;
  height: 24px; }

.screenshot-ui-window-selector {
  background-color: #${palette[0]}; }
  .screenshot-ui-window-selector .screenshot-ui-window-selector-window-container {
    margin: 100px; }
  .screenshot-ui-window-selector:primary-monitor .screenshot-ui-window-selector-window-container {
    margin-bottom: 200px; }

.screenshot-ui-window-selector-window-border {
  transition-duration: 200ms;
  border-radius: 16px;
  border: 6px transparent; }

.screenshot-ui-window-selector-check {
  transition-duration: 200ms;
  color: transparent;
  border-radius: 99px;
  border-width: 12px;
  icon-size: 24px; }

.screenshot-ui-window-selector-window:hover .screenshot-ui-window-selector-window-border {
  border-color: #${palette[7]}; }

.screenshot-ui-window-selector-window:checked .screenshot-ui-window-selector-window-border {
  border-color: #${palette[7]};
  background-color: rgba(53, 132, 228, 0.2); }

.screenshot-ui-window-selector-window:checked .screenshot-ui-window-selector-check {
  color: #${palette[2]};
  background-color: #${palette[7]}; }

.screenshot-ui-screen-selector {
  transition-duration: 200ms;
  background-color: rgba(0, 0, 0, 0.5); }
  .screenshot-ui-screen-selector:hover {
    background-color: rgba(0, 0, 0, 0.3); }
  .screenshot-ui-screen-selector:active {
    background-color: rgba(0, 0, 0, 0.7); }
  .screenshot-ui-screen-selector:checked {
    background-color: transparent;
    border: 2px #${palette[2]}; }

.screenshot-ui-tooltip {
  color: #${palette[2]};
  background-color: #${palette[0]};
  border-radius: 99px;
  padding: 6px 12px;
  text-align: center;
  -y-offset: 24px; }

/* Top Bar */
#panel {
  background-color: #${palette[1]};
  font-weight: bold;
  height: 2.2em;
  transition-duration: 250ms;
  box-shadow: inset 0 -1px 0 0 #${palette[1]}; }
  #panel.unlock-screen, #panel.login-screen, #panel:overview {
    background-color: transparent;
    box-shadow: none; }
    #panel.unlock-screen .panel-button, #panel.login-screen .panel-button, #panel:overview .panel-button {
      color: #${palette[2]} !important; }
  #panel .panel-button {
    font-weight: bold;
    color: #${palette[2]};
    -natural-hpadding: 12px;
    -minimum-hpadding: 6px;
    transition-duration: 150ms;
    border: 3px solid transparent;
    border-radius: 99px; }
    #panel .panel-button.clock-display .clock {
      transition-duration: 150ms;
      border: 3px solid transparent;
      border-radius: 99px; }
    #panel .panel-button.screen-recording-indicator {
      box-shadow: inset 0 0 0 100px #${palette[4]}; }
    #panel .panel-button.screen-sharing-indicator {
      box-shadow: inset 0 0 0 100px #${palette[5]}; }
      #panel .panel-button.screen-sharing-indicator StBoxLayout {
        margin: 0 6px; }
    #panel .panel-button.screen-recording-indicator StBoxLayout, #panel .panel-button.screen-sharing-indicator StBoxLayout {
      spacing: 6px; }
    #panel .panel-button.screen-recording-indicator StIcon, #panel .panel-button.screen-sharing-indicator StIcon {
      icon-size: 1.09em; }
    #panel .panel-button:active, #panel .panel-button:overview, #panel .panel-button:focus, #panel .panel-button:checked {
      box-shadow: inset 0 0 0 100px rgba(242, 242, 242, 0.2); }
      #panel .panel-button:active.clock-display, #panel .panel-button:overview.clock-display, #panel .panel-button:focus.clock-display, #panel .panel-button:checked.clock-display {
        box-shadow: none; }
        #panel .panel-button:active.clock-display .clock, #panel .panel-button:overview.clock-display .clock, #panel .panel-button:focus.clock-display .clock, #panel .panel-button:checked.clock-display .clock {
          box-shadow: inset 0 0 0 100px rgba(242, 242, 242, 0.2); }
      #panel .panel-button:active.screen-recording-indicator, #panel .panel-button:overview.screen-recording-indicator, #panel .panel-button:focus.screen-recording-indicator, #panel .panel-button:checked.screen-recording-indicator {
        box-shadow: inset 0 0 0 100px rgba(192, 28, 40, 0.85); }
      #panel .panel-button:active.screen-sharing-indicator, #panel .panel-button:overview.screen-sharing-indicator, #panel .panel-button:focus.screen-sharing-indicator, #panel .panel-button:checked.screen-sharing-indicator {
        box-shadow: inset 0 0 0 100px rgba(246, 211, 45, 0.85); }
    #panel .panel-button:hover {
      box-shadow: inset 0 0 0 100px rgba(242, 242, 242, 0.15); }
      #panel .panel-button:hover.clock-display {
        box-shadow: none; }
        #panel .panel-button:hover.clock-display .clock {
          box-shadow: inset 0 0 0 100px rgba(242, 242, 242, 0.15); }
      #panel .panel-button:hover.screen-recording-indicator {
        box-shadow: inset 0 0 0 100px rgba(192, 28, 40, 0.9); }
      #panel .panel-button:hover.screen-sharing-indicator {
        box-shadow: inset 0 0 0 100px rgba(246, 211, 45, 0.9); }
    #panel .panel-button:active:hover, #panel .panel-button:overview:hover, #panel .panel-button:focus:hover, #panel .panel-button:checked:hover {
      box-shadow: inset 0 0 0 100px rgba(242, 242, 242, 0.25); }
      #panel .panel-button:active:hover.clock-display, #panel .panel-button:overview:hover.clock-display, #panel .panel-button:focus:hover.clock-display, #panel .panel-button:checked:hover.clock-display {
        box-shadow: none; }
        #panel .panel-button:active:hover.clock-display .clock, #panel .panel-button:overview:hover.clock-display .clock, #panel .panel-button:focus:hover.clock-display .clock, #panel .panel-button:checked:hover.clock-display .clock {
          box-shadow: inset 0 0 0 100px rgba(242, 242, 242, 0.25); }
      #panel .panel-button:active:hover.screen-recording-indicator, #panel .panel-button:overview:hover.screen-recording-indicator, #panel .panel-button:focus:hover.screen-recording-indicator, #panel .panel-button:checked:hover.screen-recording-indicator {
        box-shadow: inset 0 0 0 100px rgba(192, 28, 40, 0.8); }
      #panel .panel-button:active:hover.screen-sharing-indicator, #panel .panel-button:overview:hover.screen-sharing-indicator, #panel .panel-button:focus:hover.screen-sharing-indicator, #panel .panel-button:checked:hover.screen-sharing-indicator {
        box-shadow: inset 0 0 0 100px rgba(246, 211, 45, 0.8); }
    #panel .panel-button .system-status-icon {
      icon-size: 1.09em;
      padding: 5px;
      margin: 0 4px; }
    #panel .panel-button .panel-status-indicators-box .system-status-icon,
    #panel .panel-button .panel-status-menu-box .system-status-icon {
      margin: 0; }
    #panel .panel-button .app-menu-icon {
      -st-icon-style: symbolic; }
    #panel .panel-button#panelActivities {
      -natural-hpadding: 18px; }
  #panel.unlock-screen .panel-button:active, #panel.unlock-screen .panel-button:overview, #panel.unlock-screen .panel-button:focus, #panel.unlock-screen .panel-button:checked, #panel.login-screen .panel-button:active, #panel.login-screen .panel-button:overview, #panel.login-screen .panel-button:focus, #panel.login-screen .panel-button:checked, #panel:overview .panel-button:active, #panel:overview .panel-button:overview, #panel:overview .panel-button:focus, #panel:overview .panel-button:checked {
    box-shadow: inset 0 0 0 100px rgba(246, 245, 244, 0.15); }
    #panel.unlock-screen .panel-button:active.clock-display, #panel.unlock-screen .panel-button:overview.clock-display, #panel.unlock-screen .panel-button:focus.clock-display, #panel.unlock-screen .panel-button:checked.clock-display, #panel.login-screen .panel-button:active.clock-display, #panel.login-screen .panel-button:overview.clock-display, #panel.login-screen .panel-button:focus.clock-display, #panel.login-screen .panel-button:checked.clock-display, #panel:overview .panel-button:active.clock-display, #panel:overview .panel-button:overview.clock-display, #panel:overview .panel-button:focus.clock-display, #panel:overview .panel-button:checked.clock-display {
      box-shadow: none; }
      #panel.unlock-screen .panel-button:active.clock-display .clock, #panel.unlock-screen .panel-button:overview.clock-display .clock, #panel.unlock-screen .panel-button:focus.clock-display .clock, #panel.unlock-screen .panel-button:checked.clock-display .clock, #panel.login-screen .panel-button:active.clock-display .clock, #panel.login-screen .panel-button:overview.clock-display .clock, #panel.login-screen .panel-button:focus.clock-display .clock, #panel.login-screen .panel-button:checked.clock-display .clock, #panel:overview .panel-button:active.clock-display .clock, #panel:overview .panel-button:overview.clock-display .clock, #panel:overview .panel-button:focus.clock-display .clock, #panel:overview .panel-button:checked.clock-display .clock {
        box-shadow: inset 0 0 0 100px rgba(246, 245, 244, 0.15); }
    #panel.unlock-screen .panel-button:active.screen-recording-indicator, #panel.unlock-screen .panel-button:overview.screen-recording-indicator, #panel.unlock-screen .panel-button:focus.screen-recording-indicator, #panel.unlock-screen .panel-button:checked.screen-recording-indicator, #panel.login-screen .panel-button:active.screen-recording-indicator, #panel.login-screen .panel-button:overview.screen-recording-indicator, #panel.login-screen .panel-button:focus.screen-recording-indicator, #panel.login-screen .panel-button:checked.screen-recording-indicator, #panel:overview .panel-button:active.screen-recording-indicator, #panel:overview .panel-button:overview.screen-recording-indicator, #panel:overview .panel-button:focus.screen-recording-indicator, #panel:overview .panel-button:checked.screen-recording-indicator {
      box-shadow: inset 0 0 0 100px rgba(192, 28, 40, 0.85); }
    #panel.unlock-screen .panel-button:active.screen-sharing-indicator, #panel.unlock-screen .panel-button:overview.screen-sharing-indicator, #panel.unlock-screen .panel-button:focus.screen-sharing-indicator, #panel.unlock-screen .panel-button:checked.screen-sharing-indicator, #panel.login-screen .panel-button:active.screen-sharing-indicator, #panel.login-screen .panel-button:overview.screen-sharing-indicator, #panel.login-screen .panel-button:focus.screen-sharing-indicator, #panel.login-screen .panel-button:checked.screen-sharing-indicator, #panel:overview .panel-button:active.screen-sharing-indicator, #panel:overview .panel-button:overview.screen-sharing-indicator, #panel:overview .panel-button:focus.screen-sharing-indicator, #panel:overview .panel-button:checked.screen-sharing-indicator {
      box-shadow: inset 0 0 0 100px rgba(246, 211, 45, 0.85); }
  #panel.unlock-screen .panel-button:hover, #panel.login-screen .panel-button:hover, #panel:overview .panel-button:hover {
    box-shadow: inset 0 0 0 100px rgba(246, 245, 244, 0.1); }
    #panel.unlock-screen .panel-button:hover.clock-display, #panel.login-screen .panel-button:hover.clock-display, #panel:overview .panel-button:hover.clock-display {
      box-shadow: none; }
      #panel.unlock-screen .panel-button:hover.clock-display .clock, #panel.login-screen .panel-button:hover.clock-display .clock, #panel:overview .panel-button:hover.clock-display .clock {
        box-shadow: inset 0 0 0 100px rgba(246, 245, 244, 0.1); }
    #panel.unlock-screen .panel-button:hover.screen-recording-indicator, #panel.login-screen .panel-button:hover.screen-recording-indicator, #panel:overview .panel-button:hover.screen-recording-indicator {
      box-shadow: inset 0 0 0 100px rgba(192, 28, 40, 0.9); }
    #panel.unlock-screen .panel-button:hover.screen-sharing-indicator, #panel.login-screen .panel-button:hover.screen-sharing-indicator, #panel:overview .panel-button:hover.screen-sharing-indicator {
      box-shadow: inset 0 0 0 100px rgba(246, 211, 45, 0.9); }
  #panel.unlock-screen .panel-button:active:hover, #panel.unlock-screen .panel-button:overview:hover, #panel.unlock-screen .panel-button:focus:hover, #panel.unlock-screen .panel-button:checked:hover, #panel.login-screen .panel-button:active:hover, #panel.login-screen .panel-button:overview:hover, #panel.login-screen .panel-button:focus:hover, #panel.login-screen .panel-button:checked:hover, #panel:overview .panel-button:active:hover, #panel:overview .panel-button:overview:hover, #panel:overview .panel-button:focus:hover, #panel:overview .panel-button:checked:hover {
    box-shadow: inset 0 0 0 100px rgba(246, 245, 244, 0.2); }
    #panel.unlock-screen .panel-button:active:hover.clock-display, #panel.unlock-screen .panel-button:overview:hover.clock-display, #panel.unlock-screen .panel-button:focus:hover.clock-display, #panel.unlock-screen .panel-button:checked:hover.clock-display, #panel.login-screen .panel-button:active:hover.clock-display, #panel.login-screen .panel-button:overview:hover.clock-display, #panel.login-screen .panel-button:focus:hover.clock-display, #panel.login-screen .panel-button:checked:hover.clock-display, #panel:overview .panel-button:active:hover.clock-display, #panel:overview .panel-button:overview:hover.clock-display, #panel:overview .panel-button:focus:hover.clock-display, #panel:overview .panel-button:checked:hover.clock-display {
      box-shadow: none; }
      #panel.unlock-screen .panel-button:active:hover.clock-display .clock, #panel.unlock-screen .panel-button:overview:hover.clock-display .clock, #panel.unlock-screen .panel-button:focus:hover.clock-display .clock, #panel.unlock-screen .panel-button:checked:hover.clock-display .clock, #panel.login-screen .panel-button:active:hover.clock-display .clock, #panel.login-screen .panel-button:overview:hover.clock-display .clock, #panel.login-screen .panel-button:focus:hover.clock-display .clock, #panel.login-screen .panel-button:checked:hover.clock-display .clock, #panel:overview .panel-button:active:hover.clock-display .clock, #panel:overview .panel-button:overview:hover.clock-display .clock, #panel:overview .panel-button:focus:hover.clock-display .clock, #panel:overview .panel-button:checked:hover.clock-display .clock {
        box-shadow: inset 0 0 0 100px rgba(246, 245, 244, 0.2); }
    #panel.unlock-screen .panel-button:active:hover.screen-recording-indicator, #panel.unlock-screen .panel-button:overview:hover.screen-recording-indicator, #panel.unlock-screen .panel-button:focus:hover.screen-recording-indicator, #panel.unlock-screen .panel-button:checked:hover.screen-recording-indicator, #panel.login-screen .panel-button:active:hover.screen-recording-indicator, #panel.login-screen .panel-button:overview:hover.screen-recording-indicator, #panel.login-screen .panel-button:focus:hover.screen-recording-indicator, #panel.login-screen .panel-button:checked:hover.screen-recording-indicator, #panel:overview .panel-button:active:hover.screen-recording-indicator, #panel:overview .panel-button:overview:hover.screen-recording-indicator, #panel:overview .panel-button:focus:hover.screen-recording-indicator, #panel:overview .panel-button:checked:hover.screen-recording-indicator {
      box-shadow: inset 0 0 0 100px rgba(192, 28, 40, 0.8); }
    #panel.unlock-screen .panel-button:active:hover.screen-sharing-indicator, #panel.unlock-screen .panel-button:overview:hover.screen-sharing-indicator, #panel.unlock-screen .panel-button:focus:hover.screen-sharing-indicator, #panel.unlock-screen .panel-button:checked:hover.screen-sharing-indicator, #panel.login-screen .panel-button:active:hover.screen-sharing-indicator, #panel.login-screen .panel-button:overview:hover.screen-sharing-indicator, #panel.login-screen .panel-button:focus:hover.screen-sharing-indicator, #panel.login-screen .panel-button:checked:hover.screen-sharing-indicator, #panel:overview .panel-button:active:hover.screen-sharing-indicator, #panel:overview .panel-button:overview:hover.screen-sharing-indicator, #panel:overview .panel-button:focus:hover.screen-sharing-indicator, #panel:overview .panel-button:checked:hover.screen-sharing-indicator {
      box-shadow: inset 0 0 0 100px rgba(246, 211, 45, 0.8); }
  #panel .panel-status-indicators-box,
  #panel .panel-status-menu-box {
    spacing: 2px; }
  #panel .power-status.panel-status-indicators-box {
    spacing: 0; }
  #panel .screencast-indicator,
  #panel .remote-access-indicator {
    color: #${palette[5]}; }

#appMenu {
  spacing: 6px; }
  #appMenu .label-shadow {
    color: transparent; }

#appMenu .panel-status-menu-box {
  padding: 0 6px;
  spacing: 6px; }

.clock-display-box {
  spacing: 2px; }
  .clock-display-box .clock {
    padding-left: 12px;
    padding-right: 12px; }

/* Activities Ripple */
.ripple-box {
  background-color: rgba(255, 255, 255, 0.2);
  box-shadow: 0 0 2px 2px rgba(255, 255, 255, 0.2);
  width: 52px;
  height: 52px;
  border-radius: 0 0 52px 0; }
  .ripple-box:rtl {
    border-radius: 0 0 0 52px; }

.quick-settings {
  padding: 18px;
  border-radius: 36px; }
  .quick-settings .icon-button, .quick-settings .login-dialog-button.cancel-button, .quick-settings .login-dialog-button.switch-user-button, .quick-settings .login-dialog-button.login-dialog-session-list-button, .quick-settings .background-app-item .close-button, .background-app-item .quick-settings .close-button, .quick-settings .button {
    padding: 10.5px; }

.quick-settings-grid {
  spacing-rows: 12px;
  spacing-columns: 12px; }

.quick-toggle, .quick-menu-toggle {
  border-radius: 99px;
  min-width: 12em;
  max-width: 12em;
  min-height: 48px;
  border: none; }

.quick-toggle {
    background-color: #${palette[1]}; }
  .quick-toggle:hover {
    background-color: #${palette[1]};
    color: #${palette[7]}; }
  .quick-toggle:checked {
    transition-duration: 100ms;
    background-color: #${palette[7]};
    color: #${palette[0]}; }
    .quick-toggle:checked:focus {
      box-shadow: inset 0 0 0 2px rgba(255, 255, 255, 0.6) !important; }
    .quick-toggle:checked:hover, .quick-toggle:checked:focus {
      background-color: #${palette[7]};
      color: #${palette[2]}; }
    .quick-toggle:checked:active {
      background-color: #${palette[7]};
      color: #${palette[0]}; }
    .quick-toggle:checked:insensitive {
      transition-duration: 100ms;
      color: rgba(255, 255, 255, 0.5);
      background-color: rgba(255, 255, 255, 0.05);
      background-color: rgba(53, 132, 228, 0.5);
      color: rgba(255, 255, 255, 0.5); }
  .quick-toggle > StBoxLayout {
    spacing: 9px; }
  .quick-toggle.button, .quick-toggle.icon-button, .quick-toggle.login-dialog-button.cancel-button, .quick-toggle.login-dialog-button.switch-user-button, .quick-toggle.login-dialog-button.login-dialog-session-list-button, .background-app-item .quick-toggle.close-button {
    padding: 0; }
  .quick-toggle > StBoxLayout {
    padding: 0 12px; }
  .quick-toggle:ltr > StBoxLayout {
    padding-left: 15px; }
  .quick-toggle:rtl > StBoxLayout {
    padding-right: 15px; }
  .quick-toggle .quick-toggle-title {
    font-weight: bold; }
  .quick-toggle StBoxLayout > .quick-toggle-subtitle {
    font-weight: normal;
    font-size: 12px; }
  .quick-toggle .quick-toggle-icon {
    icon-size: 1.09em; }

.quick-menu-toggle .quick-toggle {
  min-width: auto;
  max-width: auto; }
  .quick-menu-toggle .quick-toggle:ltr {
    border-radius: 99px 0 0 99px; }
  .quick-menu-toggle .quick-toggle:ltr > StBoxLayout {
    padding-right: 9px; }
  .quick-menu-toggle .quick-toggle:rtl {
    border-radius: 0 99px 99px 0; }
  .quick-menu-toggle .quick-toggle:rtr > StBoxLayout {
    padding-left: 9px; }
  .quick-menu-toggle .quick-toggle:ltr:last-child {
    border-radius: 99px; }
  .quick-menu-toggle .quick-toggle:rtl:last-child {
    border-radius: 99px; }

.quick-menu-toggle .quick-toggle-arrow {
  padding: 6px 10.5px;
  border-width: 0; }
  .quick-menu-toggle .quick-toggle-arrow:checked {
    transition-duration: 100ms;
    background-color: #${palette[7]};
    color: #${palette[0]};
    border-color: #${palette[7]}; }
    .quick-menu-toggle .quick-toggle-arrow:checked:focus {
      box-shadow: inset 0 0 0 2px rgba(255, 255, 255, 0.6) !important; }
    .quick-menu-toggle .quick-toggle-arrow:checked:hover, .quick-menu-toggle .quick-toggle-arrow:checked:focus {
      background-color: #${palette[7]};
      color: #${palette[2]}; }
    .quick-menu-toggle .quick-toggle-arrow:checked:active {
      background-color: #${palette[7]};
      color: #${palette[0]}; }
    .quick-menu-toggle .quick-toggle-arrow:checked:insensitive {
      transition-duration: 100ms;
      color: rgba(255, 255, 255, 0.5);
      background-color: rgba(255, 255, 255, 0.05);
      background-color: rgba(53, 132, 228, 0.5);
      color: rgba(255, 255, 255, 0.5); }
  .quick-menu-toggle .quick-toggle-arrow:ltr {
    border-radius: 0 99px 99px 0;
    border-left-width: 1px; }
  .quick-menu-toggle .quick-toggle-arrow:rtl {
    border-radius: 99px 0 0 99px;
    border-right-width: 1px; }

.quick-slider > StBoxLayout {
  spacing: 6px; }

.quick-slider .icon-button, .quick-slider .login-dialog-button.cancel-button, .quick-slider .login-dialog-button.switch-user-button, .quick-slider .login-dialog-button.login-dialog-session-list-button, .quick-slider .background-app-item .close-button, .background-app-item .quick-slider .close-button {
  padding: 6px; }

.quick-slider .slider-bin {
  min-height: 16px;
  padding: 6px;
  border-radius: 99px; }
  .quick-slider .slider-bin:focus {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]};
    box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.6) !important; }
    .quick-slider .slider-bin:focus:hover {
      background-color: #${palette[0]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7) !important; }
    .quick-slider .slider-bin:focus:active {
      background-color: #${palette[0]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7) !important; }

.quick-toggle-menu {
  border-radius: 12px;
  margin: 4px;
  transition-duration: 100ms;
  color: #${palette[2]};
  background-color: #${palette[1]};
  background-color: #${palette[1]} !important;
  color: #${palette[2]} !important;
  border-radius: 24px;
  padding: 12px;
  margin: 12px 18px 0; }
  .quick-toggle-menu:hover {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]}; }
  .quick-toggle-menu:active {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]}; }
  .quick-toggle-menu:focus {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]};
    box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.6) !important; }
    .quick-toggle-menu:focus:hover {
      background-color: #${palette[0]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7) !important; }
    .quick-toggle-menu:focus:active {
      background-color: #${palette[0]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7) !important; }
  .quick-toggle-menu:insensitive {
    transition-duration: 100ms;
    color: rgba(255, 255, 255, 0.5);
    background-color: rgba(255, 255, 255, 0.05); }
  .quick-toggle-menu .popup-menu-item > StIcon {
    -st-icon-style: symbolic; }
  .quick-toggle-menu .header {
    spacing-rows: 3px;
    spacing-columns: 12px;
    padding-bottom: 12px; }
    .quick-toggle-menu .header .icon {
      icon-size: 1.635em;
      border-radius: 999px;
      padding: 9px;
      background-color: rgba(255, 255, 255, 0.2); }
      .quick-toggle-menu .header .icon.active {
        background-color: #${palette[7]};
        color: #${palette[2]}; }

.quick-settings-system-item > StBoxLayout {
  spacing: 12px; }

.quick-settings-system-item .power-item {
  min-height: 0;
  min-width: 0; }
  .quick-settings-system-item .power-item:insensitive {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]};
    background-color: transparent; }

.nm-network-item .wireless-secure-icon {
  icon-size: 0.545em; }

.bt-device-item .popup-menu-icon {
  -st-icon-style: symbolic; }

.bt-menu-placeholder.popup-menu-item {
  text-align: center;
  padding: 2em 4em; }

.device-subtitle {
  color: rgba(255, 255, 255, 0.5); }

.background-apps-quick-toggle {
  min-height: 40px;
  background-color: transparent; }
  .background-apps-quick-toggle StIcon {
    icon-size: 1.09em !important; }

.background-app-item .popup-menu-icon {
  icon-size: 2.18em !important;
  -st-icon-style: regular !important; }

.background-app-item .close-button {
  padding: 6px; }

.background-app-item.popup-inactive-menu-item {
  color: #${palette[2]}; }

/* OVERVIEW */
.controls-manager, .secondary-monitor-workspaces {
  spacing: 12px; }

#overviewGroup {
  background-color: #${palette[0]}; }

.overview-controls {
  padding-bottom: 32px; }

/* Window Picker */
.window-picker {
  spacing: 6px; }

.window-close, .screenshot-ui-close-button {
  background-color: rgba(71, 71, 71, 0.98);
  color: #${palette[4]};
  border-radius: 99px;
  box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2);
  padding: 3px;
  height: 30px;
  width: 30px;
  transition-duration: 100ms; }
  .window-close StIcon, .screenshot-ui-close-button StIcon {
    icon-size: 24px; }
  .window-close:hover, .screenshot-ui-close-button:hover {
    background-color: rgba(88, 88, 88, 0.98); }
  .window-close:active, .screenshot-ui-close-button:active {
    background-color: rgba(104, 104, 104, 0.98); }

.workspace-background {
  border-radius: 30px;
  background-color: rgba(3, 2, 1, 0);
  box-shadow: 0 4px 16px 4px rgba(0, 0, 0, 0.2); }

.search-entry {
  border-radius: 99px;
  margin-top: 12px;
  margin-bottom: 6px;
  width: 24em; }
  .search-entry .search-entry-icon {
    icon-size: 1.09em;
    margin-top: 2px;
    padding: 0 4px; }

/* Search */
#searchResults {
  margin: 0 4px; }

#searchResultsContent {
  max-width: 1072px; }

.search-section {
  spacing: 18px; }
  .search-section .search-section-separator {
    height: 8px;
    background-color: transparent; }

.search-section-content {
  background-color: #${palette[1]};
  color: #${palette[2]};
  border-radius: 24px;
  padding: 12px;
  margin: 0 12px; }

.list-search-result, .search-provider-icon {
  background-color: transparent;
  border-radius: 11px; }
  .list-search-result:hover, .search-provider-icon:hover {
    background-color: rgba(246, 245, 244, 0.1); }
  .list-search-result:selected, .search-provider-icon:selected, .list-search-result:focus, .search-provider-icon:focus {
    background-color: rgba(246, 245, 244, 0.13); }
    .list-search-result:selected:hover, .search-provider-icon:selected:hover, .list-search-result:focus:hover, .search-provider-icon:focus:hover {
      background-color: rgba(246, 245, 244, 0.16); }
    .list-search-result:selected:active, .search-provider-icon:selected:active, .list-search-result:focus:active, .search-provider-icon:focus:active {
      background-color: rgba(246, 245, 244, 0.13); }
  .list-search-result:active, .search-provider-icon:active {
    background-color: rgba(246, 245, 244, 0.16); }
  .list-search-result:outlined, .search-provider-icon:outlined, .list-search-result:checked, .search-provider-icon:checked {
    background-color: rgba(246, 245, 244, 0.19); }
    .list-search-result:outlined:active, .search-provider-icon:outlined:active, .list-search-result:checked:active, .search-provider-icon:checked:active {
      background-color: rgba(246, 245, 244, 0.22); }
    .list-search-result:outlined:hover, .search-provider-icon:outlined:hover, .list-search-result:checked:hover, .search-provider-icon:checked:hover {
      background-color: rgba(246, 245, 244, 0.25); }
  .list-search-result:drop, .search-provider-icon:drop {
    border: 2px solid rgba(53, 132, 228, 0.8);
    background-color: rgba(53, 132, 228, 0.2); }

.search-statustext {
  color: rgba(246, 245, 244, 0.8); }

.grid-search-results {
  spacing: 30px;
  margin: 0 12px; }

.search-provider-icon:ltr {
  margin-right: 4px; }

.search-provider-icon:rtl {
  margin-left: 4px; }

.search-provider-icon .list-search-provider-content {
  spacing: 12px; }
  .search-provider-icon .list-search-provider-content .list-search-provider-details {
    width: 120px;
    color: #${palette[2]}; }

.list-search-results {
  spacing: 6px; }

.list-search-result .list-search-result-content {
  spacing: 6px; }

.list-search-result .list-search-result-title {
  spacing: 12px; }

.list-search-result .list-search-result-description {
  color: #${palette[3]}; }

/* Dash */
#dash {
  margin-top: 12px; }
  #dash .placeholder {
    background-image: none;
    background-size: contain;
    height: 32px; }
  #dash .empty-dash-drop-target {
    width: 32px;
    height: 32px; }
  #dash .app-well-app-running-dot {
    margin-bottom: 14px; }

.dash-background {
  background-color: #${palette[1]};
  border-radius: 28px;
  padding: 12px;
  spacing: 6px;
  margin-bottom: 12px; }

.dash-item-container > * {
  margin: 0 2px; }

.dash-item-container:ltr:first-child {
  margin-left: 0; }

.dash-item-container:rtl:first-child {
  margin-right: 0; }

.dash-item-container .app-well-app .overview-icon, .dash-item-container .grid-search-result .overview-icon {
  padding: 6px;
  border-radius: 16px; }

.dash-item-container .show-apps {
  transition-duration: 400ms; }
  .dash-item-container .show-apps .overview-icon {
    background-color: transparent; }
  .dash-item-container .show-apps:hover .overview-icon {
    background-color: rgba(246, 245, 244, 0.13); }
  .dash-item-container .show-apps:selected .overview-icon, .dash-item-container .show-apps:focus .overview-icon {
    background-color: rgba(246, 245, 244, 0.13); }
    .dash-item-container .show-apps:selected .overview-icon:hover .overview-icon, .dash-item-container .show-apps:focus .overview-icon:hover .overview-icon {
      background-color: rgba(246, 245, 244, 0.16); }
    .dash-item-container .show-apps:selected .overview-icon:active .overview-icon, .dash-item-container .show-apps:focus .overview-icon:active .overview-icon {
      background-color: rgba(246, 245, 244, 0.13); }
  .dash-item-container .show-apps:active .overview-icon {
    background-color: rgba(246, 245, 244, 0.16); }
  .dash-item-container .show-apps:outlined .overview-icon, .dash-item-container .show-apps:checked .overview-icon {
    background-color: rgba(246, 245, 244, 0.19); }
    .dash-item-container .show-apps:outlined .overview-icon:active .overview-icon, .dash-item-container .show-apps:checked .overview-icon:active .overview-icon {
      background-color: rgba(246, 245, 244, 0.22); }
    .dash-item-container .show-apps:outlined .overview-icon:hover .overview-icon, .dash-item-container .show-apps:checked .overview-icon:hover .overview-icon {
      background-color: rgba(246, 245, 244, 0.25); }
  .dash-item-container .show-apps:drop .overview-icon {
    border: 2px solid rgba(53, 132, 228, 0.8);
    background-color: rgba(53, 132, 228, 0.2); }

.dash-item-container .show-apps, .dash-item-container .app-well-app, .dash-item-container .grid-search-result {
  padding-bottom: 12px;
  color: #${palette[2]}; }

.dash-separator {
  width: 1px;
  margin: 0 4px;
  background-color: rgba(246, 245, 244, 0.1);
  margin-bottom: 12px; }

.dash-label {
  -y-offset: 8px; }

/* App Grid */
.icon-grid {
  row-spacing: 12px;
  column-spacing: 12px;
  max-row-spacing: 42px;
  max-column-spacing: 42px;
  page-padding-top: 24px;
  page-padding-bottom: 24px;
  page-padding-left: 18px;
  page-padding-right: 18px; }

/* App Icons */
.app-well-app, .grid-search-result {
  transition-duration: 400ms; }
  .app-well-app .overview-icon, .grid-search-result .overview-icon {
    background-color: transparent; }
  .app-well-app:hover .overview-icon, .grid-search-result:hover .overview-icon {
    background-color: rgba(246, 245, 244, 0.13); }
  .app-well-app:selected .overview-icon, .grid-search-result:selected .overview-icon, .app-well-app:focus .overview-icon, .grid-search-result:focus .overview-icon {
    background-color: rgba(246, 245, 244, 0.13); }
    .app-well-app:selected .overview-icon:hover .overview-icon, .grid-search-result:selected .overview-icon:hover .overview-icon, .app-well-app:focus .overview-icon:hover .overview-icon, .grid-search-result:focus .overview-icon:hover .overview-icon {
      background-color: rgba(246, 245, 244, 0.16); }
    .app-well-app:selected .overview-icon:active .overview-icon, .grid-search-result:selected .overview-icon:active .overview-icon, .app-well-app:focus .overview-icon:active .overview-icon, .grid-search-result:focus .overview-icon:active .overview-icon {
      background-color: rgba(246, 245, 244, 0.13); }
  .app-well-app:active .overview-icon, .grid-search-result:active .overview-icon {
    background-color: rgba(246, 245, 244, 0.16); }
  .app-well-app:outlined .overview-icon, .grid-search-result:outlined .overview-icon, .app-well-app:checked .overview-icon, .grid-search-result:checked .overview-icon {
    background-color: rgba(246, 245, 244, 0.19); }
    .app-well-app:outlined .overview-icon:active .overview-icon, .grid-search-result:outlined .overview-icon:active .overview-icon, .app-well-app:checked .overview-icon:active .overview-icon, .grid-search-result:checked .overview-icon:active .overview-icon {
      background-color: rgba(246, 245, 244, 0.22); }
    .app-well-app:outlined .overview-icon:hover .overview-icon, .grid-search-result:outlined .overview-icon:hover .overview-icon, .app-well-app:checked .overview-icon:hover .overview-icon, .grid-search-result:checked .overview-icon:hover .overview-icon {
      background-color: rgba(246, 245, 244, 0.25); }
  .app-well-app:drop .overview-icon, .grid-search-result:drop .overview-icon {
    border: 2px solid rgba(53, 132, 228, 0.8);
    background-color: rgba(53, 132, 228, 0.2); }
  .app-well-app .overview-icon, .grid-search-result .overview-icon {
    padding: 12px;
    border-radius: 24px;
    color: #${palette[2]}; }
  .app-well-app .overview-icon.overview-icon-with-label > StBoxLayout, .grid-search-result .overview-icon.overview-icon-with-label > StBoxLayout {
    spacing: 6px; }

.app-well-app.app-folder, .app-folder.grid-search-result {
  transition-duration: 400ms; }
  .app-well-app.app-folder .overview-icon, .app-folder.grid-search-result .overview-icon {
    background-color: rgba(246, 245, 244, 0.07); }
  .app-well-app.app-folder:hover .overview-icon, .app-folder.grid-search-result:hover .overview-icon {
    background-color: rgba(246, 245, 244, 0.13); }
  .app-well-app.app-folder:selected .overview-icon, .app-folder.grid-search-result:selected .overview-icon, .app-well-app.app-folder:focus .overview-icon, .app-folder.grid-search-result:focus .overview-icon {
    background-color: rgba(246, 245, 244, 0.13); }
    .app-well-app.app-folder:selected .overview-icon:hover .overview-icon, .app-folder.grid-search-result:selected .overview-icon:hover .overview-icon, .app-well-app.app-folder:focus .overview-icon:hover .overview-icon, .app-folder.grid-search-result:focus .overview-icon:hover .overview-icon {
      background-color: rgba(246, 245, 244, 0.16); }
    .app-well-app.app-folder:selected .overview-icon:active .overview-icon, .app-folder.grid-search-result:selected .overview-icon:active .overview-icon, .app-well-app.app-folder:focus .overview-icon:active .overview-icon, .app-folder.grid-search-result:focus .overview-icon:active .overview-icon {
      background-color: rgba(246, 245, 244, 0.13); }
  .app-well-app.app-folder:active .overview-icon, .app-folder.grid-search-result:active .overview-icon {
    background-color: rgba(246, 245, 244, 0.16); }
  .app-well-app.app-folder:outlined .overview-icon, .app-folder.grid-search-result:outlined .overview-icon, .app-well-app.app-folder:checked .overview-icon, .app-folder.grid-search-result:checked .overview-icon {
    background-color: rgba(246, 245, 244, 0.19); }
    .app-well-app.app-folder:outlined .overview-icon:active .overview-icon, .app-folder.grid-search-result:outlined .overview-icon:active .overview-icon, .app-well-app.app-folder:checked .overview-icon:active .overview-icon, .app-folder.grid-search-result:checked .overview-icon:active .overview-icon {
      background-color: rgba(246, 245, 244, 0.22); }
    .app-well-app.app-folder:outlined .overview-icon:hover .overview-icon, .app-folder.grid-search-result:outlined .overview-icon:hover .overview-icon, .app-well-app.app-folder:checked .overview-icon:hover .overview-icon, .app-folder.grid-search-result:checked .overview-icon:hover .overview-icon {
      background-color: rgba(246, 245, 244, 0.25); }
  .app-well-app.app-folder:drop .overview-icon, .app-folder.grid-search-result:drop .overview-icon {
    border: 2px solid rgba(53, 132, 228, 0.8);
    background-color: rgba(53, 132, 228, 0.2); }

.app-folder-dialog {
  border-radius: 64px;
  background-color: #${palette[0]};
  padding: 12px;
  box-shadow: inset 0 0 0 1px #${palette[2]}; }
  .app-folder-dialog .folder-name-container {
    padding: 24px 36px 0;
    spacing: 12px;
    /* FIXME: this is to keep the label in sync with the entry */ }
    .app-folder-dialog .folder-name-container .folder-name-entry {
      width: 12em;
      border-radius: 16px; }
    .app-folder-dialog .folder-name-container .folder-name-label {
      padding: 5px 7px;
      color: #${palette[2]}; }
    .app-folder-dialog .folder-name-container .edit-folder-button {
      padding: 0;
      width: 36px;
      height: 36px;
      border-radius: 99px; }
      .app-folder-dialog .folder-name-container .edit-folder-button > StIcon {
        icon-size: 1.09em; }
  .app-folder-dialog .icon-grid {
    row-spacing: 12px;
    column-spacing: 30px;
    page-padding-top: 0;
    page-padding-bottom: 0;
    page-padding-left: 0;
    page-padding-right: 0; }
  .app-folder-dialog .page-indicators {
    margin-bottom: 18px; }

.app-folder-dialog-container {
  padding: 12px;
  width: 720px;
  height: 720px; }

.app-well-app-running-dot {
  height: 5px;
  width: 5px;
  border-radius: 5px;
  margin-bottom: 8px;
  background-color: #${palette[2]}; }

.rename-folder-popup .rename-folder-popup-item {
  spacing: 6px; }
  .rename-folder-popup .rename-folder-popup-item:ltr, .rename-folder-popup .rename-folder-popup-item:rtl {
    padding: 0 12px; }

.page-indicator {
  padding: 6px 12px 0;
  transition-duration: 400ms; }
  .page-indicator .page-indicator-icon {
    width: 10px;
    height: 10px;
    border-radius: 10px;
    background-color: #${palette[2]}; }

.apps-scroll-view {
  padding: 0; }

.system-action-icon {
  background-color: rgba(246, 245, 244, 0.1);
  color: #${palette[2]};
  border-radius: 99px;
  icon-size: 48px; }

.page-navigation-hint.dnd {
  background: rgba(255, 255, 255, 0.1); }

.page-navigation-hint.next:ltr, .page-navigation-hint.previous:rtl {
  background-gradient-start: rgba(255, 255, 255, 0.05);
  background-gradient-end: transparent;
  background-gradient-direction: horizontal;
  border-radius: 24px 0px 0px 24px; }

.page-navigation-hint.previous:ltr, .page-navigation-hint.next:rtl {
  background-gradient-start: transparent;
  background-gradient-end: rgba(255, 255, 255, 0.05);
  background-gradient-direction: horizontal;
  border-radius: 0px 24px 24px 0px; }

.page-navigation-arrow {
  margin: 6px;
  padding: 18px;
  width: 24px;
  height: 24px;
  border-radius: 99px; }
  .page-navigation-arrow > StIcon {
    color: #${palette[2]}; }
  .page-navigation-arrow:insensitive {
    transition-duration: 100ms;
    background-color: transparent;
    background-color: none;
    box-shadow: none; }
    .page-navigation-arrow:insensitive:insensitive {
      transition-duration: 100ms;
      color: rgba(255, 255, 255, 0.5);
      background-color: rgba(255, 255, 255, 0.05);
      background-color: transparent;
      color: rgba(255, 255, 255, 0.5); }
  .page-navigation-arrow:hover {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: rgba(105, 105, 105, 0.545); }
  .page-navigation-arrow:active {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: rgba(112, 112, 112, 0.545); }

/* Workspace pager */
.workspace-thumbnails {
  visible-width: 32px;
  spacing: 6px;
  padding: 6px; }
  .workspace-thumbnails .workspace-thumbnail {
    color: #${palette[2]};
    background-color: #${palette[1]};
    border-radius: 4px;
    border: 1px solid transparent; }
  .workspace-thumbnails .placeholder {
    background-image: url("resource:///org/gnome/shell/theme/workspace-placeholder.svg");
    background-size: contain;
    width: 18px; }

.workspace-thumbnail-indicator {
  border: 3px solid #${palette[7]};
  border-radius: 8px; }

.ripple-pointer-location {
  width: 50px;
  height: 50px;
  border-radius: 25px;
  background-color: rgba(188, 214, 246, 0.3);
  box-shadow: 0 0 2px 2px #${palette[7]}; }

.pie-timer {
  width: 60px;
  height: 60px;
  -pie-border-width: 3px;
  -pie-border-color: #${palette[7]};
  -pie-background-color: rgba(233, 242, 252, 0.3); }

.magnifier-zoom-region {
  border: 2px solid #${palette[7]}; }
  .magnifier-zoom-region.full-screen {
    border-width: 0; }

.select-area-rubberband {
  background-color: rgba(53, 132, 228, 0.3);
  border: 1px solid #${palette[7]}; }

.user-icon {
  background-size: contain;
  color: #${palette[2]};
  border-radius: 99px;
  icon-size: 4.36em; }
  .user-icon StIcon {
    background-color: rgba(255, 255, 255, 0.05);
    border-radius: 99px;
    padding: 12px;
    width: 2.725em;
    height: 2.725em; }
  .user-icon.user-avatar {
    box-shadow: inset 0 0 0 1px rgba(255, 255, 255, 0.1); }

.lightbox {
  background-color: #${palette[2]}; }

.flashspot {
  background-color: #${palette[2]}; }

.hidden {
  color: transparent; }

.caps-lock-warning-label {
  text-align: center;
  padding-bottom: 8px;
  color: #${palette[5]}; }

/* Workspace animation */
.workspace-animation {
  background-color: #${palette[0]}; }

/* Tiled window previews */
.tile-preview {
  background-color: rgba(53, 132, 228, 0.5);
  border: 1px solid #${palette[7]}; }

/* On-screen Keyboard */
#keyboard {
  background-color: #${palette[0]};
  box-shadow: inset 0 1px 0 0 rgba(255, 255, 255, 0.02); }
  #keyboard .page-indicator {
    padding: 6px; }
    #keyboard .page-indicator .page-indicator-icon {
      width: 8px;
      height: 8px; }

.key-container {
  padding: 4px;
  spacing: 4px; }

.keyboard-key {
  font-size: 16pt;
  font-weight: bold;
  min-height: 1.2em;
  min-width: 1.2em;
  border-width: 1px;
  border-style: solid;
  border-radius: 12px;
  box-shadow: 0 1px 0 0 rgba(0, 0, 0, 0.2);
  color: #${palette[2]};
  background-color: #${palette[0]}; }
  .keyboard-key:focus {
    color: #${palette[2]};
    background-color: #${palette[0]};
    box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.6); }
    .keyboard-key:focus:hover {
      background-color: #${palette[1]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7); }
    .keyboard-key:focus:active {
      background-color: #${palette[1]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7); }
  .keyboard-key:hover {
    color: #${palette[2]};
    background-color: #${palette[0]}; }
  .keyboard-key:active {
    color: #${palette[2]};
    background-color: #${palette[3]}; }
  .keyboard-key:checked {
    color: #${palette[2]};
    background-color: #${palette[1]}; }
  .keyboard-key:grayed {
    background-color: #${palette[0]};
    color: #${palette[2]};
    border-color: rgba(255, 255, 255, 0.1); }
  .keyboard-key.default-key {
    color: #${palette[2]};
    background-color: #${palette[0]};
    border-radius: 12px; }
    .keyboard-key.default-key:hover {
      color: #${palette[2]};
      background-color: #${palette[1]}; }
    .keyboard-key.default-key:active {
      color: #${palette[2]};
      background-color: #${palette[1]}; }
    .keyboard-key.default-key:checked {
      color: #${palette[2]};
      background-color: #${palette[1]}; }
    .keyboard-key.default-key:latched {
      border-color: #${palette[7]};
      background-color: #${palette[7]}; }
  .keyboard-key.enter-key {
    color: #${palette[2]};
    background-color: #${palette[7]};
    border-radius: 12px;
    color: #${palette[2]}; }
    .keyboard-key.enter-key:hover {
      color: #${palette[2]};
      background-color: #${palette[7]}; }
    .keyboard-key.enter-key:active {
      color: #${palette[2]};
      background-color: #${palette[7]}; }
    .keyboard-key.enter-key:checked {
      color: #${palette[2]};
      background-color: #${palette[7]}; }
  .keyboard-key.shift-key-uppercase {
    background-color: gray;
    color: #${palette[0]}; }
    .keyboard-key.shift-key-uppercase:hover {
      background-color: #${palette[1]};
      color: #${palette[2]}; }
  .keyboard-key StIcon {
    icon-size: 24px; }

.keyboard-subkeys {
  -arrow-border-radius: 16px;
  -arrow-background-color: #${palette[0]};
  -arrow-border-width: 1px;
  -arrow-border-color: #${palette[1]};
  -arrow-base: 20px;
  -arrow-rise: 10px;
  -boxpointer-gap: 6px;
  padding: 6px; }
  .keyboard-subkeys .keyboard-key {
    color: #${palette[2]};
    background-color: #${palette[0]};
    border-radius: 12px; }
    .keyboard-subkeys .keyboard-key:focus {
      color: #${palette[2]};
      background-color: #${palette[0]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.6); }
      .keyboard-subkeys .keyboard-key:focus:hover {
        background-color: #${palette[1]};
        box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7); }
      .keyboard-subkeys .keyboard-key:focus:active {
        background-color: #${palette[1]};
        box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7); }
    .keyboard-subkeys .keyboard-key:hover {
      color: #${palette[2]};
      background-color: #${palette[0]}; }
    .keyboard-subkeys .keyboard-key:active {
      color: #${palette[2]};
      background-color: #${palette[3]}; }
    .keyboard-subkeys .keyboard-key:checked {
      color: #${palette[2]};
      background-color: #${palette[1]}; }

.emoji-page .keyboard-key {
  background-color: transparent;
  border: none;
  color: initial; }

.emoji-panel .keyboard-key:latched {
  border-color: #${palette[7]};
  background-color: #${palette[7]}; }

.word-suggestions {
  font-size: 12pt;
  spacing: 12px;
  min-height: 17pt;
  padding: 12px;
  color: #${palette[2]}; }
  .word-suggestions StButton {
    margin: 0 3px;
    min-width: 32px;
    border-radius: 6px;
    padding: 0px 18px;
    background-color: transparent;
    background-image: none; }
    .word-suggestions StButton:focus {
      color: #${palette[2]};
      background-color: #${palette[0]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.6); }
      .word-suggestions StButton:focus:hover {
        background-color: #${palette[1]};
        box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7); }
      .word-suggestions StButton:focus:active {
        background-color: #${palette[1]};
        box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7); }
    .word-suggestions StButton:hover {
      color: #${palette[2]};
      background-color: #${palette[0]}; }
    .word-suggestions StButton:active {
      color: #${palette[2]};
      background-color: #${palette[3]}; }
    .word-suggestions StButton:checked {
      color: #${palette[2]};
      background-color: #${palette[1]}; }

/* Looking Glass */
#LookingGlassDialog {
  background-color: rgba(53, 53, 53, 0.98);
  color: #${palette[2]};
  border-radius: 0 0 16px 16px;
  border-top-width: 0;
  padding: 6px;
  spacing: 6px;
  box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2); }
  #LookingGlassDialog > #Toolbar {
    border: none;
    padding: 6px;
    border-radius: 0;
    background-color: transparent;
    spacing: 6px; }
    #LookingGlassDialog > #Toolbar .lg-toolbar-button {
      padding: 6px 12px; }
      #LookingGlassDialog > #Toolbar .lg-toolbar-button > StIcon {
        icon-size: 1.09em; }
  #LookingGlassDialog .labels {
    spacing: 6px; }
  #LookingGlassDialog .notebook-tab {
    -natural-hpadding: 12px;
    -minimum-hpadding: 12px;
    padding: 6px 12px; }
  #LookingGlassDialog StBoxLayout#EvalBox {
    padding: 4px;
    spacing: 6px;
    padding: 6px; }
  #LookingGlassDialog StBoxLayout#ResultsArea {
    spacing: 6px;
    padding: 6px; }

.lg-dialog StEntry {
  min-height: 22px; }

.lg-dialog .shell-link {
  color: #${palette[7]}; }
  .lg-dialog .shell-link:hover {
    color: #${palette[7]}; }
  .lg-dialog .shell-link:active {
    color: #${palette[7]}; }

.lg-dialog .actor-link {
  color: #${palette[3]}; }
  .lg-dialog .actor-link:hover {
    color: #${palette[3]}; }
  .lg-dialog .actor-link:active {
    color: #${palette[3]}; }
  .lg-dialog .actor-link StIcon {
    icon-size: 12px; }

.lg-completions-text {
  font-style: italic; }

.lg-obj-inspector-title {
  spacing: 6px; }

.lg-obj-inspector-button {
  border: 1px solid rgba(255, 255, 255, 0.1);
  padding: 4px;
  border-radius: 8px; }
  .lg-obj-inspector-button:hover {
    border: 1px solid #${palette[2]}; }

#lookingGlassExtensions {
  padding: 6px; }

.lg-extensions-list {
  padding: 6px;
  spacing: 6px; }

.lg-extension {
  padding: 12px;
  border-radius: 12px;
  margin: 4px;
  transition-duration: 100ms;
  color: #${palette[2]};
  background-color: #${palette[0]}; }
  .lg-extension:hover {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]}; }
  .lg-extension:active {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]}; }
  .lg-extension:focus {
    transition-duration: 100ms;
    color: #${palette[2]};
    background-color: #${palette[0]};
    box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.6) !important; }
    .lg-extension:focus:hover {
      background-color: #${palette[0]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7) !important; }
    .lg-extension:focus:active {
      background-color: #${palette[0]};
      box-shadow: inset 0 0 0 2px rgba(53, 132, 228, 0.7) !important; }
  .lg-extension:insensitive {
    transition-duration: 100ms;
    color: rgba(255, 255, 255, 0.5);
    background-color: rgba(255, 255, 255, 0.05); }

.lg-extension-meta {
  spacing: 6px; }

#LookingGlassPropertyInspector {
  background: #${palette[0]};
  border: 1px solid rgba(255, 255, 255, 0.1);
  border-radius: 8px;
  padding: 6px; }

.lg-debug-flag-button {
  color: #${palette[2]}; }
  .lg-debug-flag-button StLabel {
    padding: 6px, 12px; }
  .lg-debug-flag-button:hover {
    color: #${palette[2]}; }
  .lg-debug-flag-button:active {
    color: #${palette[3]}; }

.lg-debug-flags-header {
  padding-top: 12px;
  padding: 6px; }

.login-dialog .caps-lock-warning-label,
.login-dialog .login-dialog-message-warning,
.unlock-dialog .caps-lock-warning-label,
.unlock-dialog .login-dialog-message-warning {
  color: #${palette[2]}; }

/* Login Dialog */
.login-dialog {
  background-color: #${palette[0]}; }

.login-dialog-button.cancel-button {
  padding: 9px; }

.login-dialog-button-box {
  width: 23em;
  spacing: 12px; }

.login-dialog-logo-bin {
  margin: 3em 0; }

.login-dialog-banner {
  color: #${palette[3]}; }

.login-dialog-banner-view {
  max-width: 23em; }

.login-dialog-message {
  text-align: center; }

.login-dialog-user-selection-box {
  padding: 100px 0px; }

.login-dialog-not-listed-label {
  font-size: 11pt;
  font-weight: bold;
  color: #${palette[3]};
  padding: 12px; }
  .login-dialog-not-listed-button:focus .login-dialog-not-listed-label, .login-dialog-not-listed-button:hover .login-dialog-not-listed-label {
    color: #${palette[2]}; }
  .login-dialog-not-listed-button:focus .login-dialog-not-listed-label {
    text-decoration: underline; }

.login-dialog-auth-list-view {
  -st-vfade-offset: 1em; }

.login-dialog-auth-list {
  spacing: 6px;
  margin-left: 2em; }

.login-dialog-auth-list-title {
  margin-left: 2em; }

.login-dialog-auth-list-item {
  border-radius: 16px;
  padding: 4px;
  color: #${palette[3]}; }
  .login-dialog-auth-list-item:focus, .login-dialog-auth-list-item:selected {
    background-color: #${palette[7]};
    color: #${palette[2]}; }

.login-dialog-auth-list-label {
  font-size: 13pt;
  font-weight: bold;
  padding-left: 15px; }
  .login-dialog-auth-list-label:ltr {
    padding-left: 14px;
    text-align: left; }
  .login-dialog-auth-list-label:rtl {
    padding-right: 14px;
    text-align: right; }

.login-dialog-user-list-view {
  -st-vfade-offset: 1em; }

.login-dialog-user-list {
  spacing: 12px;
  width: 23em; }
  .login-dialog-user-list .login-dialog-user-list-item {
    border-radius: 12px;
    padding: 6px;
    background-color: rgba(246, 245, 244, 0.05);
    color: #${palette[2]}; }
    .login-dialog-user-list .login-dialog-user-list-item .user-widget .user-icon {
      border: 4px solid transparent; }
    .login-dialog-user-list .login-dialog-user-list-item .login-dialog-timed-login-indicator {
      height: 2px;
      margin-top: 6px;
      background-color: #${palette[3]}; }
    .login-dialog-user-list .login-dialog-user-list-item:focus .login-dialog-timed-login-indicator {
      background-color: #${palette[2]}; }
  .login-dialog-user-list:expanded .login-dialog-user-list-item {
    transition-duration: 300ms;
    transition-timing-function: ease; }
    .login-dialog-user-list:expanded .login-dialog-user-list-item:hover {
      background-color: rgba(246, 245, 244, 0.1);
      color: #${palette[2]}; }
    .login-dialog-user-list:expanded .login-dialog-user-list-item:selected {
      background-color: #${palette[7]};
      color: #${palette[2]}; }
      .login-dialog-user-list:expanded .login-dialog-user-list-item:selected:hover {
        background-color: #${palette[7]}; }
    .login-dialog-user-list:expanded .login-dialog-user-list-item:logged-in .user-widget .user-icon {
      border-color: #${palette[7]}; }

.login-dialog-prompt-layout {
  spacing: 12px;
  width: 26em; }

/* Screen Shield */
.unlock-dialog {
  background-color: transparent; }

.screen-shield-background {
  background: #${palette[2]};
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.6); }

#lockDialogGroup {
  background-color: #${palette[0]}; }

.unlock-dialog-clock {
  color: #${palette[2]};
  spacing: 2em; }
  .unlock-dialog-clock .unlock-dialog-clock-time {
    font-size: 72pt;
    font-weight: 200; }
  .unlock-dialog-clock .unlock-dialog-clock-date {
    font-weight: 400; }
  .unlock-dialog-clock .unlock-dialog-clock-hint {
    margin-top: 2em;
    padding: 6px 18px;
    border-radius: 16px;
    font-weight: bold; }

#unlockDialogNotifications StButton#vhandle, #unlockDialogNotifications StButton#hhandle {
  background-color: rgba(53, 53, 53, 0.3); }
  #unlockDialogNotifications StButton#vhandle:hover, #unlockDialogNotifications StButton#vhandle:focus, #unlockDialogNotifications StButton#hhandle:hover, #unlockDialogNotifications StButton#hhandle:focus {
    background-color: rgba(53, 53, 53, 0.5); }
  #unlockDialogNotifications StButton#vhandle:active, #unlockDialogNotifications StButton#hhandle:active {
    background-color: rgba(53, 132, 228, 0.5); }

.unlock-dialog-notifications-container {
  margin: 12px;
  spacing: 6px;
  width: 23em;
  background-color: transparent; }
  .unlock-dialog-notifications-container .summary-notification-stack-scrollview {
    padding-top: 0;
    padding-bottom: 0; }
  .unlock-dialog-notifications-container .notification,
  .unlock-dialog-notifications-container .unlock-dialog-notification-source {
    padding: 12px 16px;
    border: none;
    background-color: rgba(246, 245, 244, 0.1);
    color: #${palette[2]};
    border-radius: 16px; }
    .unlock-dialog-notifications-container .notification.critical,
    .unlock-dialog-notifications-container .unlock-dialog-notification-source.critical {
      background-color: rgba(246, 245, 244, 0.2); }

.unlock-dialog-notification-label {
  padding-left: 12px;
  padding-right: 0; }
  .unlock-dialog-notification-label:rtl {
    padding-right: 12px;
    padding-left: 0; }

.unlock-dialog-notification-count-text {
  font-weight: bold;
  padding: 0 12px;
  color: #${palette[2]};
  background-color: rgba(246, 245, 244, 0.1);
  border-radius: 99px; }

.user-widget .user-widget-label {
  color: #${palette[2]}; }

.user-widget.horizontal {
  spacing: 18px; }
  .user-widget.horizontal .user-icon StIcon {
    padding: 12px;
    icon-size: 2.18em;
    width: 3.27em;
    height: 3.27em;
    background-color: rgba(246, 245, 244, 0.1); }

.user-widget.vertical {
  spacing: 24px; }
  .user-widget.vertical .user-widget-label {
    text-align: center;
    margin-bottom: .75em; }
  .user-widget.vertical .user-icon {
    icon-size: 10.9em; }
    .user-widget.vertical .user-icon StIcon {
      padding: 32px;
      icon-size: 4.36em;
      background-color: rgba(246, 245, 244, 0.1); }
THEME
)"

printf '%s' "$output" > "${dest_dir}/${dest_file}"
