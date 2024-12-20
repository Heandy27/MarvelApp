//
//  WelcomeTip.swift
//  MarvelApp
//
//  Created by Andy Heredia on 20/12/24.
//

import SwiftUI
import TipKit

struct WelcomeTip: Tip {
    
    var title: Text {
        Text("Welcome to the start")
    }
    
    var message: Text? {
        Text("Browse and enjoy!")
    }
    
    var image: Image? {
        Image(systemName: "house.fill")
    }
    
}
