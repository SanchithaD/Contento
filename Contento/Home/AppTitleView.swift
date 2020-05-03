
//
//  AppTitleView.swift
//  FirebaseLogin
//
//  Created by Sanchitha Dinesh on 2/29/20.
//  Copyright © 2020 Sanchitha. All rights reserved.
//

import SwiftUI

struct AppTitleView: View {
    
    var Title: String
    var body: some View {
        
        VStack {
            VStack{
                Text("Contento") .font(.system(size: 40))
                    .fontWeight(.thin)
                    .font(.largeTitle)
                    .frame(alignment: .topLeading)
                    .padding()
                
                Text(Title) .font(.system(size: 24)).fontWeight(.ultraLight).frame(alignment: .topLeading)
                .padding()
                
            
                
            }.background(Color.white)
        }
    }
}
struct AppTitleView_Previews: PreviewProvider {
    static var previews: some View {
        AppTitleView(Title: "Example")
    }
}
