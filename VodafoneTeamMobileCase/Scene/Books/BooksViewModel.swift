//
//  BooksViewModel.swift
//  VodofoneTeamCase
//
//  Created by enes huseyin berker on 26.01.2023.
//

import Foundation
import SwiftUI

final class BooksViewModel: NSObject ,ObservableObject {

    // MARK: USE PUBLISHED WRAPPER TO LISTEN CHANGES
    @Published var sheet: SheetContainer?
    @Published var fullScreenCover: SheetContainer?
    @Published var alert: AlertContainer?
    @Published var books: [BooksModel] = [BooksModel]()
    @Published var searchTerm: String = ""
    @Published var filter: BooksFilterType = .none

    var filteredBooks: [BooksModel] {
        switch filter {
        case .none:
            return books
        case .careers:
            return books.filter{$0.genres!.contains("Careers")}
        case .scienceAndTechnology:
            return books.filter{$0.genres!.contains("Science & Technology")}
        case .economics:
            return books.filter{$0.genres!.contains("Economics")}
        case .comics:
            return books.filter{$0.genres!.contains("Comics")}
        case .mathematics:
            return books.filter{$0.genres!.contains("Mathematics")}
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

extension BooksViewModel {

    func fetchBooks(for searchTerm: String, completion: @escaping () -> Void){
        guard let url = URL(string: Constant.API.baseSearchURL + searchTerm + Constant.API.ebookEntity) else {
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
                        let result = try JSONDecoder().decode(BooksSearchResultModel.self, from: data)
                        DispatchQueue.main.async {
                            self.books = result.results ?? [BooksModel]()
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
        UIApplication.shared.open(URL(string: url ?? "https://www.apple.com/tr/apple-books/")!)
    }

}
