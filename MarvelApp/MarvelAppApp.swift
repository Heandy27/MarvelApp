//
//  MarvelAppApp.swift
//  MarvelApp
//
//  Created by Andy Heredia on 8/12/24.
//

import SwiftUI

@main
struct MarvelAppApp: App {
    
    var appState = AppStateVM()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(AppStateVM())
        }
    }
}
