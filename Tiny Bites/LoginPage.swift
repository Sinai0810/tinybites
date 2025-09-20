//
//  LoginPage.swift
//  Tiny Bites
//
//  Created by Sinai on 8/18/25.
//
import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Sign in")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("Email", text: .constant(""))
                .padding()
                .background(Color.white)
                
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                )
                .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)

                .padding(.horizontal)
            
            SecureField("Password", text: .constant(""))
                .padding()
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                )
                .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)

                .padding(.horizontal)
            
            Button(action: {
                      print("Forgot password?")
                  }) {
                      Text("Forgot password?")
                          .font(.footnote)
                          .foregroundColor(.blue)
                          .padding(.horizontal)
                  }
                  .frame(maxWidth: .infinity, alignment: .leading)

            
            Button(action: {
                // Acción de login
            }) {
                Text("Log In")
                    .font(.headline)
                    .foregroundColor(Color(hex: "#333333"))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(hex: "#CBAACB"))
                    .cornerRadius(12)
                    .padding(.horizontal, 40)
            
            }
            
            Spacer()
        }
        .padding()
    }
}
#Preview {
    LoginView()
       
}


    



