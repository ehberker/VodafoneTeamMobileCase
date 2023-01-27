//
//  MoviesData.swift
//  VodofoneTeamCase
//
//  Created by enes huseyin berker on 26.01.2023.
//

import Foundation

final class MoviesData: ObservableObject {

    // MARK: USE PUBLISHED WRAPPER TO LISTEN CHANGES
    let allFilteredData: [MoviesFilterType] = [.none, .actionAdventure, .anime, .drama, .foreign, .romance]
}
