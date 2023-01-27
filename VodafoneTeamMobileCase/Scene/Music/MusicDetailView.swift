//
//  MusicDetailView.swift
//  VodafoneTeamMobileCase
//
//  Created by enes huseyin berker on 26.01.2023.
//

import SwiftUI

struct MusicDetailsView: View {
    var musicModel: MusicModel
    var body: some View {
        ScrollView{
            VStack{
                AsyncImage(url: URL(string: musicModel.artworkUrl100 ?? Constant.API.constantPlaceholderURL)!)
                    .frame(width: 100)
                Text(musicModel.trackName ?? "Book Not found")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom)
                VStack(spacing: 4){
                    Text("Country")
                        .fontWeight(.medium)
                        .padding(.vertical)
                    Text(musicModel.country ?? "Country not found")
                }

                Text(musicModel.artistName ?? "Artist name not found")

                VStack(spacing: 4){
                    Text("Primary Genre Name")
                        .fontWeight(.medium)
                        .padding(.vertical)
                    Text(musicModel.primaryGenreName ?? "Primary Genre not found")
                }
                Text("Track Censored Name")
                    .fontWeight(.medium)
                    .padding(.vertical)
                Text(musicModel.trackCensoredName ?? "Track Censored Name not found")
            }
            .padding()
        }

    }
}
