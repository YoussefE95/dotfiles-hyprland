#!/bin/bash
hyprctl dispatch workspace $1
eww update ws_focus=$1
