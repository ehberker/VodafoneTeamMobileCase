//
//  MusicViewModel.swift
//  VodofoneTeamCase
//
//  Created by enes huseyin berker on 26.01.2023.
//

import Foundation
import SwiftUI

final class MusicViewModel: NSObject ,ObservableObject {

    // MARK: USE PUBLISHED WRAPPER TO LISTEN CHANGES
    @Published var sheet: SheetContainer?
    @Published var fullScreenCover: SheetContainer?
    @Published var alert: AlertContainer?
    @Published var musics: [MusicModel] = [MusicModel]()
    @Published var searchTerm: String = ""
    @Published var filter: MusicFilterType = .none

    var filteredMusics: [MusicModel] {
        switch filter {
        case .none:
            return musics
        case .pop:
            return musics.filter{$0.primaryGenreName!.contains("Pop")}
        case .chill:
            return musics.filter{$0.primaryGenreName!.contains("Chill")}
        case .dance:
            return musics.filter{$0.primaryGenreName!.contains("Dance")}
        case .party:
            return musics.filter{$0.primaryGenreName!.contains("Party")}
        case .classical:
            return musics.filter{$0.primaryGenreName!.contains("Classical")}
        }
    }

    @Published private var appEnvironmentWillChange: Void = ()

    var appEnvironment: AppEnvironment = .init()

    override init() {
        super.init()

        appEnvironment.objectWillChange.assign(to: &$appEnvironmentWillChange)

    }

}

// MARK: - Publics


extension MusicViewModel {

    func fetchMusics(for searchTerm: String, completion: @escaping () -> Void){
        guard let url = URL(string: Constant.API.baseSearchURL + searchTerm + Constant.API.musicEntity) else {
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
                        let result = try JSONDecoder().decode(MusicSearchResultModel.self, from: data)
                        DispatchQueue.main.async {
                            self.musics = result.results ?? [MusicModel]()
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
        UIApplication.shared.open(URL(string: url ?? "https://itunes.apple.com")!)
    }

}
