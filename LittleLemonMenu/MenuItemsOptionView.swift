//
//  MenuItemOptionView.swift
//  LittleLemonMenu
//
//  Created by Aneesh Oak on 27/02/25.
//

import SwiftUI

struct MenuItemOptionView: View {
    @ObservedObject var menu: LLMenu
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack (alignment: HorizontalAlignment.leading) {
            Text("Filter")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.primary)
                    .padding(.bottom, 4)
                
            Divider()
                .background(Color.gray.opacity(0.5))
            
            Text("Selected Categories")
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .foregroundColor(.secondary)
            
            ForEach(FoodFilter.allCases, id: \.self) { filter in
                HStack {
                    if menu.foodFilter == filter {
                        FilterViewSelected(filter: filter.rawValue)
                    } else {
                        FilterViewNormal(filter: filter.rawValue)
                    }
                }
                .onTapGesture {
                    menu.foodFilter = filter
                    dismiss()
                }
                                    
            }
            
            Text("Sort")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.primary)
                    .padding(.bottom, 4)
                
            Divider()
                .background(Color.gray.opacity(0.5))
            
            Text("Sort By: ")
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .foregroundColor(.secondary)
            
            ForEach(SortingOption.allCases, id: \.self) { option in
                HStack {
                    if menu.foodSort == option {
                        FilterViewSelected(filter: option.rawValue)
                    } else {
                        FilterViewNormal(filter: option.rawValue)
                    }
                }
                .onTapGesture {
                    menu.foodSort = option
                    menu.sortMenu()
                    dismiss()
                }
            }
            
            
            Spacer()
        }
        .padding()
    }
}

struct FilterViewNormal: View {
    var filter: String
    
    var body: some View {
        HStack {
            Text(filter)
                .font(.body)
                .foregroundColor(.black)
            
            Spacer()
            
            Circle()
                .stroke(Color.gray, lineWidth: 2)
                .frame(width: 20, height: 20)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

struct FilterViewSelected: View {
    var filter: String
    
    var body: some View {
        HStack {
            Text(filter)
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(.blue)
            
            Spacer()
            
            Circle()
                .fill(Color.blue)
                .frame(width: 20, height: 20)
                .overlay(
                    Image(systemName: "checkmark")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.white)
                )
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(10)
    }
}

#Preview {
    MenuItemOptionView(menu: LLMenu())
}
