//
//  MoviesDetailView.swift
//  VodafoneTeamMobileCase
//
//  Created by enes huseyin berker on 26.01.2023.
//

import SwiftUI

struct MoviesDetailsView: View {
    var moviesModel: MoviesModel
    var body: some View {
        ScrollView{
            VStack{
                AsyncImage(url: URL(string: moviesModel.artworkUrl100 ?? Constant.API.constantPlaceholderURL)!)
                    .frame(width: 100)
                Text(moviesModel.trackName ?? "Book Not found")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom)
                VStack(spacing: 4){
                    Text("Country")
                        .fontWeight(.medium)
                        .padding(.vertical)
                    Text(moviesModel.country ?? "Country not found")
                }

                Text(moviesModel.artistName ?? "Artist name not found")

                VStack(spacing: 4){
                    Text("Primary Genre Name")
                        .fontWeight(.medium)
                        .padding(.vertical)
                    Text(moviesModel.primaryGenreName ?? "Primary Genre not found")
                }
                Text("Track Censored Name")
                    .fontWeight(.medium)
                    .padding(.vertical)
                Text(moviesModel.trackCensoredName ?? "Track Censored Name not found")
            }
            .padding()
        }

    }
}
