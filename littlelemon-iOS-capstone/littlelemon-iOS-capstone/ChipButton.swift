//
//  ChipButton.swift
//  littlelemon-iOS-capstone
//

import SwiftUI

struct ChipButton: View {
    var label: String
    @Binding var isSelected: Bool
    
    var body: some View {
        Button(action: {
            isSelected.toggle()
        }) {
            Text(label)
                .font(.body)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(isSelected ? primaryGreen : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(5)
        }
        .buttonStyle(PlainButtonStyle()) 
    }
}

