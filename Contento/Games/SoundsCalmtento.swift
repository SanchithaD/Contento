//
//  SoundsCalmtento.swift
//  GamesScreenTechnovation
//
//  Created by mihika on 4/11/20.
//  Copyright © 2020 mihika. All rights reserved.
//

import SwiftUI
import AVKit

struct SoundsCalmtento: View {
    
    @State var time : CGFloat = 0
    @State var player : AVAudioPlayer!
    
    @State var time2 : CGFloat = 0
    @State var player2 : AVAudioPlayer!
    
    @State var time3 : CGFloat = 0
    @State var player3 : AVAudioPlayer!
    
    var body: some View {
        
        
        VStack {
            
            Text("Calming Sounds")
                .font(.largeTitle)
                .fontWeight(.bold).padding(.bottom, 10)
            
            
            ZStack(alignment: .leading, content : {
                Capsule()
                    .fill(Color.gray).frame(height: 20).padding(10)
                
                Capsule()
                    .fill(Color.orange).frame(width: time, height: 20).padding(10)
                
                
                
            })
            
            Button(action: {
                
                self.player.play()
                
                DispatchQueue.global(qos: .background).async {
                    
                    while true {
                        let screenWidth = UIScreen.main.bounds.width - 20
                        
                        let currenttime = self.player.currentTime / self.player.duration
                        
                        let timeForLabel = CGFloat(currenttime) * screenWidth
                        
                        self.time = timeForLabel
                        
                        print(currenttime)
                        
                    }
                    
                }
                
            }) {
                
                Text("Rainfall - 3 minutes").font(.title).frame(width: 350.0, height: 50.0).foregroundColor(Color.black).background(Color.orange.opacity(0.5)).cornerRadius(30).padding(.bottom, 50)
                
                
            }
            
            
            ZStack(alignment: .leading, content : {
                Capsule()
                    .fill(Color.gray).frame(height: 20).padding(10)
                
                Capsule()
                    .fill(Color.orange).frame(width: time2, height: 20).padding(10)
                
            })
            
            Button(action: {
                
                self.player2.play()
                
                DispatchQueue.global(qos: .background).async {
                    
                    while true {
                        
                        
                        
                        let screenWidth2 = UIScreen.main.bounds.width - 20
                        
                        let currenttime = self.player2.currentTime / self.player2.duration
                        
                        let timeForLabel = CGFloat(currenttime) * screenWidth2
                        
                        self.time2 = timeForLabel
                        
                        print(currenttime)
                        
                    }
                    
                }
                
            }) {
                
                Text("Rainforest - 3 minutes").font(.title).frame(width: 350.0, height: 50.0).foregroundColor(Color.black).background(Color.orange.opacity(0.5)).cornerRadius(30).padding(.bottom, 50)
                
            }
            
            ZStack(alignment: .leading, content : {
                Capsule()
                    .fill(Color.gray).frame(height: 20).padding(10)
                
                Capsule()
                    .fill(Color.orange).frame(width: time3, height: 20).padding(10)
                
            })
            
            Button(action: {
                
                self.player3.play()
                
                DispatchQueue.global(qos: .background).async {
                    
                    while true {
                        
                        
                        
                        let screenWidth3 = UIScreen.main.bounds.width - 20
                        
                        let currenttime = self.player3.currentTime / self.player3.duration
                        
                        let timeForLabel = CGFloat(currenttime) * screenWidth3
                        
                        self.time3 = timeForLabel
                        
                        print(currenttime)
                        
                    }
                    
                }
                
            }) {
                
                Text("Howling Winds - 3 minutes").font(.title).frame(width: 350.0, height: 50.0).foregroundColor(Color.black).background(Color.orange.opacity(0.5)).cornerRadius(30).padding(.bottom, 50)
            }
            
            Image("fallo")
            
        }
            
        .onAppear {
            let url = Bundle.main.path(forResource: "2 Minutes Relaxing Sound of RainDestress and reliefNature Sound", ofType: "mp3")
            
            self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
            
        }
            
        .onAppear {
            let url2 = Bundle.main.path(forResource: "audio2", ofType: "mp3")
            
            self.player2 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url2!))
        }
            
        .onAppear {
            let url3 = Bundle.main.path(forResource: "audio3", ofType: "mp3")
            self.player3 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url3!))
            
        }
    }
}

struct SoundsCalmtento_Previews: PreviewProvider {
    static var previews: some View {
        SoundsCalmtento()
    }
}
