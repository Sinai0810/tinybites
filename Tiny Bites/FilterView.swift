//
//  FilterView.swift
//  Tiny Bites
//
//  Created by Sinai on 8/21/25.
//
import SwiftUI

struct FilterView: View {
    @Binding var selectedAge: String
    @Binding var selectedAllergens: Set<String>
    
    @Environment(\.dismiss) var dismiss // Para cerrar el sheet
    
    let ageGroups = ["All age", "6+ months", "8+ months", "12+ months"]
    let allergens = ["Gluten", "Dairy" , "Eggs" , "Fish" ,"Nuts"]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Filtro por edad
                Picker("Choose an age", selection: $selectedAge) {
                    ForEach(ageGroups, id: \.self) { age in
                        Text(age)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                // Filtro por alérgeno (múltiples)
                VStack(alignment: .leading) {
                    Text("Allergens")
                        .font(.headline)
                    ForEach(allergens, id: \.self) { allergen in
                        HStack {
                            Text(allergen)
                            Spacer()
                            Button(action: {
                                if selectedAllergens.contains(allergen) {
                                    selectedAllergens.remove(allergen)
                                } else {
                                    selectedAllergens.insert(allergen)
                                }
                            }) {
                                Image(systemName: selectedAllergens.contains(allergen) ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(.green)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("Filtros")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss() 
                    }
                }
            }
        }
    }
}
