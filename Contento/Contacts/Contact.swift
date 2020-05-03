//
//  Contact.swift
//  Contento
//
//  Created by Sanchitha Dinesh on 4/13/20.
//  Copyright © 2020 hackathon. All rights reserved.
//

import SwiftUI
import Contacts

struct ContactPhoneNumber {
    var label: String
    var number: String
}

class Contact: Identifiable, ObservableObject {
    var id = UUID()
    
    private let contact: CNContact
    var image: Image = Image(systemName: "person.fill")
    
    var givenName: String {
        return contact.givenName
    }
    
    var familyName: String {
        return contact.familyName
    }
    
    var fullName: String {
        return "\(givenName) \(familyName)"
    }
    
    var email: String {
        if let email = contact.emailAddresses.first?.value as String? {
            return email
        } else {
            return ""
        }
    }
    
    var emails: String {
        var emails = [String]()
        for email in contact.emailAddresses {
            print(email.value)
            emails.append(email.value as String)
        }
        return emails.joined(separator: ", ")
    }
    
    var selectedPhoneNumberIndex: Int? = nil
    
    var phoneNumber: String {
        if let selectedIndex = selectedPhoneNumberIndex {
            return phoneNumbers[selectedIndex].number
        } else if phoneNumbers.count > 0 {
            return phoneNumbers.first!.number
        } else {
           return "No phone number"
        }
    }
    
    var phoneNumbers: [ContactPhoneNumber] {
        var numbers = [ContactPhoneNumber]()
        for phoneNumber in contact.phoneNumbers {
            var label = ""
            let number = phoneNumber.value.stringValue
            if let contactLabel = phoneNumber.label {
                label = CNLabeledValue<CNPhoneNumber>.localizedString(forLabel: contactLabel)
            } else {
                label = "No Label"
            }
            numbers.append(ContactPhoneNumber(label: label, number: number))
        }
        return numbers
    }
    

    
    init(contact: CNContact) {
        self.contact = contact
//        self.fetchImageIfNeeded { (image) in
//            self.image = image ?? Image(systemName: "person.fill")
//        }
    }
    
    func fetchImageIfNeeded(completion: @escaping ((Image?) -> Void) = {_ in }) {
        guard contact.imageDataAvailable == true, let imageData = contact.imageData else {
            completion(nil)
            return
        }
        
        //DispatchQueue.global(qos: .userInitiated).async { [weak self] in
        self.image = Image(uiImage: UIImage(data: imageData)!)
           // DispatchQueue.main.async {
                completion(self.image)
            //}
        //}
    }
}

