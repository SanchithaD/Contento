//
//  ToDo.swift
//  Contento
//
//  Created by Sanchitha Dinesh on 4/26/20.
//  Copyright © 2020 hackathon. All rights reserved.
//

import Foundation
import CoreData

public class ToDoItem:NSManagedObject, Identifiable {
    @NSManaged public var title: String?
    @NSManaged public var createdAt: Date?
}

extension ToDoItem {
    static func getAllToDoItems() -> NSFetchRequest<ToDoItem> {
        let request:NSFetchRequest<ToDoItem> = NSFetchRequest<ToDoItem>(entityName: "ToDoItem")
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        return request
    }
}
