//
//  UtilityView.swift
//
//  Created by Sanchitha Dinesh on 4/13/20.
//  Copyright © 2020 Sanchitha Dinesh. All rights reserved.
//

import Foundation
import SwiftUI


struct ContactView: View {
    
    @State var contact: Contact
    
    /// body
    var body: some View {
        VStack {
            contact.image
                .resizable()
                .frame(width: 100, height: 100)
                .clipped()
                .clipShape(Circle())
                .shadow(radius: 10)
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
            Text(contact.givenName)
        }
    }
}
