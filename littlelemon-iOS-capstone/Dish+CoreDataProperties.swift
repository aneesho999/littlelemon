//
//  Dish+CoreDataProperties.swift
//  littlelemon-iOS-capstone
//
//

import Foundation
import CoreData


extension Dish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dish> {
        return NSFetchRequest<Dish>(entityName: "Dish")
    }

    @NSManaged public var title: String?
    @NSManaged public var price: String?
    @NSManaged public var image: String?
    @NSManaged public var dishDescription: String?
    @NSManaged public var category: String?

}

extension Dish : Identifiable {

}
