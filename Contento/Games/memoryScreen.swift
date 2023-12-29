//
//  memoryScreen.swift
//  GamesScreenTechnovation
//
//  Created by mihika on 3/19/20.
//  Copyright © 2020 mihika. All rights reserved.
//

import SwiftUI
struct memoryScreen: View {
    
    @State var isCenter = true
    @State var isCenter2 = true
    
    var body: some View {
        
        VStack{
            Text("Calmtento") .font(.system(size: 40))
                .fontWeight(.semibold)
                .font(.largeTitle)
                .frame(alignment: .center)
                .padding()
            //Spacer()
            Image("fallo")
            
            NavigationLink(destination: SoundsCalmtento()) {
                Text("Calming Sounds").font(.title)
                    .fontWeight(.semibold)
                    .frame(width: 275.0, height: 50.0)
                    .background(Color.orange.opacity(0.5)).cornerRadius(20).padding(.bottom,40).foregroundColor(Color.white)
            }
            
            NavigationLink(destination: BreatheView()) {
                
                Text("Breathing").fontWeight(.semibold).frame(width:275, height: 50).background(Color.orange.opacity(0.5)).cornerRadius(20).font(.title).padding(.bottom, 40).foregroundColor(Color.white)
            }
            
            NavigationLink(destination: SleepView()) {
                
                Text("Sleep Schedule").fontWeight(.semibold).frame(width:275, height: 50).background(Color.orange.opacity(0.5)).cornerRadius(20).font(.title).padding(.bottom, 40).foregroundColor(Color.white)
            }
        }
    }
}
struct memoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        memoryScreen()
    }
}
