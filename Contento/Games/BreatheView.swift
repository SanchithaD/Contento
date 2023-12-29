//
//  Created by mihika on 3/13/20
//  Copyright © 2020 mihika. All rights reserved.
//
import SwiftUI
struct BreatheView: View {
    
    @State private var breath = false
    @State private var inhale = true
    @State private var exhale = false
    @State private var showCentralCircle = false
    
    var body: some View {
        ZStack{
            RadialGradient(gradient: Gradient(colors: [Color.white, Color.white]), center : .center, startRadius : 10, endRadius : 1000).scaleEffect(2.2)
            ZStack{
                
                ZStack{
                    ZStack{
                        
                        
                        RadialGradient(gradient : Gradient(colors: [Color.orange, Color.yellow]), center: .center, startRadius: 5, endRadius: 100).clipShape(Circle()).frame(width: 200, height: 200).offset(y: -41)
                    }
                    
                    ZStack{
                        RadialGradient(gradient: Gradient(colors : [Color.orange, Color.yellow]), center: .center, startRadius: 5, endRadius: 90).clipShape(Circle()).frame(width: 200, height: 200).offset(y:41)
                    }
                }.opacity(0.5)
                
                ZStack{ //at 60
                    ZStack{
                        RadialGradient(gradient: Gradient(colors : [Color.orange, Color.yellow]), center: .center, startRadius: 5, endRadius: 100).clipShape(Circle()).frame(width: 200, height: 200).offset(y: -41)
                    }
                    
                    ZStack{
                        RadialGradient(gradient: Gradient(colors : [Color.orange, Color.yellow]), center: .center, startRadius: 5, endRadius: 100).clipShape(Circle()).frame(width: 200, height: 200).offset(y: 41)
                        
                    }
                }.opacity(0.5).rotationEffect(.degrees(60), anchor: .center)
                
                ZStack {
                    ZStack{
                        RadialGradient(gradient: Gradient(colors : [Color.orange, Color.yellow]), center: .center, startRadius: 5, endRadius: 100).clipShape(Circle()).frame(width: 200, height: 200).offset(y: -41)
                    }
                    
                    ZStack {
                        RadialGradient(gradient: Gradient(colors : [Color.orange, Color.yellow]), center: .center, startRadius: 5, endRadius: 100).clipShape(Circle()).frame(width: 200, height: 200).offset(y: 41)
                    }
                }.opacity(0.5).rotationEffect(.degrees(60*2), anchor: .center)
            }//Whole flower
                .rotationEffect(.degrees(breath ? 360 : 0), anchor: .center)
                .scaleEffect(breath ? 1: 0.2).animation(Animation.easeInOut(duration: 4).delay(1).repeatForever(autoreverses: true)).opacity(breath ? 1: 0.5)
                .onAppear() {
                    self.breath.toggle()
            }
            
            Circle()
                .frame(width: 40, height: 40).foregroundColor(.orange).scaleEffect(showCentralCircle ? 0 : 0.8).opacity(showCentralCircle ? 0: 1).blendMode(.plusLighter).blur(radius : 1).animation(Animation.easeInOut(duration: 4).delay(1).repeatForever(autoreverses: true))
                .onAppear() {
                    self.showCentralCircle.toggle()
            }
            
            Text("Inhale").foregroundColor(.white).animation(Animation.easeInOut(duration: 4).delay(1).repeatForever(autoreverses: true)).scaleEffect(inhale ? 1:0).opacity(inhale ? 1:0)
                .onAppear() {
                    self.inhale.toggle()
            }
            
            Text("Exhale")
                .foregroundColor(.pink)
                .animation(Animation.easeInOut(duration: 4).delay(1).repeatForever(autoreverses: true))
                .opacity(exhale ? 0 : 1)
                .onAppear() {
                    self.exhale.toggle()
            }
            Text("Breathe in...").font(.largeTitle).fontWeight(.bold).padding(.bottom, 500)
            Text("And breathe out...").font(.largeTitle).fontWeight(.bold).padding(.top, 500)
        }
    }
}
