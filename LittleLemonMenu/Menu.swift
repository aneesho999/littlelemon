//
//  Menu.swift
//  LittleLemonMenu
//
//  Created by Aneesh Oak on 27/02/25.
//

import SwiftUI

class LLMenu: ObservableObject {
    var foodMenu: [Food] = []
    var dessertMenu: [Dessert] = []
    var drinkMenu: [Drink] = []
    
    var foodUnsortedMenu: [Food] = []
    var dessertUnsortedMenu: [Dessert] = []
    var drinkUnsortedMenu: [Drink] = []
    
    @Published var foodFilter: FoodFilter = FoodFilter.none
    @Published var foodSort: SortingOption = .none
    
    init() {
        foodMenu.append(Food(name: "Burger", price: 5.99, image: "Burger", ordered: 120,
                             ingredient: ["Bun", "Patty", "Lettuce", "Cheese", "Sauce"]))
        foodMenu.append(Food(name: "Pizza", price: 8.99, image: "Pizza", ordered: 150,
                             ingredient: ["Dough", "Tomato Sauce", "Cheese", "Olives"]))
        foodMenu.append(Food(name: "Toast", price: 3.49, image: "Sandwich", ordered: 80,
                             ingredient: ["Bread", "Butter", "Jam"]))
        foodMenu.append(Food(name: "Sandwich", price: 4.99, image: "Toast", ordered: 95,
                             ingredient: ["Bread", "Cheese", "Lettuce", "Tomato"]))
        foodMenu.append(Food(name: "Pasta", price: 7.49, image: "Pasta", ordered: 110,
                             ingredient: ["Pasta", "Tomato Sauce", "Cheese", "Basil"]))
        foodMenu.append(Food(name: "Fries", price: 2.99, image: "French Fries", ordered: 200,
                             ingredient: ["Potatoes", "Salt", "Oil"]))
        foodMenu.append(Food(name: "Salad", price: 6.49, image: "Salad", ordered: 90,
                             ingredient: ["Lettuce", "Tomato", "Cucumber", "Olives", "Dressing"]))
        foodMenu.append(Food(name: "Taco", price: 3.99, image: "Taco", ordered: 85,
                             ingredient: ["Tortilla", "Beans", "Lettuce", "Cheese"]))
        foodMenu.append(Food(name: "Wrap", price: 4.99, image: "Wrap", ordered: 100,
                             ingredient: ["Tortilla", "Lettuce", "Cheese", "Chicken"]))
        foodMenu.append(Food(name: "Hot Dog", price: 4.29, image: "Hot Dog", ordered: 105,
                             ingredient: ["Bun", "Sausage", "Mustard", "Ketchup"]))
        foodMenu.append(Food(name: "Veggie Pasta", price: 7.99, image: "veggiePasta", ordered: 95,
                             ingredient: ["Pasta", "Tomato Sauce", "Spinach", "Broccoli", "Carrot", "Cheese"]))
        foodMenu.append(Food(name: "Healthy Wrap", price: 5.49, image: "Wrap", ordered: 80,
                             ingredient: ["Tortilla", "Spinach", "Broccoli", "Carrot", "Cheese", "Tomato Sauce"]))

        dessertMenu.append(Dessert(name: "Cake", price: 4.99, image: "Cake2", ordered: 130,
                                   ingredient: ["Flour", "Sugar", "Eggs", "Butter"]))
        dessertMenu.append(Dessert(name: "Ice Cream", price: 3.99, image: "Icecream", ordered: 160,
                                   ingredient: ["Milk", "Sugar", "Vanilla"]))
        dessertMenu.append(Dessert(name: "Strawberry Ice Cream", price: 4.49, image: "Icecream2", ordered: 140,
                                   ingredient: ["Milk", "Cocoa", "Sugar"]))
        dessertMenu.append(Dessert(name: "Brownie", price: 5.49, image: "Cake", ordered: 115,
                                   ingredient: ["Chocolate", "Butter", "Flour", "Sugar"]))

        drinkMenu.append(Drink(name: "Lime Soda", price: 2.99, image: "Limesoda", ordered: 110,
                               ingredient: ["Lime", "Soda", "Sugar"]))
        drinkMenu.append(Drink(name: "Milkshake", price: 3.99, image: "Milkshake", ordered: 135,
                               ingredient: ["Milk", "Ice Cream", "Sugar"]))
        drinkMenu.append(Drink(name: "Cold Coffee", price: 4.49, image: "CC", ordered: 125,
                               ingredient: ["Coffee", "Milk", "Sugar", "Ice"]))
        drinkMenu.append(Drink(name: "Smoothie", price: 5.29, image: "Smoothie", ordered: 95,
                               ingredient: ["Fruits", "Yogurt", "Honey"]))
        drinkMenu.append(Drink(name: "Tea", price: 2.49, image: "tea", ordered: 145,
                               ingredient: ["Tea Leaves", "Water", "Milk", "Sugar"]))
        drinkMenu.append(Drink(name: "Lemonade", price: 3.29, image: "Limesoda", ordered: 140,
                               ingredient: ["Lemon", "Water", "Sugar"]))
        drinkMenu.append(Drink(name: "Soft Drink", price: 1.99, image: "SD", ordered: 170,
                               ingredient: ["Carbonated Water", "Sugar", "Flavoring"]))
        drinkMenu.append(Drink(name: "Mocktail", price: 4.99, image: "Mocktail", ordered: 120,
                               ingredient: ["Fruit Juice", "Soda", "Mint"]))

        foodFilter = .none

        foodUnsortedMenu = foodMenu
        dessertUnsortedMenu = dessertMenu
        drinkUnsortedMenu = drinkMenu
    }
    
    func sortMenu() {
        switch self.foodSort {
        case .none:
            // Restore the original unsorted menu
            foodMenu = foodUnsortedMenu
            dessertMenu = dessertUnsortedMenu
            drinkMenu = drinkUnsortedMenu

        case .popular:
            // Sort by highest "ordered" count
            foodMenu.sort { $0.ordered > $1.ordered }
            dessertMenu.sort { $0.ordered > $1.ordered }
            drinkMenu.sort { $0.ordered > $1.ordered }

        case .price:
            // Sort by price from lowest to highest
            foodMenu.sort { $0.price < $1.price }
            dessertMenu.sort { $0.price < $1.price }
            drinkMenu.sort { $0.price < $1.price }

        case .alphabetical:
            // Sort by name alphabetically (A-Z)
            foodMenu.sort { $0.name < $1.name }
            dessertMenu.sort { $0.name < $1.name }
            drinkMenu.sort { $0.name < $1.name }
        }
    }
}
