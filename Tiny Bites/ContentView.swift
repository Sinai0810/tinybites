//
//  ContentView.swift
//  Tiny Bites
//
//  Created by Sinai on 8/18/25.
//


import SwiftUI

// MARK: - Extensión para usar colores HEX
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255,
                            (int >> 8) * 17,
                            (int >> 4 & 0xF) * 17,
                            (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255,
                            int >> 16,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24,
                            int >> 16 & 0xFF,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(.sRGB,
                  red: Double(r) / 255,
                  green: Double(g) / 255,
                  blue: Double(b) / 255,
                  opacity: Double(a) / 255)
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Imagen principal
                Image("img-principal")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 400)
                    .cornerRadius(30)
                
                // Título de la app
                Text("Tiny Bites")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                // Botón de Iniciar Sesión
                NavigationLink(destination: LoginView()) {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(Color(hex: "#333333"))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "#CBAACB"))
                        .cornerRadius(12)
                        .padding(.horizontal, 40)
                }
                
                // Botón de Ver como invitado
                NavigationLink(destination: MainTabView()) {
                    Text("View recipes as a guest")
                        .font(.headline)
                        .foregroundColor(Color(hex: "#333333"))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "#FFB347"))
                        .cornerRadius(12)
                        .padding(.horizontal, 40)
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                }
                HStack(spacing: 4) {
                    Text("Don't have an account?")
                        .font(.footnote)
                        .foregroundColor(.primary)

                    Button(action: {
                        print("Sign up pressed")
                    }) {
                        Text("Sign up")
                            .font(.footnote)
                            .foregroundColor(.blue)
                    }
                }
                .padding(.horizontal, 40)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
} 

#Preview {
    ContentView()
        .environmentObject(FavoritesManager()) 
}
