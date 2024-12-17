//
//  HomeListViewCell.swift
//  MarvelApp
//
//  Created by Andy Heredia on 8/12/24.
//

import SwiftUI

struct HomeListViewCell: View {
    
    var characterData: Results
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "\(characterData.thumbnail.path).\(characterData.thumbnail.fileExtension)")) { image in
                image.resizable()
                    .frame(width: 150, height: 150)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                   
            } placeholder: {
                ProgressView()
                    .frame(width: 150, height: 100)
            }
            
            
                Text(characterData.name)
                .padding(.vertical, 5)
                .foregroundStyle(.black)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 6)
    }
}

#Preview {
    HomeListViewCell(characterData: Results(id: 1, name: "Andy", description: "Del Ecuador", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", fileExtension: "jpg")))
        
}
