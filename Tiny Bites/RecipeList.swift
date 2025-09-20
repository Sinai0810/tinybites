//
//  RecipeList.swift
//  Tiny Bites
//
//  Created by Sinai on 8/18/25.
//

import SwiftUI

struct GuestHomeView: View {
   
    let recipes = sampleRecipes
    
    var body: some View {
        NavigationStack {
            List(recipes) { recipe in
                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                    VStack(alignment: .leading) {
                        Text(recipe.title)
                            .font(.headline)
                        Text("\(recipe.type) • \(recipe.ageGroup)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Babys recipes")
        }
    }
}

#Preview {
    GuestHomeView()
}


