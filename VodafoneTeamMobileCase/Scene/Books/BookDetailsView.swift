//
//  BookDetailsView.swift
//  VodafoneTeamMobileCase
//
//  Created by enes huseyin berker on 26.01.2023.
//

import SwiftUI

struct BookDetailsView: View {
    var bookModel: BooksModel
    var body: some View {
        ScrollView{
            VStack{
                AsyncImage(url: URL(string: bookModel.artworkUrl100 ?? Constant.API.constantPlaceholderURL)!)
                    .frame(width: 100)
                Text(bookModel.trackName ?? "Book Not found")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom)
                VStack(spacing: 4){
                    Text("Book Categories")
                        .fontWeight(.medium)
                        .padding(.vertical)
                    ForEach(bookModel.genres!, id: \.self){
                        Text($0)
                    }
                }

                Text(bookModel.artistName ?? "Artist name not found")
                VStack(spacing: 4){
                    Text("Genre IDs")
                        .fontWeight(.medium)
                        .padding(.vertical)
                    ForEach(bookModel.genreIds!.prefix(5), id: \.self){
                        Text($0)
                    }
                }
                Text("Track Censored Name")
                    .fontWeight(.medium)
                    .padding(.vertical)
                Text(bookModel.trackCensoredName ?? "Track Censored Name not found")
            }
        }

    }
}
