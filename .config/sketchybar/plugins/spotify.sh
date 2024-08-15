#!/bin/sh

source "${XDG_CONFIG_HOME:-$HOME/.config}"/colors.sh
source "${XDG_CONFIG_HOME:-$HOME/.config}"/icons.sh

# Color Palette
export BLACK=0xff181926
export WHITE=0xffcad3f5
export RED=0xffed8796
export GREEN=0xffa6da95
export BLUE=0xff8aadf4
export YELLOW=0xffeed49f
export ORANGE=0xfff5a97f
export MAGENTA=0xffc6a0f6
export GREY=0xff939ab7
export TRANSPARENT=0x00000000

# General bar colors
export BAR_COLOR=0xcc24273a
export ICON_COLOR=$WHITE # Color of all icons
export LABEL_COLOR=$WHITE # Color of all labels
export BACKGROUND_1=0xff3c3e4f
export BACKGROUND_2=0xff494d64

export POPUP_BACKGROUND_COLOR=$BLACK
export POPUP_BORDER_COLOR=$WHITE

export SHADOW_COLOR=$BLACK

# Custom
export BAR_BACKGROUND=0xff272727
export BAR_INACTIVE_ICON=0xff83725B
export BAR_ACTIVE_ICON=0xffAD946E

export BAR_RED=0xffE96862
export BAR_ORANGE=0xffE5894E
export BAR_GREEN=0xffA8B665
export BAR_PINK=0xffD3859B
export BAR_BLUE=0xff7CAEA3
export BAR_ACQUA=0xff89B482
export BAR_YELLOW=0xffE2A84F

SPOTIFY_EVENT="com.spotify.client.PlaybackStateChanged"
POPUP_SCRIPT="sketchybar -m --set spotify.anchor popup.drawing=false"

sketchybar --add       event           spotify_change $SPOTIFY_EVENT        \
           --add       item            spotify.anchor left                \
           --set       spotify.anchor  script="$PLUGIN_DIR/spotify.sh"      \
                                       click_script="$POPUP_SCRIPT"         \
                                       popup.horizontal=on                  \
                                       popup.align=right                   \
                                       popup.height=120                     \
                                       popup.y_offset=-7                     \
                                       icon=$ICON_SPOTIFY                               \
                                       icon.color=$BAR_GREEN \
                                       icon.padding_left=$DATA_ICON_PADDING_LEFT \
                                       label.color=$BAR_GREEN \
                                       label="N/A"      \
                                       label.padding_right=$DATA_LABEL_PADDING_RIGHT \
                                       icon.padding_right=$DATA_ICON_PADDING_RIGHT              \
                                       background.padding_left=$DATA_BACKGROUND_PADDING_LEFT \
                                       background.border_width=1\
                                       background.border_color=$BAR_BACKGROUND\
                                       background.corner_radius=6                        \
                                       background.drawing=on \
                                         popup.background.border_width=2                   \
                                         popup.background.corner_radius=9                  \
                                         popup.background.border_color=$BAR_GREEN \
                                         popup.background.color=$BAR_BACKGROUND    \
                                         popup.background.shadow.drawing=on \
                    click_script="sketchybar -m --set \$NAME popup.drawing=toggle" \
           --subscribe spotify.anchor  mouse.entered mouse.exited           \
                                       mouse.exited.global                  \
           --add       item            spotify.cover popup.spotify.anchor   \
           --set       spotify.cover   script="$PLUGIN_DIR/spotify.sh"      \
                                       label.drawing=off                    \
                                       icon.drawing=off                     \
                                       background.padding_left=12           \
                                       background.padding_right=10          \
                                       background.image.scale=0.15          \
                                       background.image.drawing=on          \
                                       background.drawing=on                \
                                                                            \
           --add       item            spotify.title popup.spotify.anchor   \
           --set       spotify.title   icon.drawing=off                     \
                                       background.padding_left=0            \
                                       background.padding_right=0           \
                                       width=0                              \
                                       label.font="$FONT:Heavy:14.0"        \
                                       y_offset=40                          \
                                                                            \
           --add       item            spotify.artist popup.spotify.anchor  \
           --set       spotify.artist  icon.drawing=off                     \
                                       y_offset=20                          \
                                       background.padding_left=0            \
                                       background.padding_right=0           \
                                       width=0                              \
                                                                            \
           --add       item            spotify.album popup.spotify.anchor   \
           --set       spotify.album   icon.drawing=off                     \
                                       background.padding_left=0            \
                                       background.padding_right=0           \
                                       y_offset=3                           \
                                       width=0                              \
                                                                            \
           --add       item            spotify.shuffle popup.spotify.anchor \
           --set       spotify.shuffle icon=􀊝                               \
                                       icon.y_offset=5 \
                                       icon.padding_left=5                  \
                                       icon.padding_right=5                 \
                                       icon.color=$BLACK                    \
                                       icon.highlight_color=$MAGENTA        \
                                       label.drawing=off                    \
                                       script="$PLUGIN_DIR/spotify.sh"      \
                                       y_offset=-32                         \
           --subscribe spotify.shuffle mouse.clicked                        \
                                                                            \
           --add       item            spotify.back popup.spotify.anchor    \
           --set       spotify.back    icon=􀊎                               \
                                       icon.y_offset=5 \
                                       icon.padding_left=5                  \
                                       icon.padding_right=5                 \
                                       icon.color=$BLACK                    \
                                       script="$PLUGIN_DIR/spotify.sh"      \
                                       label.drawing=off                    \
                                       y_offset=-32                         \
           --subscribe spotify.back    mouse.clicked                        \
                                                                            \
           --add       item            spotify.play popup.spotify.anchor    \
           --set       spotify.play    icon=􀊔                               \
                                       background.height=40                 \
                                       background.corner_radius=20          \
                                       width=40                             \
                                       align=center                         \
                                       background.color=$BAR_ACQUA                \
                                       background.border_color=$BAR_BACKGROUND       \
                                       background.border_width=1            \
                                       background.drawing=on                \
                                       icon.padding_left=6                  \
                                       icon.padding_right=3                 \
                                       icon.color=$BAR_BACKGROUND                    \
                                       updates=on                           \
                                       label.drawing=off                    \
                                       script="$PLUGIN_DIR/spotify.sh"      \
                                       y_offset=-30                         \
           --subscribe spotify.play    mouse.clicked spotify_change         \
                                                                            \
           --add       item            spotify.next popup.spotify.anchor    \
           --set       spotify.next    icon=􀊐                               \
                                       icon.y_offset=5 \
                                       icon.padding_left=5                  \
                                       icon.padding_right=5                 \
                                       icon.color=$BLACK                    \
                                       label.drawing=off                    \
                                       script="$PLUGIN_DIR/spotify.sh"      \
                                       y_offset=-32                         \
           --subscribe spotify.next    mouse.clicked                        \
                                                                            \
           --add       item            spotify.repeat popup.spotify.anchor  \
           --set       spotify.repeat  icon=􀊞                               \
                                       icon.y_offset=5 \
                                       icon.highlight_color=$MAGENTA        \
                                       icon.padding_left=5                  \
                                       icon.padding_right=10                \
                                       icon.color=$BLACK                    \
                                       label.drawing=off                    \
                                       script="$PLUGIN_DIR/spotify.sh"      \
                                       y_offset=-32                         \
           --subscribe spotify.repeat  mouse.clicked                        \
                                                                            \
           --add       item            spotify.spacer popup.spotify.anchor  \
           --set       spotify.spacer  width=5                              \
                                                                            \
           --add      bracket          spotify spotify.shuffle              \
                                               spotify.back                 \
                                               spotify.play                 \
                                               spotify.next                 \
                                               spotify.repeat               \
                                               spotify.artist               \
                                               spotify.album               \
                                               spotify.title               \
           --set      spotify          background.color=$BAR_GREEN              \
                                       background.corner_radius=11          \
                                       background.drawing=on                \
                                       y_offset=-30                         \