//
//  FavoritesManager.swift
//  Tiny Bites
//
//  Created by Sinai on 8/19/25.
//

import SwiftUI

class FavoritesManager: ObservableObject {
    @Published var favoriteRecipes: [Recipe] = []
    
    func toggleFavorite(recipe: Recipe) {
        if let index = favoriteRecipes.firstIndex(where: { $0.id == recipe.id }) {
            favoriteRecipes.remove(at: index) // Quitar de favoritos
        } else {
            favoriteRecipes.append(recipe) // Agregar a favoritos
        }
    }
    
    func isFavorite(recipe: Recipe) -> Bool {
        favoriteRecipes.contains(where: { $0.id == recipe.id })
    }
    
    
     
}


    

