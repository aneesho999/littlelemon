//
//  FoodList.swift
//  littlelemon-iOS-capstone
//

import SwiftUI

struct FoodList: View {
    let dish: Dish
    
    init(dish: Dish) {
            self.dish = dish
        }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(dish.title ?? "") - $\(dish.price ?? "")")
                    .font(.headline)
                
                Text("\(dish.dishDescription ?? "")")
            }
            
            Spacer()
            
            if let imageName = dish.image {
                if imageName.starts(with: "http") {
                    // Remote image
                    AsyncImage(url: URL(string: imageName)) { image in
                        image.resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipped()
                            .cornerRadius(8)
                    } placeholder: {
                        ProgressView()
                    }
                } else {
                    // Local image
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipped()
                        .cornerRadius(8)
                }
            } else {
                ProgressView()
            }
        }
    }
}
