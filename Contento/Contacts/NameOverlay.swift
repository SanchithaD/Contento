//
//  NameOverlay.swift
//  Created by Sanchitha Dinesh on 4/13/20.
//  Copyright © 2020 Sanchitha Dinesh. All rights reserved.
//

import SwiftUI

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
