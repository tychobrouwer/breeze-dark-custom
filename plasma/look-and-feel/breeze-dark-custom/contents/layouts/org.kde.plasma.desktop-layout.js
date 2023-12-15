var plasma = getApiVersion(1);

var layout = {
    "desktops": [
        {
            "applets": [
            ],
            "config": {
                "/": {
                    "ItemGeometries-1280x800": "",
                    "ItemGeometries-1601x873": "",
                    "ItemGeometriesHorizontal": "",
                    "formfactor": "0",
                    "immutability": "1",
                    "lastScreen": "0",
                    "wallpaperplugin": "org.kde.image"
                },
                "/ConfigDialog": {
                    "DialogHeight": "540",
                    "DialogWidth": "720"
                },
                "/Wallpaper/org.kde.image/General": {
                    "Image": "/usr/share/wallpapers/my-theme/content/images/background.jpg",
                    "SlidePaths": "/home/tychob/.local/share/wallpapers/,/usr/share/wallpapers/"
                }
            },
            "wallpaperPlugin": "org.kde.image"
        }
    ],
    "panels": [
        {
            "alignment": "left",
            "applets": [
                {
                    "config": {
                        "/": {
                            "PreloadWeight": "100",
                            "popupHeight": "514",
                            "popupWidth": "651"
                        },
                        "/General": {
                            "favoritesPortedToKAstats": "true"
                        },
                        "/Shortcuts": {
                            "global": "Alt+F1"
                        }
                    },
                    "plugin": "org.kde.plasma.kickoff"
                },
                {
                    "config": {
                        "/ConfigDialog": {
                            "DialogHeight": "540",
                            "DialogWidth": "720"
                        },
                        "/General": {
                            "groupingStrategy": "0",
                            "highlightWindows": "false",
                            "launchers": "applications:systemsettings.desktop,preferred://filemanager,applications:thorium-browser.desktop,applications:org.kde.konsole.desktop,applications:Mailspring.desktop,applications:com.ktechpit.whatsie.desktop,applications:code.desktop,applications:org.kde.kate.desktop,applications:gimp.desktop,applications:com.github.iwalton3.jellyfin-media-player.desktop,applications:spotify.desktop,applications:steam.desktop,applications:net.lutris.Lutris.desktop,applications:minecraft-launcher.desktop",
                            "wheelEnabled": "false"
                        }
                    },
                    "plugin": "org.kde.plasma.icontasks"
                },
                {
                    "config": {
                    },
                    "plugin": "org.kde.plasma.marginsseparator"
                },
                {
                    "config": {
                        "/": {
                            "PreloadWeight": "95"
                        }
                    },
                    "plugin": "org.kde.plasma.systemtray"
                }
            ],
            "config": {
                "/": {
                    "formfactor": "2",
                    "immutability": "1",
                    "lastScreen": "0",
                    "wallpaperplugin": "org.kde.image"
                },
                "/ConfigDialog": {
                    "DialogHeight": "84",
                    "DialogWidth": "1601"
                }
            },
            "height": 2,
            "hiding": "normal",
            "location": "bottom",
            "maximumLength": 131,
            "minimumLength": 131,
            "offset": 0
        }
    ],
    "serializationFormatVersion": "1"
}
    ;

plasma.loadSerializedLayout(layout);
