//
//  Created by mihika on 4/13/20
//  Copyright © 2020 mihika. All rights reserved.
//

import SwiftUI

struct ReceipeView: View {
    @State private var act = ["Take a water break!", "Go for a 20 minute walk!", "Facetime with your family!", "Write a short poem.", "Play some cognitive games!", "Read a new book!", "Do some coloring!", "Learn about a new country!", "Take a snack break!", "Watch your favorite show!", "Take a short nap.", "Spend some time outside!"].shuffled()
     @State private var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        
       VStack{
        
        Text("Activity Ideas: ").padding(.top, 100)
               .foregroundColor(.black)
               .font(.largeTitle)
        
        Text(act[correctAnswer])
               .foregroundColor(.black)
               .font(.title)
            .fontWeight(.bold)
        
        Spacer()
        
        Image("fallo")
        
        
        Text("Healthy recipe ideas: ").font(.largeTitle).padding(.top,60)
        
        Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: Text("")) {
            Text("Breakfast").font(.largeTitle).fontWeight(.bold).tag(1)
            Text("Lunch").font(.largeTitle).fontWeight(.bold).tag(2)
            Text("Dinner").font(.largeTitle).fontWeight(.bold).tag(3)
            Text("Dessert").font(.largeTitle).fontWeight(.bold).tag(4)
            Text("Snacks!").font(.largeTitle).fontWeight(.bold).tag(5)
        }.padding([.leading, .bottom, .trailing], 200)

    
            
        
         
    }
}
}
