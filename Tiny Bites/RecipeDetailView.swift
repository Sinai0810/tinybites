//
//  RecipeDetailView.swift
//  Tiny Bites
//
//  Created by Sinai on 8/18/25.
//
import SwiftUI

struct RecipeDetailView: View {
    
    let recipe: Recipe
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                ZStack(alignment: .topTrailing) {
                    Image(recipe.image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 250)
                        .clipped()
                        .cornerRadius(12)
                    
                    Button(action: {
                        favoritesManager.toggleFavorite(recipe: recipe)
                    }) {
                        Image(systemName: favoritesManager.isFavorite(recipe: recipe) ? "heart.fill" : "heart")
                            .foregroundColor(.red)
                            .padding()
                            .background(Color.white.opacity(0.7))
                            .clipShape(Circle())
                            .padding(10)
                    }
                }
                
                Text(recipe.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                HStack {
                    Text("Age: \(recipe.ageGroup)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text(recipe.type)
                        .font(.subheadline)
                        .padding(6)
                        .background(Color.green.opacity(0.2))
                        .cornerRadius(8)
                }
                
                Text("Time: \(recipe.time)")
                    .font(.subheadline)
                
                Text(recipe.description)
                    .font(.body)
                
                Divider()
                
                Text("Ingredients")
                    .font(.headline)
                ForEach(recipe.ingredients, id: \.self) { ing in
                    Text("• \(ing)")
                        .font(.body)
                        .padding(.horizontal, 20)
                }
                
                Divider()
                
                Text("Directions")
                    .font(.headline)
                ForEach(recipe.steps.indices, id: \.self) { i in
                    Text("\(i+1). \(recipe.steps[i])")
                        .font(.body)
                        .padding(.horizontal, 20)
                }
                
                Divider()

                Text("Nutritional Information")
                    .font(.headline)

                ForEach(recipe.nutrition.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                    Text("• \(key): \(value)")
                        .font(.body)
                        .padding(.horizontal, 20)
                }


                
                
            }
            .padding()
        }
        .navigationTitle("Recipes Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        RecipeListByCategoryView(category: "Breakfast")
            .environmentObject(FavoritesManager())
    }
}
