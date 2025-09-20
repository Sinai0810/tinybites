//
//  RecipeListByCategory.swift
//  Tiny Bites
//
//  Created by Sinai on 8/19/25.
//
import SwiftUI

struct RecipeListByCategoryView: View {
    let category: String
    
    // MARK: - Estados para filtros
    @State private var showFilterSheet = false
    @State private var selectedAge: String = "All age"
    @State private var selectedAllergens: Set<String> = []
    
    let ageGroups = ["All age", "6+ months", "8+ months", "12+ months"]
    let allergens = ["Gluten", "Dairy" , "Eggs" , "Fish" ,"Nuts"]
    
    // MARK: - Recetas filtradas
    var filteredRecipes: [Recipe] {
        sampleRecipes.filter { recipe in
            let ageMatch = selectedAge == "All age" || recipe.ageGroup == selectedAge
            let allergenMatch = selectedAllergens.isEmpty || selectedAllergens.allSatisfy { !recipe.allergens.contains($0) }
            return ageMatch && allergenMatch && recipe.type.lowercased() == category.lowercased()
        }
    }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(filteredRecipes) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                        RecipeCardView(recipe: recipe)
                    }
                }
            }
            .padding()
        }
        .navigationTitle(category)
        // MARK: - Botón de filtro
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    showFilterSheet.toggle()
                }) {
                    Image(systemName: "line.horizontal.3.decrease.circle")
                        .imageScale(.large)
                }
            }
        }
        // MARK: - Sheet de filtros
        .sheet(isPresented: $showFilterSheet) {
            FilterView(
                selectedAge: $selectedAge,
                selectedAllergens: $selectedAllergens
            )
        }
    }
}

#Preview {
    NavigationStack {
        RecipeListByCategoryView(category: "Breakfast")
            .environmentObject(FavoritesManager()) // Importante si usas favoritos
    }
}
