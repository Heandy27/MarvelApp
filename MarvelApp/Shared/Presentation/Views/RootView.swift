//
//  RootView.swift
//  MarvelApp
//
//  Created by Andy Heredia on 11/12/24.
//

import SwiftUI

struct RootView: View {
    
    @Environment(AppStateVM.self) var appState
    
    var body: some View {
        switch(appState.status) {
        case .none:
            SplashView()
        case .error:
            ErrorView()
        case .loading:
            LoadingView()
        case .loaded:
            CharacterGridList(viewModel: HomeViewModel())
        }
           
        
    }
    
}

#Preview {
    RootView()
        .environment(AppStateVM())
}
