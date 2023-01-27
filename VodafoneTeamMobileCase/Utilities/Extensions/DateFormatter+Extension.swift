//
//  DateFormatter+Extension.swift
//  VodofoneTeamCase
//
//  Created by enes huseyin berker on 26.01.2023.
//

import Foundation

extension DateFormatter {
    func formatDateString(_ dateString: String) -> String {
        self.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = self.date(from: dateString)!
        self.dateFormat = "MM/dd/yyyy h:mm a"
        return self.string(from: date)
    }
}
