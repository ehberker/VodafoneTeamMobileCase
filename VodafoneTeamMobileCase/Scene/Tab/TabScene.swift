//
//  TabScene.swift
//  VodofoneTeamCase
//
//  Created by enes huseyin berker on 26.01.2023.
//

import SwiftUI

struct TabScene: View {

    @EnvironmentObject var appEnvironment: AppEnvironment
    @StateObject var viewModel: TabViewModel = .init()
    @StateObject var data: TabData = .init()

    var body: some View {
        bodyView
            .onAppear(perform: self.onAppear)
            .sheet(item: $viewModel.sheet) { $0.view}
            .fullScreenCover(item: $viewModel.fullScreenCover) { $0.view }
            .alert(item: self.$viewModel.alert) { $0.alert() }
    }
    func onAppear(){

    }
}

struct TabScene_Previews: PreviewProvider {
    static var previews: some View {
        TabScene()
    }
}
