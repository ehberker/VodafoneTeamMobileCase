//
//  Apps+UI.swift
//  VodofoneTeamCase
//
//  Created by enes huseyin berker on 26.01.2023.
//

import SwiftUI

import SwiftUI

extension AppsScene {
    var bodyView: some View {
        NavigationView {
            VStack{
                HStack{
                    Picker(AppFilterType.none.rawValue, selection: $viewModel.filter) {
                        ForEach(data.allFilteredData, id: \.self) { filters in
                            Text(filters.rawValue)
                        }

                    }
                    .pickerStyle(MenuPickerStyle())
                    Spacer()
                        textFieldView
                        Button {
                            viewModel.fetchApps(for: viewModel.searchTerm) {}
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
                    ForEach(viewModel.filteredApps){ apps in
                        HStack(spacing:12){
                            AsyncImage(url: URL(string:apps.artworkUrl100 ?? Constant.API.constantPlaceholderURL))
                                .scaledToFit()
                                .frame(width: 100)
                                .cornerRadius(5)
                            VStack(alignment:.leading, spacing: 2){
                                Text(apps.trackName ?? "App name not found")
                                    .fontWeight(.semibold)
                                Text(DateFormatter().formatDateString(apps.releaseDate ?? "2016-05-26T21:15:49Z"))
                            }
                            .lineLimit(1)
                            Spacer()
                            Button {
                                viewModel.openAppStoreURL(url: apps.trackViewUrl)
                            } label: {
                                Image(systemName: "square.and.arrow.up")
                            }

                        }
                        .onTapGesture {
                            viewModel.sheet = .init(view: AnyView(AppDetailsView(appModel: apps)))
                        }
                        .padding(.vertical)

                    }
                }

            }
            .padding()
            .navigationTitle("iTunes Apps")
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

struct AppsSceneUI_Previews: PreviewProvider {
    static var previews: some View {
        AppsScene()
    }
}
