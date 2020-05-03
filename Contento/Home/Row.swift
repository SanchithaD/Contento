//
//  Row.swift
//  Contento
//
//  Created by Sanchitha Dinesh on 4/18/20.
//  Copyright © 2020 hackathon. All rights reserved.
//

import SwiftUI
import Foundation
struct Row: Identifiable {
    let id = UUID()
    let cell: Cell
}

extension Row {
    
}

extension Row {
    
    static func all() -> [Row] {
        
        return [
            Row(cell: Cell(id: HomeCell.reminders.identifier, title: "To-Do", iconName: "list.bullet", backgroundName: "todo")),
            Row(cell: Cell(id: HomeCell.contacts.identifier, title: "Contacts", iconName: "contacts", backgroundName: "contacts")),
            Row(cell: Cell(id: HomeCell.memory.identifier, title: "Memory", iconName: "photo.on.rectangle", backgroundName: "memory")),
            Row(cell: Cell(id: HomeCell.location.identifier, title: "Location", iconName: "location.circle", backgroundName: "location"))
        ]
        
    }
    
}

struct Cell: Identifiable, View {
    let id: String
    var title: String
    var iconName: String
    var backgroundName: String
    var body: some View {
        if self.id == HomeCell.contacts.identifier {
            return AnyView(ContactListView())
        } else if self.id == HomeCell.reminders.identifier {
            return AnyView(ToDoList())
        } else if self.id == HomeCell.memory.identifier {
            return AnyView(Memory())
        } else {
            return AnyView(ContactMapView())
        }
    }
    
    //var view: View
}

enum HomeCell {
    case reminders
    case contacts
    case memory
    case location
}

extension HomeCell {
    var identifier: String {
        switch self {
        case .reminders:
            return "Reminders"
        case .contacts:
            return "Contacts"
        case .memory:
            return "Memory"
        case .location:
            return "Location"
        }
    }
}
