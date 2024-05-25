#!/bin/sh

# retrieve directory of thi script
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# argument for themes directory from my dotfiles must be passed
if [ $# -ne 1 ];
then
    echo "Please pass a single themes directory from LibrePhoenix's config";
else
    # for every theme in my dotfiles
    # generate an appropriate theme.json for Element
    THEMES_DIR=$1;
    for dir in $THEMES_DIR/*; do
        if [[ -d $dir ]]; then
          theme=$(echo $(basename $dir));
          mkdir -p $SCRIPT_DIR/$(basename $dir)
          themename=$(cat $THEMES_DIR/$theme/$theme.yaml | grep scheme | awk -F\" '{ print $2 }')
          polarity=$(cat $THEMES_DIR/$theme/polarity.txt)
          isdark=$(if [ "$polarity" = "dark" ]; then echo "true"; else echo "false"; fi)
          base00=$(cat $THEMES_DIR/$theme/$theme.yaml | grep base00 | awk -F\" '{ print $2 }')
          base01=$(cat $THEMES_DIR/$theme/$theme.yaml | grep base01 | awk -F\" '{ print $2 }')
          base02=$(cat $THEMES_DIR/$theme/$theme.yaml | grep base02 | awk -F\" '{ print $2 }')
          base03=$(cat $THEMES_DIR/$theme/$theme.yaml | grep base03 | awk -F\" '{ print $2 }')
          base04=$(cat $THEMES_DIR/$theme/$theme.yaml | grep base04 | awk -F\" '{ print $2 }')
          base05=$(cat $THEMES_DIR/$theme/$theme.yaml | grep base05 | awk -F\" '{ print $2 }')
          base06=$(cat $THEMES_DIR/$theme/$theme.yaml | grep base06 | awk -F\" '{ print $2 }')
          base07=$(cat $THEMES_DIR/$theme/$theme.yaml | grep base07 | awk -F\" '{ print $2 }')
          base08=$(cat $THEMES_DIR/$theme/$theme.yaml | grep base08 | awk -F\" '{ print $2 }')
          base09=$(cat $THEMES_DIR/$theme/$theme.yaml | grep base09 | awk -F\" '{ print $2 }')
          base0A=$(cat $THEMES_DIR/$theme/$theme.yaml | grep base0A | awk -F\" '{ print $2 }')
          base0B=$(cat $THEMES_DIR/$theme/$theme.yaml | grep base0B | awk -F\" '{ print $2 }')
          base0C=$(cat $THEMES_DIR/$theme/$theme.yaml | grep base0C | awk -F\" '{ print $2 }')
          base0D=$(cat $THEMES_DIR/$theme/$theme.yaml | grep base0D | awk -F\" '{ print $2 }')
          base0E=$(cat $THEMES_DIR/$theme/$theme.yaml | grep base0E | awk -F\" '{ print $2 }')
          base0F=$(cat $THEMES_DIR/$theme/$theme.yaml | grep base0F | awk -F\" '{ print $2 }')
          echo "
{
    \"name\": \"$themename\",
    \"is_dark\": $isdark,
    \"colors\": {
        \"accent-color\": \"#$base0B\",
        \"primary-color\": \"#$base0C\",
        \"warning-color\": \"#$base08\",

        \"sidebar-color\": \"#$base00\",
        \"roomlist-background-color\": \"#$base01\",
        \"roomlist-text-color\": \"#$base0A\",
        \"roomlist-text-secondary-color\": \"#$base05\",
        \"roomlist-highlights-color\": \"#$base00\",
        \"roomlist-separator-color\": \"#$base02\",

        \"timeline-background-color\": \"#$base00\",
        \"timeline-text-color\": \"#$base06\",
        \"secondary-content\": \"#$base06\",
        \"tertiary-content\": \"#$base06\",
        \"timeline-text-secondary-color\": \"#$base0D\",
        \"timeline-highlights-color\": \"#$base01\",
        \"reaction-row-button-selected-bg-color\": \"$base08\"
    }
}" > $theme/$theme.json
        fi
    done
fi
