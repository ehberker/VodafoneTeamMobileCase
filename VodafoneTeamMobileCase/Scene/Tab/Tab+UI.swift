//
//  Tab+UI.swift
//  VodofoneTeamCase
//
//  Created by enes huseyin berker on 26.01.2023.
//

import SwiftUI

extension TabScene {
    var bodyView: some View {
        TabView(selection: $appEnvironment.tabItem) {
            AppsScene()
                .tabItem{
                    Label(
                        "Apps",
                        systemImage: "house"
                    )
                }
                .tag(TabItem.apps)

            BooksScene()
                .tabItem{
                    Label(
                        "Books",
                        systemImage: "books.vertical"
                    )
                }
                .tag(TabItem.books)

            MoviesScene()
                .tabItem{
                    Label(
                        "Movies",
                        systemImage: "tv"
                    )
                }
                .tag(TabItem.movies)


            MusicScene()
                .tabItem{
                    Label(
                        "Music",
                        systemImage: "music.mic"
                    )
                }
                .tag(TabItem.music)

        }
    }
}

// MARK: - PreviewProvider

struct TabSceneUI_Previews: PreviewProvider {
    static var previews: some View {
        TabScene()
    }
}
