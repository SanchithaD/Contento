//
//  MLNotifications.swift
//  Contento
//
//  Created by Sanchitha Dinesh on 4/22/20.
//  Copyright © 2020 Sanchitha Dinesh. All rights reserved.
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
            HStack(spacing: 70) {

                Text("Don't forget your medications!")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 150, height: 150, alignment: .center)
                    
                    .background(RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 2, endRadius: 650)
                        .frame(width: 200, height: 200)
                )
                Text("Remember, today is Amma's birthday!")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .frame(width: 150, height: 150, alignment: .center)

                    .background(Image("birthday")
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .center)
                        .shadow(radius: 10)
                )
                Text("Tea with Beth!")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 150, height: 150, alignment: .center)
                    
                    .background(RadialGradient(gradient: Gradient(colors: [.pink, .black]), center: .center, startRadius: 2, endRadius: 650)
                        .frame(width: 200, height: 200)

                )

            }
            .frame(height: 300)
        }
        .frame(height: 300)

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
