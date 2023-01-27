//
//  BooksScene.swift
//  VodofoneTeamCase
//
//  Created by enes huseyin berker on 26.01.2023.
//

import SwiftUI

struct BooksScene: View {

    @EnvironmentObject var appEnvironment: AppEnvironment
    @StateObject var viewModel: BooksViewModel = .init()
    @StateObject var data: BooksData = .init()

    var body: some View {
        bodyView
            .onAppear(perform: self.onAppear)
            .sheet(item: $viewModel.sheet) { $0.view}
            .fullScreenCover(item: $viewModel.fullScreenCover) { $0.view }
            .alert(item: self.$viewModel.alert) { $0.alert() }
    }
    func onAppear(){
        if viewModel.books.isEmpty{
            viewModel.fetchBooks(for: "entrepreneur", completion: {})
        }
    }
}

struct BooksScene_Previews: PreviewProvider {
    static var previews: some View {
        BooksScene()
    }
}
