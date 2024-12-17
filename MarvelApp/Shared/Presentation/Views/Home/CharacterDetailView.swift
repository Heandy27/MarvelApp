//
//  CharacterDetailView.swift
//  MarvelApp
//
//  Created by Andy Heredia on 10/12/24.
//

import SwiftUI

struct CharacterDetailView: View {
    
    //@State var characterData: Results
    @State var viewModel: CharacterDetailViewModel
    
    
    let gridItem = [
        GridItem(.flexible())
    ]
    
    
    init(viewModel: CharacterDetailViewModel) {
        self.viewModel = viewModel
    }
    
    
    
    
    var body: some View {
        
        ScrollView(.vertical) {
          
          
                VStack {
                    LazyVGrid(columns: gridItem, spacing: 20) {
                        ForEach(viewModel.seriesData) { seriesData in
                            
                            SingleSeriesView(singleSeriesData: seriesData)
                            
                        }
                    }
                        
                    
                }
                
            
        }
       .navigationTitle("Series")
        
        
       
        //.background(Color.gray)
        
        
    }
}


#Preview {
    CharacterDetailView(viewModel: CharacterDetailViewModel(characterData: Results(id: 1, name: "Andy", description: "Del Ecuador", thumbnail: Thumbnail(path: "", fileExtension: ""))))
}
