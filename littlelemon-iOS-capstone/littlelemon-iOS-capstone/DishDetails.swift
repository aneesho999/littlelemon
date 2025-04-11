//
//  DishDetails.swift
//  littlelemon-iOS-capstone
//

import SwiftUI

struct DishDetails: View {
    let dish: Dish
    
    init(dish: Dish) {
            self.dish = dish
        }
    
    var body: some View {
        VStack(spacing: 20) {
            // Header Row with the logo and arrow
            HStack(spacing: 15) {
                Image("Little Lemon logo") // Replace with your actual logo
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 120)
                
                Image(systemName: "arrowshape.right.fill")
                    .foregroundColor(.gray)
                    .font(.title)
                
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
            
            // Dish Details Section
            VStack(spacing: 8) {
                Text("Little Lemon Presents:")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Text(dish.title ?? "Unknown Dish") // Dish name
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
                
                Text("Just at **$\(dish.price ?? "0.00")**") // Price
                    .font(.title3)
                    .foregroundColor(primaryGreen)
                
                Spacer()
                    .frame(height: 50)
                
                Text("\(dish.dishDescription ?? "")")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
    }
}

