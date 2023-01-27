//
//  VodofoneTeamCaseApp.swift
//  VodofoneTeamCase
//
//  Created by enes huseyin berker on 26.01.2023.
//

import SwiftUI

@main
struct VodofoneTeamMobileCaseApp: App {
    @StateObject var appEnvironment: AppEnvironment = .init()
    var body: some Scene {
        WindowGroup {
            sceneContainer(.init(TabScene()))
        }
    }
}

// MARK: - Privates

private extension VodofoneTeamMobileCaseApp {

    func sceneContainer(_ scene: AnyView) -> some View {
        AnyView(scene)
            .environmentObject(appEnvironment)
    }
}
