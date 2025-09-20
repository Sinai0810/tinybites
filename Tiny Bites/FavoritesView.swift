//
//  FavoritesView.swift
//  Tiny Bites
//
//  Created by Sinai on 8/19/25.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            if favoritesManager.favoriteRecipes.isEmpty {
                Text("No favorites recipes")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(favoritesManager.favoriteRecipes) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                            RecipeCardView(recipe: recipe)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Favorites")
        
    }
}
