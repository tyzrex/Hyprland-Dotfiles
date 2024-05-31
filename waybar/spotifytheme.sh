#!/bin/bash

# Ensure yq is installed
if ! command -v yq &> /dev/null
then
    echo "yq could not be found, please install it first."
    exit
fi

# File paths
COLORS_YML="$HOME/.cache/wal/colors.yml"
COLOR_INI="$HOME/.config/spicetify/Themes/tyzrex/color.ini"

# Function to format color (remove # and ensure it's 6 digits)
format_color() {
    color=$(yq "$1" $COLORS_YML)
    echo "${color:2:6}"
}

# Read and format colors from YAML file
background=$(format_color '.special.background')
foreground=$(format_color '.special.foreground')
color2=$(format_color '.colors.color2')
color3=$(format_color '.colors.color3')

# Write to color.ini file
cat > $COLOR_INI <<EOL
[base]
text               = FFFFFF
subtext            = FFFFFF
sidebar-text       = FFFFFF
main               = $color2
sidebar            = $color3
player             = 22292a
card               = $color3
shadow             = 202020
selected-row       = 797979
button             = $color3
button-active      = $foreground
button-disabled    = 535353
tab-active         = $background
notification       = 1db954
notification-error = e22134
misc               = $background
EOL

echo "color.ini file has been populated successfully."
