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
                    ToDoList()
                        .tabItem {
                            
                            VStack {
                                Image(systemName: "2.circle")
                                Text("To-Do")
                            }
                            
                    }.tag(2)
                    Games()
                        .tabItem {
                            VStack {
                                Image(systemName: "3.circle")
                                
                                Text("Games")
                                
                            }
                    }.tag(3)
                    HealthRecords()
                        .tabItem {
                            VStack {
                                Image(systemName: "4.circle")
                                Text("Safety")
                                
                            }.tag(4)

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






struct HomeView: View {
    @State private var isPressed: Bool = false
    
    let rows = Row.all()
    var body: some View {
        
        NavigationView {
            ScrollView{
//              MLHighlight()
                HStack {
                    Text("Contento") .font(.system(size: 45))
                        .fontWeight(.thin)
                        .font(.largeTitle)
                        .frame(alignment: .center)
                        .padding()
                    Spacer()
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
                }
                VStack(alignment: .leading){
                    
                    Text("Current Location")
                        .font(.title)
                        .fontWeight(.bold )
                    Divider()
                    
                    NavigationLink(destination: ContactMapView()) {
                        ContactMapView()
                            .frame(width: 400, height: 150)
                             .clipped()
                            //.padding(.leading, 20)
                            .cornerRadius(15)
                            .shadow(color: Color.black, radius: 5)
                        
                    }
                    
                }
                .padding(.all)
                
                VStack(alignment: .leading) {
                    Text("Emergency Contacts")
                        .font(.title)
                        .fontWeight(.bold )
                    Divider()
                    
                    //NavigationLink(destination: ContactListView() ) {
                    //                        VStack() {
                    //                        Image(systemName: "person.crop.circle")
                    //                            .foregroundColor(.black)
                    //                        Text("Contacts to reach in time of emergency. Click alert all contacts, in time of emergency")
                    //                            .foregroundColor(.black)
                    //
                    //                        }
                    
                    HomeContactView()
                        .frame(height: 175)
                        .cornerRadius(15)
//                        .shadow(color: Color.black, radius: 5)
                    
                    
                    
                }
                VStack(alignment: .leading){
                    Text("Highlights")
                        .font(.title)
                        .fontWeight(.bold)
                    MLHighlight()
                }
                .padding(.all)
                VStack(alignment: .leading) {
                    Text("Memories")
                        .font(.title)
                        .fontWeight(.bold )
                    Divider()
                    NavigationLink(destination: Memory()){
                        PhotoPicker()
                        .frame(width: 400, height: 300)
                        .clipped()
                        .overlay(NameOverlay(name: "Today's Memory"))

                    }
                    
                    
                }
                .padding(.all)
            }.navigationBarTitle("Contento", displayMode: .inline)
            
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
//ScrollView(.horizontal, content: {
//    HStack(spacing: 10) {
//        Memory(photoIndex: 5)
//            .frame(width: 150, height: 150)
//            .cornerRadius(15)
//            .shadow(color: Color.black, radius: 5)
//            .clipped()
//
//
//
//        Memory(photoIndex: 8)
//            .frame(width: 150, height: 150)
//            .cornerRadius(15)
//            .shadow(color: Color.black, radius: 5)
//            .clipped()
//
//
//
//
//        Memory(photoIndex: 12)
//            .frame(width: 150, height: 150)
//            .cornerRadius(15)
//            .shadow(color: Color.black, radius: 5)
//            .clipped()
//        NavigationLink(destination: Memory()) {
//            Text("Today's Memory")
//        }
//
//
//    }
//    .padding(.leading, 10)
//})
