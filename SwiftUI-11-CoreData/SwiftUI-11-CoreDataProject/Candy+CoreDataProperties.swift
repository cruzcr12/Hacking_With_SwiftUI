//
//  Candy+CoreDataProperties.swift
//  SwiftUI-11-CoreDataProject
//
//  Created by Esteban Cruz on 23/8/24.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

    public var wrappedName: String {
        name ?? "Unknown Candy"
    }
    
}

extension Candy : Identifiable {

}
