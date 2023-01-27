//
//  TabViewModel.swift
//  VodofoneTeamCase
//
//  Created by enes huseyin berker on 26.01.2023.
//

import Foundation
import SwiftUI

final class TabViewModel: NSObject ,ObservableObject {

    // MARK: USE PUBLISHED WRAPPER TO LISTEN CHANGES
    @Published var sheet: SheetContainer?
    @Published var fullScreenCover: SheetContainer?
    @Published var alert: AlertContainer?

    @Published private var appEnvironmentWillChange: Void = ()

    var appEnvironment: AppEnvironment = .init()

    override init() {
        super.init()

        appEnvironment.objectWillChange.assign(to: &$appEnvironmentWillChange)

    }

}

// MARK: - Publics

extension TabViewModel {

}
