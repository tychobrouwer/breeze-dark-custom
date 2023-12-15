#!/bin/bash

share=/usr/share
theme=breeze-dark-custom

[ -e "$share/plasma/desktoptheme/$theme" ] && rm -R "$share/plasma/desktoptheme/$theme"
[ -e "$share/plasma/look-and-feel/$theme" ] && rm -R "$share/plasma/look-and-feel/$theme"
[ -e "$share/aurorae/themes/$theme" ] && rm -R "$share/aurorae/themes/$theme"
[ -e "$share/sddm/themes/$theme" ] && rm -R "$share/sddm/themes/$theme"
[ -e "$share/wallpapers/$theme" ] && rm -R "$share/wallpapers/$theme"
[ -e "$share/themes/$theme" ] && rm -R "$share/themes/$theme"
[ -e "$share/icons/$theme" ] && rm -R "$share/icons/$theme"

cp -R aurorae $share
cp -R color-schemes $share
cp -R konsole $share
cp -R plasma $share
cp -R sddm $share
cp -R themes $share
cp -R wallpapers $share
cp -R icons $share

ln -s "$share/icons/$theme/16x16" "$share/icons/$theme/16x16@2x"
ln -s "$share/icons/$theme/16x16" "$share/icons/$theme/18x18@2x"
ln -s "$share/icons/$theme/16x16" "$share/icons/$theme/22x22@2x"
ln -s "$share/icons/$theme/16x16" "$share/icons/$theme/24x24@2x"
ln -s "$share/icons/$theme/32x32" "$share/icons/$theme/32x32@2x"
ln -s "$share/icons/$theme/48x48" "$share/icons/$theme/48x48@2x"
ln -s "$share/icons/$theme/48x48" "$share/icons/$theme/96x96"
ln -s "$share/icons/$theme/64x64" "$share/icons/$theme/64x64@2x"
ln -s "$share/icons/$theme/64x64" "$share/icons/$theme/128x128"

