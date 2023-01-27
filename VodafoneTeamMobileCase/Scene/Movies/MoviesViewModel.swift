//
//  MoviesViewModel.swift
//  VodofoneTeamCase
//
//  Created by enes huseyin berker on 26.01.2023.
//

import Foundation
import SwiftUI

final class MoviesViewModel: NSObject ,ObservableObject {

    // MARK: USE PUBLISHED WRAPPER TO LISTEN CHANGES
    @Published var sheet: SheetContainer?
    @Published var fullScreenCover: SheetContainer?
    @Published var alert: AlertContainer?
    @Published var movies: [MoviesModel] = [MoviesModel]()
    @Published var searchTerm: String = ""
    @Published var filter: MoviesFilterType = .none

    @Published private var appEnvironmentWillChange: Void = ()

    var appEnvironment: AppEnvironment = .init()

   
    var filteredMovies: [MoviesModel] {
        switch filter {
        case .none:
            return movies
        case .anime:
            return movies.filter{$0.primaryGenreName!.contains("Anime")}
        case .romance:
            return movies.filter{$0.primaryGenreName!.contains("Romance")}
        case .foreign:
            return movies.filter{$0.primaryGenreName!.contains("Foreign")}
        case .drama:
            return movies.filter{$0.primaryGenreName!.contains("Drama")}
        case .actionAdventure:
            return movies.filter{$0.primaryGenreName!.contains("Action & Adventure")}
        }
    }

    override init() {
        super.init()

        appEnvironment.objectWillChange.assign(to: &$appEnvironmentWillChange)

    }

}

// MARK: - Publics

extension MoviesViewModel {

    func fetchMovies(for searchTerm: String, completion: @escaping () -> Void){
        guard let url = URL(string: Constant.API.baseSearchURL + searchTerm + Constant.API.moviesEntity) else {
            return
        }
        if searchTerm.isEmpty{
            self.alert = .init(title: "Empty search term", dismissButton: .cancel(Text("OK")))
        }else{
            URLSession.shared.dataTask (with: url) { data, response, error in
                if let error = error {
                    print("URL error: \(error.localizedDescription)")
                    self.alert = .init(title: "Error",dismissButton: .cancel())
                } else if let data = data {
                    do {
                        let result = try JSONDecoder().decode(MoviesSearchResultModel.self, from: data)
                        DispatchQueue.main.async {
                            self.movies = result.results ?? [MoviesModel]()
                            completion()
                        }
                    } catch {
                        print("Error \(error.localizedDescription)")
                        self.alert = .init(title: "Error",dismissButton: .cancel())
                    }

                }
            }.resume()
        }
    }

    func openAppStoreURL(url: String?){
        UIApplication.shared.open(URL(string: url ?? "https://itunes.apple.com/tr/genre/films/id33")!)
    }

}
