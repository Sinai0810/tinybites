//
//  TabView.swift
//  Tiny Bites
//
//  Created by Sinai on 8/19/25.
//
import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager

    var body: some View {
        TabView {
            // Cada tab tiene su propio NavigationStack en la raíz
            NavigationStack {
                CategoryView()
            }
            .tabItem {
                Image(systemName: "list.bullet")
                Text("Categories")
               
                
            }

            NavigationStack {
                FavoritesView()
            }
            .tabItem {
                Image(systemName: "heart.fill")
                Text("Favorites")
            }
        }
        .tint(Color(hex: "7A4E7E"))
        
    }
}

