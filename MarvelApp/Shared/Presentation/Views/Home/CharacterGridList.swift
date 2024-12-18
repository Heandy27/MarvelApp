//
//  CharacterGridList.swift
//  MarvelApp
//
//  Created by Andy Heredia on 10/12/24.
//

import SwiftUI

struct CharacterGridList: View {

    @State private var viewModel: HomeViewModel
    
    @Environment(AppStateVM.self) var appState
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    let gridItem = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: gridItem, spacing: 30) {
                    ForEach(viewModel.filteredCharacters) {character in
                        NavigationLink {
                            CharacterDetailView(viewModel: CharacterDetailViewModel(characterData: character))
                        } label: {
                                HomeListViewCell(characterData: character)
                        }
                        
                        
                    }
                    
                    
                }
                
            }
            .searchable(text: $viewModel.searchText, prompt: "Search Character")
            .navigationTitle("Marvel Characters")
            .id(1)
                
            
        }
        
        
    }
}

#Preview {
    CharacterGridList(viewModel: HomeViewModel())
        .environment(AppStateVM())
}
