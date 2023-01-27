//
//  SheetContainers.swift
//  VodofoneTeamCase
//
//  Created by enes huseyin berker on 26.01.2023.
//

import SwiftUI

public struct SheetContainer: Identifiable {

    public let id = UUID()
    public let view: AnyView
    public var onDismiss: (() -> Void)?

    public init(view: AnyView, onDismiss: (() -> Void)? = nil) {
        self.view = view
        self.onDismiss = onDismiss
    }
}
