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
        ForEach(taskRecommendations.tasks[0..<min(1,taskRecommendations.tasks.count)]) { task in
            VStack {
                Text(task.name)
                    .font(.title)
                    .frame(width: 500, height: 100)
                    .background(Color.blue.opacity(5))
            }
            
        }
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
