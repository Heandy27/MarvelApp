//
//  LoadingView.swift
//  MarvelApp
//
//  Created by Andy Heredia on 11/12/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Image(.avengersEndgameMovie4KMarvelIphoneBdzi20J0Nvm1Zs4N)
                .resizable()
            Image("")
                .resizable()
                .background(Color.black).opacity(0.4)
            VStack {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .padding(.bottom, 8)
                Text("Loading...")
                    .foregroundStyle(.white)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LoadingView()
}
