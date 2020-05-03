//
//  StatusView.swift
//  SwiftUIExample
//
//  Created by Rushi Sangani on 13/06/19.
//  Copyright © 2019 Rushi Sangani. All rights reserved.
//

import Foundation
import SwiftUI


struct StatusView: View {
    
    //@State var contactImage: Image
    @State var contact: Contact
    
    
    /// body
    var body: some View {
        VStack {
            contact.image
            .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .shadow(radius: 10)
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
            Text(contact.givenName)
        }
    }
}
struct AvatarOverlay: View {
    
    /// image
    let image: Image
    
    /// gradient colors
    let colors: [Color] = [Color.gray.opacity(0.5), Color.gray.opacity(0)]
    
    /// gradient
    var gradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: colors),
                       startPoint: .topLeading, endPoint: .center)
    }
    
    /// body
    var body: some View {
        
        // ZStack - places views above each other
        ZStack(alignment: .topLeading) {
            
            // create a rectagular gradient from topleading edge to center edge
            Rectangle().fill(gradient).cornerRadius(8)
            
            // create avatar image above the gradient
            AvatarView(image: image, size: 36)
                .padding(.leading, 8)
                .padding(.top, 8)
        }
    }
}
struct AvatarView: View {
    
    /// image
    let image: Image
    
    /// size
    let size: CGFloat
    
    /// body
    var body: some View {
        image
            .resizable()
            .frame(width: size, height: size)
            .border(Color.gray.opacity(0.5), width: 0.5)
            .cornerRadius(size/2)
    }
}

/// NameOverlay
struct NameOverlay: View {
    
    /// name
    let name: String
    
    /// gradient colors
    let colors: [Color] = [Color.gray.opacity(0.5), Color.gray.opacity(0)]
    
    /// gradient
    var gradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: colors),
                       startPoint: .bottomLeading, endPoint: .center)
    }
    
    /// body
    var body: some View {
        
        // ZStack - places views above each other
        ZStack(alignment: .bottomTrailing) {
            
            // create a rectagular gradient from bottomLeading edge to center edge
            Rectangle().fill(gradient).cornerRadius(8)
            
            // create text above the gradient
            Text(name).font(.title).bold().lineLimit(1).padding(5)
        }
        .foregroundColor(.white)
    }
}

