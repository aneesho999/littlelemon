//
//  FoodView.swift
//  LittleLemonMenu
//
//  Created by Aneesh Oak on 27/02/25.
//

import SwiftUI

struct MenuItemView: View {
    let item: MenuItem
    
    var body: some View {
        
            VStack {
                NavigationLink (destination: DetailedMenuItemView(menuItem: item)){
                    Image(item.image)
                        .resizable()
                        .frame(width: 110, height: 110)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                }

                Text(item.name)
                    .font(.caption)
                    .foregroundColor(.black)
                
                
            }
            .padding(5)
    
    }
}

#Preview {
    MenuItemView(item: Food(name: "Pizza", price: 8.99, image: "Pizza", ordered: 150,
                      ingredient: ["Dough", "Tomato Sauce", "Cheese", "Olives"]))
}
