//
//  LoadingView.swift
//  MarvelApp
//
//  Created by Andy Heredia on 11/12/24.
//

import SwiftUI

struct SplashView: View {
    
    @Environment(AppStateVM.self) var appState
    
    var body: some View {
        ZStack {
            Image(.splashView)
                .resizable()
                .ignoresSafeArea()
        }
        .onAppear {
            appState.statusApp()
        }
    
    }
}

#Preview {
    SplashView()
        .environment(AppStateVM())
}
