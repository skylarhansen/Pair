//
//  EntityController.swift
//  Pair
//
//  Created by Skylar Hansen on 7/8/16.
//  Copyright © 2016 Skylar Hansen. All rights reserved.
//

import Foundation
import CoreData

class EntityController {
    
    static let sharedController = EntityController()
    
    let fetchedResultsController: NSFetchedResultsController
    
//    var entities: [Entity] {
//        let request = NSFetchRequest(entityName: "Entity")
//        let moc = Stack.sharedStack.managedObjectContext
//        return (try? moc.executeFetchRequest(request)) as? [Entity] ?? []
//    }
    
    init() {
        let request = NSFetchRequest(entityName: "Entity")
//        let sortDescriptor = NSSortDescriptor(key: "", ascending: false)
//        request.sortDescriptors = [sortDescriptor]
        self.fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: Stack.sharedStack.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("Unable to perform fetch")
        }
    }
    
    func addEntity(name: String) {
        _ = Entity(name: name)
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("Unable to save to persistent store")
        }
    }
}
