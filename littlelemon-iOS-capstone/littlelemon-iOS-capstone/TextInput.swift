//
//  TextInput.swift
//  littlelemon-iOS-capstone
//
//

import SwiftUI

struct TextInput: View {
    var label: String
    @Binding var textVariable: String
    var icon: Image?  // Optional icon parameter
    
    var body: some View {
        HStack {
            if let icon = icon {
                icon
                    .padding(.leading, 10)  // Add some padding for spacing
            }
            
            TextField(label, text: $textVariable)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.leading, icon != nil ? 0 : 10)  // Add padding only if no icon
            
        }
        .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 1)
                .padding(.horizontal)
    }
}

