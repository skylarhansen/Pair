//
//  Entity.swift
//  Pair
//
//  Created by Skylar Hansen on 7/8/16.
//  Copyright © 2016 Skylar Hansen. All rights reserved.
//

import Foundation
import CoreData


class Entity: NSManagedObject {

    convenience init?(name: String, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        guard let entity = NSEntityDescription.entityForName("Entity", inManagedObjectContext: context) else { return nil }
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        self.name = name
    }

}
