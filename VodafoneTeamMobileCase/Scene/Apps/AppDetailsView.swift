//
//  AppDetailsView.swift
//  VodafoneTeamMobileCase
//
//  Created by enes huseyin berker on 26.01.2023.
//

import SwiftUI

struct AppDetailsView: View {
    var appModel: SoftwareModel
    var body: some View {
        ScrollView{
            VStack{
                AsyncImage(url: URL(string: appModel.artworkUrl100 ?? Constant.API.constantPlaceholderURL)!)
                    .frame(width: 100)
                Text(appModel.trackName ?? "App Not found")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom)
                VStack(spacing: 4){
                    Text("App Categories")
                        .fontWeight(.medium)
                        .padding(.vertical)
                    ForEach(appModel.genres!, id: \.self){
                        Text($0)
                    }
                }

                Text(appModel.artistName ?? "Artist name not found")
                VStack(spacing: 4){
                    Text("Supported Devices")
                        .fontWeight(.medium)
                        .padding(.vertical)
                    ForEach(appModel.supportedDevices!.prefix(5), id: \.self){
                        Text($0)
                    }
                }
                Text("MinimumOS Version")
                    .fontWeight(.medium)
                    .padding(.vertical)
                Text(appModel.minimumOsVersion ?? "MinimumOS Version not found")
            }
            .padding()
        }

    }
}
