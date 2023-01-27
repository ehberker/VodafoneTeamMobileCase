//
//  Books+UI.swift
//  VodofoneTeamCase
//
//  Created by enes huseyin berker on 26.01.2023.
//

import SwiftUI

extension BooksScene {
    var bodyView: some View {
        NavigationView {
            VStack{
                HStack{
                    Picker(BooksFilterType.none.rawValue, selection: $viewModel.filter) {
                        ForEach(data.allFilteredData, id: \.self) { filters in
                            Text(filters.rawValue)
                        }

                    }
                    .pickerStyle(MenuPickerStyle())
                    Spacer()
                        textFieldView
                        Button {
                            viewModel.fetchBooks(for: viewModel.searchTerm) {}
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .fontWeight(.medium)
                                .foregroundColor(Color.white)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 5))


                    }

                }
                .padding(.bottom)

                ScrollView(.vertical,showsIndicators: false){
                    ForEach(viewModel.filteredBooks){ books in
                        HStack(spacing:12){
                            AsyncImage(url: URL(string:books.artworkUrl100 ?? Constant.API.constantPlaceholderURL))
                                .scaledToFit()
                                .frame(width: 100)
                                .cornerRadius(5)
                            VStack(alignment:.leading, spacing: 2){
                                Text(books.trackName ?? "App name not found")
                                    .fontWeight(.semibold)
                                Text(DateFormatter().formatDateString(books.releaseDate ?? "2016-05-26T21:15:49Z"))
                            }
                            .lineLimit(1)
                            Spacer()
                            Button {
                                viewModel.openAppStoreURL(url: books.trackViewUrl)
                            } label: {
                                Image(systemName: "square.and.arrow.up")
                            }

                        }
                        .onTapGesture {
                            viewModel.sheet = .init(view: AnyView(BookDetailsView(bookModel: books)))
                        }
                        .padding(.vertical)

                    }
                }

            }
            .padding()
            .navigationTitle("iTunes Books")
        }
    }
    var textFieldView: some View {
        TextField("Search", text: $viewModel.searchTerm)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
            .padding()
            .background(RoundedRectangle(cornerRadius: 5)
            .stroke(Color.gray.opacity(0.2), lineWidth: 1))
    }
}

// MARK: - PreviewProvider

struct BooksSceneUI_Previews: PreviewProvider {
    static var previews: some View {
        BooksScene()
    }
}
