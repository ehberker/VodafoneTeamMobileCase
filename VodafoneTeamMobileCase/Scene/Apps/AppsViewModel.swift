//
//  AppsViewModel.swift
//  VodofoneTeamCase
//
//  Created by enes huseyin berker on 26.01.2023.
//

import Foundation
import Combine
import SwiftUI

final class AppsViewModel: NSObject ,ObservableObject {

    // MARK: USE PUBLISHED WRAPPER TO LISTEN CHANGES
    @Published var sheet: SheetContainer?
    @Published var fullScreenCover: SheetContainer?
    @Published var alert: AlertContainer?
    @Published var apps: [SoftwareModel] = [SoftwareModel]()
    @Published var filter: AppFilterType = .none

    var filteredApps: [SoftwareModel] {
        switch filter {
        case .none:
            return apps
        case .books:
            return apps.filter{$0.genres!.contains("Social Networking")}
        case .music:
            return apps.filter { $0.genres!.contains("Music") }
        case .medical:
            return apps.filter { $0.genres!.contains("Medical") }
        case .socialNetworking:
            return apps.filter { $0.genres!.contains("Social Networking") }
        case .business:
            return apps.filter {  $0.genres!.contains("Business") }
        }
    }

    @Published var searchTerm: String = ""
    @Published private var appEnvironmentWillChange: Void = ()

    var appEnvironment: AppEnvironment = .init()
    var subscriptions = Set<AnyCancellable>()
    override init() {
        super.init()
        appEnvironment.objectWillChange.assign(to: &$appEnvironmentWillChange)
    }


}


// MARK: - Publics

extension AppsViewModel {

    func fetchApps(for searchTerm: String, completion: @escaping () -> Void){
        guard let url = URL(string: Constant.API.baseSearchURL + searchTerm + Constant.API.softwareEntity) else {
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
                        let result = try JSONDecoder().decode(SoftwareSearchResultModel.self, from: data)
                        DispatchQueue.main.async {
                            self.apps = result.results ?? [SoftwareModel]()
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
        UIApplication.shared.open(URL(string: url ?? "https://www.apple.com/app-store/")!)
    }
    
    
}
