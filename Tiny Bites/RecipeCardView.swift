//
//  RecipeCardView.swift
//  Tiny Bites
//
//  Created by Sinai on 8/19/25.
//
import SwiftUI

struct RecipeCardView: View {
    let recipe: Recipe
    @EnvironmentObject var favoritesManager: FavoritesManager

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 120)
                    .clipped()
                    .cornerRadius(12)

                Button(action: {
                    favoritesManager.toggleFavorite(recipe: recipe)
                }) {
                    Image(systemName: favoritesManager.isFavorite(recipe: recipe) ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                        .padding(8)
                        .background(Color.white.opacity(0.7))
                        .clipShape(Circle())
                }
            }

            Text(recipe.title)
                .font(.headline)
                .foregroundColor(.primary)
                .lineLimit(2)

            Text(recipe.ageGroup)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(15)
        .shadow(radius: 3)
    }
}

#Preview {
    NavigationStack {
        RecipeListByCategoryView(category: "Breakfast")
            .environmentObject(FavoritesManager()) 
    }
}
