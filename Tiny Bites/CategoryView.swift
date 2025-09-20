//
//  CategoryView.swift
//  Tiny Bites
//
//  Created by Sinai on 8/18/25.
//
import SwiftUI

struct CategoryView: View {
    
    let categories: [(name: String, imageName: String, color: Color)] = [
        ("Breakfast", "breakfast_img", Color(hex: "#E6D5EB")),
        ("Snack", "snack_img", Color(hex: "#FFF1A8")),
        ("Lunch", "lunch_img", Color(hex: "#A3D9A5")),
        ("Dinner", "dinner_img", Color(hex: "#FFB347"))
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Categories")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            
            ForEach(categories, id: \.name) { category in
                NavigationLink(destination: RecipeListByCategoryView(category: category.name)) {
                    HStack {
                        Text(category.name)
                            .font(.headline)
                            .foregroundColor(Color(hex: "#333333"))
                        
                        Spacer()
                        
                        Image(category.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                    }
                    .padding()
                    .background(category.color)
                    .cornerRadius(12)
                    .padding(.horizontal, 40)
                }
            }
            
            Spacer()
        }
        .navigationTitle("Categories") // Para mostrar título en la NavigationBar
    }
}

                       
      
