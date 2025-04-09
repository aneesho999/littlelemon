//
//  Food.swift
//  LittleLemonMenu
//
//  Created by Aneesh Oak on 27/02/25.
//

class MenuItem {
    init(name: String, price: Double, image: String, _ foodCategory: MenuCategory, ordered: Int = 0, ingredient: [String]) {
        self.name = name
        self.price = price
        self.image = image
        self.foodCategory = foodCategory
        self.ordered = ordered
        self.ingredient = ingredient
    }
    
    var name: String
    var price: Double
    var image: String
    var ordered: Int = 0
    var foodCategory: MenuCategory
    var ingredient: [String] = []
}

class Food: MenuItem {
    init(name: String, price: Double, image: String, ordered: Int = 0, ingredient: [String]) {
        super.init(name: name, price: price, image: image, MenuCategory.food, ordered: ordered, ingredient: ingredient)
    }
}

class Dessert: MenuItem {
    init(name: String, price: Double, image: String, ordered: Int = 0,  ingredient: [String]) {
        super.init(name: name, price: price, image: image, MenuCategory.desserts, ordered: ordered,  ingredient: ingredient)
    }
}

class Drink: MenuItem {
    init(name: String, price: Double, image: String, ordered: Int = 0, ingredient: [String]) {
        super.init(name: name, price: price, image: image, MenuCategory.drinks, ordered: ordered, ingredient: ingredient)
    }
}
