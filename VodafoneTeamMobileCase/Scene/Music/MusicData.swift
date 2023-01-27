//
//  MusicData.swift
//  VodofoneTeamCase
//
//  Created by enes huseyin berker on 26.01.2023.
//

import Foundation

final class MusicData: ObservableObject {

    // MARK: USE PUBLISHED WRAPPER TO LISTEN CHANGES

    let allFilteredData: [MusicFilterType] = [.none, .chill, .classical, .dance, .party, .pop]

}
