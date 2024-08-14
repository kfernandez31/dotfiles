#!/bin/sh

source "${XDG_CONFIG_HOME:-$HOME/.config}"/colors.sh
source "${XDG_CONFIG_HOME:-$HOME/.config}"/icons.sh

CURRENT_WIFI="$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I)"
SSID="$(echo "$CURRENT_WIFI" | grep -o "SSID: .*" | sed 's/^SSID: //')"
CURR_TX="$(echo "$CURRENT_WIFI" | grep -o "lastTxRate: .*" | sed 's/^lastTxRate: //')"

SSID=$(networksetup -getairportnetwork en0 | awk -F': ' '{print $2}')
IS_VPN=$(scutil --nwi | grep -m1 'utun' | awk '{ print $1 }')

if [[ $SSID != "" ]]; then
	LABEL=$SSID
	if [[ $IS_VPN != "" ]]; then
		COLOR=$COLOR_CYAN
		ICON=$ICON_WIFI_LOCK
	else
		COLOR=$COLOR_BLUE
		ICON=$ICON_WIFI_UNLOCK
	fi
else
	COLOR=$COLOR_WHITE
	ICON=$ICON_WIFI_OFF
	LABEL="Not Connected"
fi

sketchybar --set $NAME background.color=$COLOR \
	icon=$ICON \
	label="$LABEL"
