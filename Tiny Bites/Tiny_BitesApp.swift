//
//  Tiny_BitesApp.swift
//  Tiny Bites
//
//  Created by Sinai on 8/18/25.
//

import SwiftUI

@main
struct TinyBitesApp: App {
    @State  var isLoggedIn = false
    @StateObject  var favoritesManager = FavoritesManager()
    
    init() {
        let appearance = UITabBarAppearance()
        
        // Texto normal
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.gray
        ]
        
        // Texto seleccionado
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .font: UIFont.boldSystemFont(ofSize: 14),
            .foregroundColor: UIColor(red: 122/255, green: 78/255, blue: 126/255, alpha: 1)
        ]
        
        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
    
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                
                ContentView()
            }
            .environmentObject(favoritesManager)
                
            
        }
    }
}

