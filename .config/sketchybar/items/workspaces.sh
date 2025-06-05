#!/bin/sh

sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
	sketchybar --add item space.$sid left \
		--subscribe space.$sid aerospace_workspace_change \
		--set space.$sid \
		background.color=$BG_COLOR \
		background.corner_radius=5 \
		background.drawing=off \
		label="$sid" \
		label.padding_left=12 \
		label.padding_right=12 \
		icon.padding_right=0 \
		icon.padding_left=0 \
		icon.font="sketchybar-app-font:Regular:16.0" \
		padding_left=2 \
		padding_right=2 \
		position=center \
		click_script="aerospace workspace $sid" \
		script="$CONFIG_DIR/plugins/aerospace.sh $sid"
done
