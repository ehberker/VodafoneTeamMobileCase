//
//  MoviesScene.swift
//  VodofoneTeamCase
//
//  Created by enes huseyin berker on 26.01.2023.
//

import SwiftUI

struct MoviesScene: View {

    @EnvironmentObject var appEnvironment: AppEnvironment
    @StateObject var viewModel: MoviesViewModel = .init()
    @StateObject var data: MoviesData = .init()

    var body: some View {
        bodyView
            .onAppear(perform: self.onAppear)
            .sheet(item: $viewModel.sheet) { $0.view}
            .alert(item: self.$viewModel.alert) { $0.alert() }
    }
    func onAppear(){
        if viewModel.movies.isEmpty{
            viewModel.fetchMovies(for: "Iron", completion: {})
        }
    }
}

struct MoviesScene_Previews: PreviewProvider {
    static var previews: some View {
        MoviesScene()
    }
}
