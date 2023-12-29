//
//  FlagGame.swift
//  GamesScreenTechnovation
//
//  Created by mihika on 3/20/20.
//  Copyright © 2020 mihika. All rights reserved.
//

import SwiftUI

struct FlagGame: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var points = 0
    
    var body: some View {
        ZStack {
                    Image("background-1")
                    .resizable()
                        .frame(width: 900.0, height: 980.0)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 35) {
                        VStack{
                            Text("Tap the flag of: ")
                                .foregroundColor(.black)
                                .font(.title)
                            Text(countries[correctAnswer])
                                .foregroundColor(.black)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            
                        }
                        ForEach(0..<3) { number in
                            Button(action: {
                                //flag was tapped
                                self.flagTapped(number)
                            }) {
                            
                            Image(self.countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .overlay(Capsule().stroke(Color.yellow, lineWidth: 5))
                                
                                .shadow(color: Color.black, radius: 10)
                            }
                             
                        }
                        Text("Points: \(self.points)")
                            .font(.title)
                            .fontWeight(.bold)

                    }
                }
                .alert(isPresented: $showingScore) {
                    Alert(title: Text(scoreTitle), message: Text("Your score is \(points)"), dismissButton: .default(Text("Continue")) {
                           self.askQuestion()
                        })
                }
            }
            
            func flagTapped(_ number: Int) {
                if number == correctAnswer {
                    scoreTitle = "Correct!"
                    self.points += 1
                    
                }else {
                    scoreTitle = "Incorrect! That flag is \(countries[number])"
                    
                }
                
                showingScore = true
            }
            
            func askQuestion() {
                countries.shuffle()
                correctAnswer = Int.random(in: 0...2)
            }
        }

    


struct FlagGame_Previews: PreviewProvider {
    static var previews: some View {
        FlagGame()
    }
}

