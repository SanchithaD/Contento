//
//  SwiftUIView.swift
//  Contento
//
//  Created by Sanchitha Dinesh on 4/26/20.
//  Copyright © 2020 hackathon. All rights reserved.
//

import SwiftUI

struct ToDoItemView: View {
    
    var title: String = ""
    var createdAt: String = ""
    @State var isChecked:Bool = false
    func toggle(){
    isChecked = !isChecked}
    var body: some View {
        
        HStack(){
            Button(action: toggle){ Image(systemName: isChecked ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(Color.green)
            }
            VStack(alignment: .leading){
                Text(title)
                    .font(.headline)
                Text(createdAt)
                    .font(.caption)
            }
        }
    }
}


