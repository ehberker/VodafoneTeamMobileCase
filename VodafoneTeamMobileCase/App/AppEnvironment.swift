//
//  AppEnvironment.swift
//  VodofoneTeamCase
//
//  Created by enes huseyin berker on 26.01.2023.
//

import Foundation
import SwiftUI

public class AppEnvironment: NSObject ,ObservableObject {

    @Published var tabItem: TabItem = .apps

}
