//
//  contentview.swift
//  Contento
//
//  Created by Sanchitha Dinesh on 4/25/20.
//  Copyright © 2020 hackathon. All rights reserved.
//

import SwiftUI
import Contacts

/// Main Content View
struct HomeContactView : View {
    
    /// statuses
    
    @ObservedObject var contacts = RetrieveContacts()
    
    /// view body
    var body: some View {
        
        //NavigationView {
        //List {
            // statuses
            ScrollView(.horizontal, content: {
                HStack(spacing: 10) {
                    ForEach(contacts.contacts[0..<min(5,contacts.contacts.count)]) { contact in
                        NavigationLink(destination: ContactDetailsView(contact: contact)) {
                            StatusView(contact: contact)
                                //.padding(.vertical)
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
        //}
        //.padding(.leading, -20)
        //.padding(.trailing, -20)
    }
    //}
    
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
        let containerID = CNContactStore().defaultContainerIdentifier()
        let filter = CNContact.predicateForContactsInContainer(withIdentifier: containerID)
        do {
            contacts = try store.unifiedContacts(matching: filter, keysToFetch: keysToFetch).map {
                var contact = Contact(contact: $0)
                if let imageData = $0.imageData {
                    if let image = UIImage(data: imageData) {
                        contact.image =  Image(uiImage: image)
                    }
                }
                return contact
            }
        } catch {
            print("Error")
        }
    }
}
