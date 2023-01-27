//
//  BooksData.swift
//  VodofoneTeamCase
//
//  Created by enes huseyin berker on 26.01.2023.
//

import Foundation

final class BooksData: ObservableObject {

    // MARK: USE PUBLISHED WRAPPER TO LISTEN CHANGES

    let allFilteredData: [BooksFilterType] = [.none, .careers, .comics, .economics, .mathematics, .scienceAndTechnology]

}
