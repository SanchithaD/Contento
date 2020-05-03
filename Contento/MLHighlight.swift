//
//  MLNotifications.swift
//  Contento
//
//  Created by Sanchitha Dinesh on 4/22/20.
//  Copyright © 2020 hackathon. All rights reserved.
//

import SwiftUI
import Combine
import CoreML
import CoreData
import NotificationCenter
import UserNotifications
struct MLHighlight: View {
    var recommender = Contento_Recommender_1()
    @ObservedObject var taskRecommendations = Recommender()
    
    var body : some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                Text("Remember, today is Sarah's birthday!")
                    .font(.headline)
                    .frame(width: 250, height: 280, alignment: .center)
                    
                    .background(Image("birthday")
                        .resizable()
                        .frame(width: 300, height: 300, alignment: .center)
                        .shadow(radius: 10)
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 2))
                )
                Spacer(minLength: 10)
                Text("Don't forget your medications!")
                    .font(.headline)
                    .frame(width: 250, height: 280, alignment: .center)
                    
                    .background(Image("medication")
                        .resizable()
                        .frame(width: 300, height: 300, alignment: .center)
                        .clipped()
                        .shadow(radius: 10)
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 2))
                        
                )
                Spacer(minLength: 10)

                
                Text("Tea with Beth!")
                    .font(.headline)
                    .frame(width: 250, height: 280, alignment: .center)
                    
                    .background(Image("tea")
                        .resizable()
                        .frame(width: 300, height: 300, alignment: .center)
                        .shadow(radius: 10)
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 2))
                        
                        
                )
                Spacer(minLength: 10)

            }
            .frame(height: 350)
        }
        .frame(height: 350)

    }
}





//            Section(header: Text("Suggested Tasks")) {
//        VStack (alignment: .leading) {
//            Text(task.name)
//            .font(.system(size: 14))
//            .foregroundColor(Color.gray)
//                .onReceive(self.timer) {_ in
//                let center = UNUserNotificationCenter.current()
//
//                let addRequest = {
//
//
//                    let content = UNMutableNotificationContent()
//                    content.title = task.name
//
//                     var date = DateComponents()
//                       date.hour = 12
//                       date.minute = 00
//
//                            }
//                    center.getNotificationSettings { settings in
//                        if settings.authorizationStatus == .authorized {
//                            addRequest()
//                        } else {
//                            center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
//                                if success {
//                                    addRequest()
//                                } else {
//                                    print("D'oh")
//                                }
//                            }
//                        }
//                    }
//            }
//        }
//
//        }
