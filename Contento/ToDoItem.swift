//
//  ToDo.swift
//  Contento
//
//  Created by Sanchitha Dinesh on 4/26/20.
//  Copyright © 2020 hackathon. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI

public class Todo: NSManagedObjectModel, Identifiable {
    @NSManaged public var text: String?
    @NSManaged public var createdAt: Date?
}

extension Todo {
    static func getAllTodosRequest() -> NSFetchRequest<Todo> {
        let request: NSFetchRequest<Todo> = Todo.fetchRequest() as!
            NSFetchRequest<Todo>
        request.sortDescriptors = [NSSortDescriptor(key: "createdAt", ascending: true)]
        return request
    }
}
