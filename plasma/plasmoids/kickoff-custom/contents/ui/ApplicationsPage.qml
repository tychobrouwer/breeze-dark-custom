/*
 * SPDX-FileCopyrightText: 2021 Noah Davis <noahadvs@gmail.com>
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Templates 2.15 as T
import QtQml 2.15
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 3.0 as PC3
import org.kde.plasma.private.kicker 0.1 as Kicker

BasePage {
    id: root
    contentAreaComponent: VerticalStackView {
        id: stackView

        popEnter: Transition {
            NumberAnimation {
                property: "x"
                from: 0.5 * root.width
                to: 0
                duration: PlasmaCore.Units.longDuration
                easing.type: Easing.OutCubic
            }
            NumberAnimation {
                property: "opacity"
                from: 0.0
                to: 1.0
                duration: PlasmaCore.Units.longDuration
                easing.type: Easing.OutCubic
            }
        }

        pushEnter: Transition {
            NumberAnimation {
                property: "x"
                from: 0.5 * -root.width
                to: 0
                duration: PlasmaCore.Units.longDuration
                easing.type: Easing.OutCubic
            }
            NumberAnimation {
                property: "opacity"
                from: 0.0
                to: 1.0
                duration: PlasmaCore.Units.longDuration
                easing.type: Easing.OutCubic
            }
        }

        property int appsModelRow: 2
        readonly property Kicker.AppsModel appsModel: plasmoid.rootItem.rootModel.modelForRow(appsModelRow)
        focus: true
        initialItem: applicationsListViewComponent

        Component {
            id: applicationsListViewComponent

            KickoffListView {
                id: applicationsListView
                objectName: "applicationsListView"
                mainContentView: true
                model: stackView.appsModel
                section.property: model && model.description === "KICKER_ALL_MODEL" ? "group" : ""
                section.criteria: ViewSection.FirstCharacter
                hasSectionView: stackView.appsModelRow === 1

                onShowSectionViewRequested: {
                    stackView.push(applicationsSectionViewComponent, {
                        "currentSection": sectionName,
                        "parentView": applicationsListView
                    });
                }
            }
        }

        Component {
            id: applicationsSectionViewComponent

            SectionView {
                id: sectionView
                model: stackView.appsModel.sections

                onHideSectionViewRequested: {
                    stackView.pop();
                    stackView.currentItem.view.positionViewAtIndex(index, ListView.Beginning);
                    stackView.currentItem.currentIndex = index;
                }
            }
        }

        // Connections {
        //     target: root.sideBarItem
        //     function onCurrentIndexChanged() {
        //         // Only update row index if the condition is met.
        //         // The 0 index modelForRow isn't supposed to be used. That's just how it works.
        //         if (root.sideBarItem.currentIndex > 0) {
        //             appsModelRow = root.sideBarItem.currentIndex
        //         }
        //         if (root.sideBarItem.currentIndex === 1
        //             && stackView.currentItem.objectName !== "applicationsListView") {
        //             // Always use list view for alphabetical apps view since grid view doesn't have sections
        //             // TODO: maybe find a way to have a list view with grids in each section?
        //             stackView.replace(applicationsListViewComponent)
        //         } 
        //     }
        // }
        Connections {
            target: plasmoid
            function onExpandedChanged() {
                if (plasmoid.expanded) {
                    plasmoid.rootItem.contentArea.currentItem.forceActiveFocus()
                }
            }
        }
    }
    Binding {
        target: plasmoid.rootItem
        property: "contentArea"
        value: root.contentAreaItem.currentItem // NOT just root.contentAreaItem
        when: root.T.StackView.status === T.StackView.Active && root.visible
        restoreMode: Binding.RestoreBinding
    }
}
