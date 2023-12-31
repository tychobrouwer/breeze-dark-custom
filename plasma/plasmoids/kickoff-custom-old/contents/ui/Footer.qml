/*
 *    SPDX-FileCopyrightText: 2021 Mikel Johnson <mikel5764@gmail.com>
 *    SPDX-FileCopyrightText: 2021 Noah Davis <noahadvs@gmail.com>
 *
 *    SPDX-License-Identifier: GPL-2.0-or-later
 */

import QtQuick 2.15
import QtQml 2.15
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 3.0 as PC3
import org.kde.plasma.extras 2.0 as PlasmaExtras

PlasmaExtras.PlasmoidHeading {
    id: root

    property real preferredTabBarWidth: 0
    readonly property alias leaveButtons: leaveButtons

    contentHeight: leaveButtons.implicitHeight

    // We use an increased vertical padding to improve touch usability
    leftPadding: plasmoid.rootItem.backgroundMetrics.leftPadding
    rightPadding: plasmoid.rootItem.backgroundMetrics.rightPadding
    topPadding: PlasmaCore.Units.smallSpacing * 2
    bottomPadding: PlasmaCore.Units.smallSpacing * 2

    leftInset: 0
    rightInset: 0
    topInset: 0
    bottomInset: 0

    spacing: plasmoid.rootItem.backgroundMetrics.spacing
    position: PC3.ToolBar.Footer

    LeaveButtons {
        id: leaveButtons
        anchors {
            right: parent.right
            top: parent.top
            bottom: parent.bottom
            leftMargin: root.spacing
        }
        shouldCollapseButtons: root.spacing + buttonImplicitWidth > root.width
        Keys.onUpPressed: plasmoid.rootItem.contentArea.forceActiveFocus(Qt.BacktabFocusReason)
    }

    Behavior on height {
        enabled: plasmoid.expanded
        NumberAnimation {
            duration: PlasmaCore.Units.longDuration
            easing.type: Easing.InQuad
        }
    }
}
