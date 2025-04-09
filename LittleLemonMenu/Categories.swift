//
//  Categories.swift
//  LittleLemonMenu
//
//  Created by Aneesh Oak on 27/02/25.
//

enum MenuCategory {
     case food
    case drinks
    case desserts
}

enum FoodFilter: String, CaseIterable {
    case none = "All Items"
    case food = "Foods"
    case drinks = "Drinks"
    case desserts = "Desserts"
}


enum SortingOption: String, CaseIterable {
    case none = "None"
    case popular = "Most Popular"
    case price = "$-$$$"
    case alphabetical = "A-Z"
}
