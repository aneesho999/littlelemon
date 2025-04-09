//
//  DetailedMenuItemView.swift
//  LittleLemonMenu
//
//  Created by Aneesh Oak on 27/02/25.
//

import SwiftUI

struct DetailedMenuItemView: View {
    var menuItem: MenuItem
    
    init(menuItem: MenuItem) {
        self.menuItem = menuItem
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 15) {
                Image("Little Lemon logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 120)

                Image(systemName: "arrowshape.right.fill")
                    .foregroundColor(.gray)
                    .font(.title)

                Image(menuItem.image)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            }

            VStack(spacing: 8) {
                Text("Little Lemon Presents:")
                    .font(.headline)
                    .foregroundColor(.gray)

                Text(menuItem.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)

                Text("Just at **$\(menuItem.price, specifier: "%.2f")**")
                    .font(.title3)
                    .foregroundColor(.green)
            }
            
            HStack(spacing: 8) {
                Text("Ordered by **\(menuItem.ordered)** people")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                    .font(.title2)
            }

            VStack(alignment: .leading, spacing: 5) {
                Text("Ingredients:")
                    .font(.headline)
                    .foregroundColor(.black)

                // Display ingredients in a vertical list
                VStack(alignment: .leading, spacing: 5) {
                    ForEach(menuItem.ingredient, id: \.self) { ingredient in
                        HStack {
                            Image(systemName: "leaf.circle.fill")
                                .foregroundColor(.green)
                            
                            Text(ingredient)
                                .font(.subheadline)
                                .foregroundColor(.black)
                                .padding(.vertical, 3)
                            
                            Spacer()
                        }
                        .padding(5)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                    }
                }
            }
            .padding(.top, 10)

            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .padding()
        
    }
}

#Preview {
    DetailedMenuItemView(menuItem: Food(name: "Burger", price: 4.99, image: "Milkshake", ordered: 450, ingredient: ["Bun", "Patty", "Lettuce", "Cheese", "Sauce"]))
}
