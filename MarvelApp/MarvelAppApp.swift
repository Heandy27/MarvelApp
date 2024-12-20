//
//  MarvelAppApp.swift
//  MarvelApp
//
//  Created by Andy Heredia on 8/12/24.
//

import SwiftUI
import TipKit

@main
struct MarvelAppApp: App {
    
    var appState = AppStateVM()
    
    init() {
        //Configuro tipKit
        try? Tips.resetDatastore()
        try? Tips.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(AppStateVM())
        }
    }
}
