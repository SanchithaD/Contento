//
//  EmergencyContactsView.swift
//  Contento
//
//  Created by Sanchitha Dinesh on 4/13/20.
//  Copyright © 2020 hackathon. All rights reserved.
//

import SwiftUI
import UIKit
struct ContactCell: View {
    @EnvironmentObject var dataSource: ContactsDataSource
    var contactID: Contact.ID
    var contact: Contact { dataSource.contact(withID: contactID) }

    var body: some View {
        NavigationLink(
            destination:
                ContactView(contactID: contactID)
                    .environmentObject(dataSource)
        ) {
            HStack {
                Thumbnail(contact: contact)
                VStack(alignment: .leading) {
                    Text(contact.person.fullNameOrPlaceholder)
                        .font(.headline)
                        .foregroundColor(.primary)
                }
            }
        }
    }
}

struct Thumbnail: View {
    var contact: Contact
    var body: some View {
        var image: Image
        if let data = contact.avatarJPEGData {
            image = Image(uiImage: UIImage(data:data)!)
        } else {
            image = Image(systemName: "person.crop.rectangle.fill")
        }
        return image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(4.0)
            .frame(width: 40, height: 40, alignment: .center)
            .foregroundColor(.green)
    }
}

/// Detail view for a Contact
struct ContactView: View {
    @EnvironmentObject var dataSource: ContactsDataSource
    var contactID: Contact.ID
    
    /// Binding used to track edits. When a field is edited, it triggers an update
    /// to this binding, which passes the change directly to the data source, and thus
    /// the store
    private var contact: Binding<Contact> {
        Binding<Contact>(
            get: { () -> Contact in
                self.dataSource.contact(withID: self.contactID)
            },
            set: { newContact in
                self.dataSource.update(newContact)
            }
        )
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("First Name", text: contact.person.firstName)
                    TextField("Last Name", text: contact.person.secondName)
                }
                Section(header: Text("Address")) {
                    TextField("Street Address", text: contact.address.streetAddress)
                    TextField("Postcode", text: contact.address.postCode)
                    TextField("City", text: contact.address.city)
                    TextField("Country", text: contact.address.country)
                }
            }
            .navigationBarTitle(Text("Contact"))
        }
    }
}


/// A list of contacts.
struct ContactsView : View {
    @EnvironmentObject var dataSource: ContactsDataSource
    
    private func thumbnail(for contact: Contact) -> Image {
        if let data = contact.avatarJPEGData {
            return Image(uiImage: UIImage(data:data)!)
        } else {
            return Image(systemName: "person.crop.rectangle.fill")
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(dataSource.contacts) { contact in
                    ContactCell(contactID: contact.id)
                        .environmentObject(self.dataSource)
                }.onDelete { indices in
                    indices.forEach {
                        self.dataSource.deleteContact(withID: self.dataSource.contacts[$0].id)
                    }
                }
            }
            .navigationBarTitle(Text("Contacts"))
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(
                    action: {
                        withAnimation {
                            self.dataSource.addNewContact()
                        }
                    }
                ) {
                    Image(systemName: "plus.circle.fill")
                }
            )
        }
    }
}


struct ContactsViewPreview : PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
