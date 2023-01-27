//
//  AlertContainer.swift
//  VodofoneTeamCase
//
//  Created by enes huseyin berker on 26.01.2023.
//

import SwiftUI

public struct AlertContainer: Identifiable {
    public var id = UUID()
    public var title: String
    public var message: String?
    public var dismissButton: Alert.Button?
    public var primaryButton: Alert.Button?

    public func alert() -> Alert {
        if let primaryButton = primaryButton, let dismissButton = dismissButton {
            return Alert(title: titleText, message: messageText, primaryButton: primaryButton,
                         secondaryButton: dismissButton)
        } else {
            return Alert(title: titleText, message: messageText, dismissButton: dismissButton)
        }
    }
}

public extension AlertContainer {
    private var messageText: Text? {
        if let message = message {
            return Text(message)
        }
        return nil
    }
    private var titleText: Text {
        Text(title)
    }
}
