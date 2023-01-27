//
//  Constants+API.swift
//  VodofoneTeamCase
//
//  Created by enes huseyin berker on 26.01.2023.
//

import Foundation

extension Constant {

    struct API {
        static let baseSearchURL: String = "https://itunes.apple.com/search?term="
        static let softwareEntity: String = "&entity=software"
        static let moviesEntity: String = "&entity=movie"
        static let musicEntity: String = "&entity=musicTrack"
        static let ebookEntity: String = "&entity=ebook"
        static let constantLimit: String = "&limit=7"
        static let constantPlaceholderURL: String = "https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png"
    }
}
