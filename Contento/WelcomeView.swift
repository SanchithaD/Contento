//
//  WelcomeView.swift
//  Contento
//
//  Created by Sanchitha Dinesh on 3/15/20.
//  Copyright © 2020 Sanchitha. All rights reserved.
//

import SwiftUI
import Firebase
public var screenWidth: CGFloat {
     return UIScreen.main.bounds.width
 }
public var screenHeight: CGFloat {
    return UIScreen.main.bounds.height
}
struct WelcomeView: View {
  
       @State var signUpIsPresent: Bool = false
       @State var signInIsPresent: Bool = false
       @State var selection: Int? = nil
       @State var viewState = CGSize.zero
       @State var MainviewState =  CGSize.zero
       
       var body: some View {
        
        ZStack{
            
           if Auth.auth().currentUser != nil {
            TabView {
                HomeView()
            .tabItem {
                VStack{
                    Image(systemName: "1.circle")
                                    Text("Home")
                }

                           }.tag(1)
                ContactMap()
                                    .tabItem {
                
                                        VStack {
                                    Image(systemName: "2.circle")
                                            Text("Location")
                                        }
                
                                }.tag(2)
                Games()
                                    .tabItem {
                                        VStack {
                                  Image(systemName: "3.circle")
                                            
                                            Text("Games")
                
                                        }
                                }.tag(3)
                Safety()
                    .tabItem {
                        VStack {
                            Image(systemName: "4.circle")
                            Text("Safety")

                        }.tag(4)
                Settings()
                    .tabItem {
                        VStack {
                            Image(systemName: "5.circle")
                            Text("Settings")
                        }
                        }
                }
                
            }

            }
            
           else {
            
           VStack {
            
            
                           AppTitleView(Title: "Welcome")
                            Spacer()
                            VStack(spacing:20) {
                                Image("logo")
            
                                Button(action: {self.signUpIsPresent = true}){
                                    Text("Sign Up")
                                        .font(.title)
                                        .fontWeight(.light)
                                        .foregroundColor(Color.white)
                                        .frame(width: 200, height: 100)
                                        .background(Color.red.opacity(0.3))
            
                                        .cornerRadius(40)
                                        .padding(.bottom)
            
                                }.sheet(isPresented: self.$signUpIsPresent){
            
                                    SignUpView()
            
                                }
            
                                Button(action: {self.signInIsPresent = true}){
            
                                    Text("Sign In")
                                        .font(.title)
                                        .fontWeight(.light)
                                        .foregroundColor(Color.white)
                                        .frame(width: 200.0, height: 100.0)
                                        .background(Color.red.opacity(0.3))
            
                                        .cornerRadius(40)
                                        .padding(.bottom)
            
                                }.sheet(isPresented: $signInIsPresent) {
            
                                    SignInView(onDismiss:{
            
                                        self.viewState = CGSize(width: screenWidth, height: 0)
                                        self.MainviewState = CGSize(width: 0, height: 0)
            
                                    })}}
                            Spacer()
            
                        }
                    }
            
                }
            
            }
}


struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}




struct HomeView: View {
    var body: some View {
        NavigationView {
        VStack{
            AppTitleView(Title: "Home")
            List {
            
                NavigationLink(destination: Memories()) {
                    HStack(alignment: .top){
                        VStack(alignment: .leading){
                            Text("Random Memory")
                                .foregroundColor(.white)
                                .font(Font.largeTitle)
                                .padding()
                                .background(Color.white.opacity(0.05))
                            Text("""
Here's a blast from the past! \
Click here to see a random picture from your photos!
""")
                                .font(Font.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.white.opacity(0.05))
                        }.background(Color.black.opacity(0.3))
                            .background(Image("Memories")
                                .scaledToFit()
                                .padding(.all, 1))
                    }.background(Color.white)
                        .clipped()
                        .shadow(color: .black, radius: 5)
                        .padding(20.0)
                    
                }
                NavigationLink(destination: EmergencyContacts()) {
                    HStack(alignment: .top){
                        VStack(alignment: .leading){
                            Text("Emergency Contacts")
                                .foregroundColor(.white)
                                .font(Font.largeTitle)
                                .padding()
                                .background(Color.white.opacity(0.05))
                            Text("""
An easy way to reach loved ones. \
Press volume button to contact in time of emergency.
""")
                                .font(Font.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.white.opacity(0.05))
                        }.background(Color.black.opacity(0.3))
                            .background(Image("Contacts")
                                .scaledToFit()
                                .padding(.all, 1))
                    }.background(Color.white)
                        .clipped()
                        .shadow(color: .black, radius: 5)
                        .padding(20.0)
                    
                }
                NavigationLink(destination: ToDoList()) {
                    HStack(alignment: .top){
                        VStack(alignment: .leading){
                            Text("To-Do List")
                                .foregroundColor(.white)
                                .font(Font.largeTitle)
                                .padding()
                                .background(Color.white.opacity(0.05))
                            Text("""
Never forget what your daily tasks again!\
Loved ones will be alerted once you complete your task.
""")
                                .font(Font.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.white.opacity(0.05))
                        }.background(Color.black.opacity(0.3))
                            .background(Image("To-Do List")
                                .scaledToFit()
                                .padding(.all, 1))
                    }
                        
                    .background(Color.white)
                    .clipped()
                    .shadow(color: .black, radius: 5)
                    .padding(20.0)
                    
                
                
                
            }
            
            
            Button(action: {
                let firebaseAuth = Auth.auth()
                do {
                    try firebaseAuth.signOut()
                    
                } catch let signOutError as NSError {
                    print ("Error signing out: %@", signOutError)
                }
                
                
                
            }, label: {
                Text("Sign Out")
                    .foregroundColor(Color.red)
                    .padding()
            })
            
            
        }                        .background(Color.white)
    
        }
        
    }
    }
}
