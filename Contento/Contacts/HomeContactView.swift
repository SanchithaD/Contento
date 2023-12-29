//
//  HomeContactView.swift
//  Contento
//
//  Created by Sanchitha Dinesh on 4/25/20.
//  Copyright © 2020 Sanchitha Dinesh. All rights reserved.
//

import SwiftUI
import Contacts

/// Main Contact View
struct HomeContactView : View {
    
    /// statuses
    
    @ObservedObject var contacts = RetrieveContacts()
    
    /// view body
    var body: some View {

        ScrollView(.horizontal, content: {
            HStack(spacing: 10) {
                ForEach(contacts.contacts[0..<min(7,contacts.contacts.count)]) { contact in
                    NavigationLink(destination: ContactDetailsView(contact: contact)) {
                        ContactView(contact: contact)
                            .padding(.top, 30)
                        
                    }.buttonStyle(PlainButtonStyle())
                    
                }
                NavigationLink(destination: ContactListView()) {
                    Text("All Contacts")
                }
            }
                
            .padding()
        })
            .frame(height: 40)
    }
}


class RetrieveContacts: NSObject, ObservableObject {
    
    var contacts = [Contact]()
    let keysToFetch = [
        CNContactGivenNameKey as CNKeyDescriptor,
        CNContactFamilyNameKey as CNKeyDescriptor,
        CNContactEmailAddressesKey as CNKeyDescriptor,
        CNContactPhoneNumbersKey as CNKeyDescriptor,
        CNContactImageDataAvailableKey as CNKeyDescriptor,
        CNContactImageDataKey as CNKeyDescriptor
    ]
    
    override init() {
        super.init()
        let store = CNContactStore()
        
        var results: [CNContact] = []
        
        let fetchRequest = CNContactFetchRequest(keysToFetch: keysToFetch)
        
        fetchRequest.sortOrder = CNContactSortOrder.userDefault

        
        do {
            try store.enumerateContacts(with: fetchRequest, usingBlock: { (contact, stop) -> Void in
                let contact1 = Contact(contact: contact)
                if let imageData = contact.imageData {
                    if let image = UIImage(data: imageData) {
                        contact1.image =  Image(uiImage: image)
                    }
                }
                results.append(contact)
                self.contacts.append(contact1)
                
            })
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
