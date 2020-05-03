////
////  SwiftUIView.swift
////  Contento
////
////  Created by Sanchitha Dinesh on 4/24/20.
////  Copyright © 2020 hackathon. All rights reserved.
////
//
//import SwiftUI
//import Contacts
//
//
///// Main Content View
//
//import SwiftUI
//
///// Main Content View
//struct ContactView : View {
//    
//    /// statuses
//    let store = CNContactStore()
//    @State var contacts = [Contact]()
//    @State var fetchedContacts = [Contact]()
//    //
//    //    /// posts
//    //    let posts = TestData.posts()
//    
//    /// view body
//    var body: some View {
//        
//        NavigationView {
//            List {
//                // statuses
//                ScrollView(.horizontal, content: {
//                    HStack(spacing: 10) {
//                        ForEach(fetchedContacts) { contact in
//                           // StatusView()
//                        }
//                    }
//                    .padding(.leading, 10)
//                })
//                    .frame(height: 40)
//            }
//            .padding(.leading, -20)
//            .padding(.trailing, -20)
//            .onAppear() {
//                print("Launced")
//                let authorizationStatus = CNContactStore.authorizationStatus(for: .contacts)
//                
//                if authorizationStatus == .notDetermined {
//                    self.store.requestAccess(for: .contacts) {  (didAuthorize, error) in
//                        if didAuthorize {
//                            self.retrieveContacts()
//                        }
//                    }
//                } else if authorizationStatus == .authorized {
//                    self.retrieveContacts()
//                }
//            }
//        }
//        //.navigationBarTitle(Text("Home"))
//    }
//    
//    func retrieveContacts(with customFilter: NSPredicate? = nil) {
//        let containerId = store.defaultContainerIdentifier()
//        let filter = CNContact.predicateForContactsInContainer(withIdentifier: containerId)
//        
//        let keysToFetch = [
//            CNContactGivenNameKey as CNKeyDescriptor,
//            CNContactFamilyNameKey as CNKeyDescriptor,
//            CNContactEmailAddressesKey as CNKeyDescriptor,
//            CNContactPhoneNumbersKey as CNKeyDescriptor,
//            CNContactImageDataAvailableKey as CNKeyDescriptor,
//            CNContactImageDataKey as CNKeyDescriptor
//        ]
//        
//        do {
//            if let customFilter = customFilter {
//                fetchedContacts.removeAll(keepingCapacity: false)
//                fetchedContacts = try store.unifiedContacts(matching: customFilter, keysToFetch: keysToFetch).map { Contact(contact: $0) }
//                print(fetchedContacts)
//            } else {
//                contacts = try store.unifiedContacts(matching: filter, keysToFetch: keysToFetch).map { Contact(contact: $0) }
//                print(contacts)
//            }
//        } catch {
//            print(error)
//        }
//    }
//}
