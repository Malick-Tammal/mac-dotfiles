#!/bin/sh

sketchybar --add item chevron left \
	--set chevron icon= label.drawing=off \
	icon.padding_right=10 \
	--add item front_app left \
	--set front_app background.color=$BG_COLOR \
	icon.color=$FG_COLOR \
	icon.font="sketchybar-app-font:Regular:16.0" \
	label.color=$FG_COLOR \
	script="$PLUGIN_DIR/front_app.sh" \
	--subscribe front_app front_app_switched
