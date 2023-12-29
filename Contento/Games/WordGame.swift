//
//  WordGame.swift
//  GamesScreenTechnovation
//
//  Created by mihika on 3/20/20.
//  Copyright © 2020 mihika. All rights reserved.
//

import SwiftUI

struct WordGame: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    @State var points = 0
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter your word", text: $newWord, onCommit: addNewWord ).textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding()
                
                
                
                List {
                    Image("one")
                        .resizable()
                        .frame(width: 385.0, height: 230.0)
                }
                
                Text("Points: \(points)")
                    .font(.title)
                    .fontWeight(.light)
                
                
                List(usedWords, id: \.self) {
                    Image(systemName: "\($0.count).circle")
                    Text($0)
                    
                    
                    
                }
            }
            .navigationBarTitle(rootWord)
            .onAppear(perform: startGame)
            .alert(isPresented: $showingError) {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
                
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else {
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word is used already", message: "Be more Original! :) ")
            self.points -= 1
            return
        }
        
        guard isPossible(word:answer) else {
            wordError(title: "Word is not possible!", message: "Hehe you can't make up words silly!")
            self.points -= 1
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word is not real!", message: "That isn't a real word!")
            self.points -= 1
            return
        }
        
        
        usedWords.insert(answer, at: 0)
        newWord = ""
    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
        
    }
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord.lowercased()
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter){
                tempWord.remove(at:pos)
                self.points += 1
            } else {
                self.points -= 1
                return false
            }
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
}


struct WordGame_Previews: PreviewProvider {
    static var previews: some View {
        WordGame()
    }
}
