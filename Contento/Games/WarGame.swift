//
//  WarGame.swift
//  GamesScreenTechnovation
//
//  Created by mihika on 3/20/20.
//  Copyright © 2020 mihika. All rights reserved.
//

import SwiftUI

struct WarGame: View {
    @State private var randNum1 = 2
    @State private var randNum2 = 2
    
    @State private var score1 = 0
    @State private var score2 = 0
    var body: some View {
        ZStack{
            
            VStack{
                
                Spacer()
                
                Text("WAR GAME!")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.top, 50)
                
                
                Spacer()
                HStack{
                    Image("card" + String(randNum1))
                        .frame(width: nil)
                        .border(Color.orange.opacity(0.6), width: 3).cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.orange.opacity(0.6), lineWidth: 4))
                        .shadow(radius: 10)
                    
                    Image("card" + String(randNum2))
                        .border(Color.orange.opacity(0.6), width: 3).cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.orange.opacity(0.6), lineWidth: 4))
                        .shadow(radius: 10)
                    
                }
                
                Spacer()
                
                
                Button(action: {
                    //TODO
                    
                    self.randNum1 = Int.random(in: 2...14)
                    
                    self.randNum2 = Int.random(in: 2...14)
                    
                    if self.randNum1 > self.randNum2{
                        self.score1 += 1
                    }
                    else if self.randNum2 > self.randNum1 {
                        self.score2 += 1
                    }
                    
                }) {
                    
                    Text("Deal")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .frame(width: 150.0, height: 80.0)
                        
                        .background(Color.orange.opacity(0.6))
                        .cornerRadius(20)
                        
                        
                        .shadow(radius: 20)
                    //Image("dealbutton").renderingMode(.original) //Remove later and make it aesthetic
                }
                
                Spacer()
                
                HStack{
                    VStack{
                        
                        Text("You")
                            
                            .font(.title)
                            .bold()
                            .padding(.bottom, 20)
                            .frame(width: 100.0)
                        Text(String(score1))
                            .font(.headline)
                        
                    }.background(Color.white.opacity(0.6).cornerRadius(/*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).frame(width: /*@START_MENU_TOKEN@*/150.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)).frame(width: 150.0, height: 100.0).padding(.leading, 75)
                        .frame(width: 90.0)
                        
                        
                        .foregroundColor(.black)
                    
                    
                    
                    Spacer()
                    
                    VStack{
                        
                        Text("Opponent")
                            .font(.title)
                            .bold()
                            .padding(.bottom, 20)
                        Text(String(score2))
                            .font(.headline)
                        
                        
                    }.background(Color.white.opacity(0.6).cornerRadius(/*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).frame(width: /*@START_MENU_TOKEN@*/150.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)).frame(width: 150.0, height: 80.0)
                        .padding(.trailing, 10)
                        .foregroundColor(.black)
                    
                }
                Spacer()
                
            }
        }
        
    }
}

struct WarGame_Previews: PreviewProvider {
    static var previews: some View {
        WarGame()
    }
}
