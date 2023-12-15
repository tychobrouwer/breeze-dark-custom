#!/bin/bash

share=/usr/share
theme=breeze-dark-custom

[ -e "$share/plasma/desktoptheme/$theme" ] && rm -R "$share/plasma/desktoptheme/$theme"
[ -e "$share/plasma/look-and-feel/$theme" ] && rm -R "$share/plasma/look-and-feel/$theme"
[ -e "$share/aurorae/themes/$theme" ] && rm -R "$share/aurorae/themes/$theme"
[ -e "$share/sddm/themes/$theme" ] && rm -R "$share/sddm/themes/$theme"
[ -e "$share/wallpapers/$theme" ] && rm -R "$share/wallpapers/$theme"
[ -e "$share/themes/$theme" ] && rm -R "$share/themes/$theme"

cp -R aurorae $share
cp -R color-schemes $share
cp -R konsole $share
cp -R plasma $share
cp -R sddm $share
cp -R themes $share
cp -R wallpapers $share
