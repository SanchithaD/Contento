//
//  Safety.swift
//  Contento
//
//  Created by Sanchitha Dinesh on 3/17/20.
//  Copyright © 2020 Sanchitha. All rights reserved.
//

import SwiftUI
struct UserInfo: View {

    var body: some View {

        ZStack{
            NavigationView{
                VStack {
                    Image("moi")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    HStack{
                        Text("Patient information")
                            .fontWeight(.bold) .font(.headline)
                            .foregroundColor(Color.orange)
                            .padding(.trailing, 100)
                        Text("Birth Date")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.orange)
                            .padding(.trailing, 2)
                    }
                    HStack{
                        Text("Sanchitha Dinesh")
                            .padding(.trailing, 80)
                        Text("September 1, 2006")
                            .padding(.leading, 25)
                    }//.padding()
                    HStack{
                        Text("(408)255-0189")
                            .padding(.leading, 20)
                            
                            .padding(.trailing, 100)
                        Text("Weight/Height")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.orange)
                            .padding(.trailing, 14)
                    }.padding()
                    HStack{
                        VStack{
                            Text("5**3 *** Street")
                                .padding(.trailing, 60)
                            Text("San Jose, California(CA)").padding(.trailing, 35)
                            
                        }
                        VStack{
                            Text("97 lb")
                                .padding(.leading, 50)
                            
                            Text("157 cm").padding(.leading, 45)
                        }
                    }
                    Text("------------------------------------------------------")
                        .padding(.top)
                    HStack{
                        Text("Doctor information")
                            .fontWeight(.bold) .font(.headline)
                            .foregroundColor(Color.orange)
                            .padding(.trailing, 100)
                        Text("Last Visit")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.orange)
                            .padding(.trailing, 2)
                    }
                    HStack{
                        Text("Amanda Nyugen")
                            .padding(.trailing, 80)
                        Text("July 18 2019 ")
                            .padding(.leading, 25)
                    }//.padding()
                    HStack{
                        Text("(408)793-5182")
                            .padding(.trailing, 30)
                            
                            .padding(.trailing, 100)
                        Text("Next Visit")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.orange)
                            .padding(.trailing, 14)
                    }.padding()
                    HStack{
                        VStack{
                            Text("Oaksem Hospital")
                                .padding(.trailing, 60)
                            Text("Seripa, California(CA), 208").padding(.trailing, 1)
                            
                        }
                        VStack{
                            Text("July 25 2020")
                                .padding(.leading, 50)
                            
                            Text("10:00 AM ").padding(.leading, 45)
                        }
                    }
                    
                    
                }
                
            }
            .navigationBarTitle("Medical Records")
            
        }
        
    }
}
struct HealthRecords: View {
    var body: some View {
        NavigationView {
            List {
                //VStack {
                Section {
                    HStack {
                        Image(systemName: "eyedropper")
                            .foregroundColor(.blue)
                        
                        Text("Allergies")
                            .foregroundColor(.blue)
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                    }
                    VStack(alignment: .leading) {
                        Text("Peanuts")
                    }
                }
                
                
                Section {
                    HStack {
                        Image(systemName: "waveform.path.ecg")
                            .foregroundColor(.purple)
                        Text("Clinical Vitals")
                            .foregroundColor(.purple)
                            .font(.system(size: 24))
                            .fontWeight(.bold)                    }
                    VStack(alignment: .leading) {
                        Text("Body Mass Index")
                        Text("Body Temperature")
                        Text("Heart Rate")
                    }
                }
                
                Section {
                    HStack {
                        Image(systemName: "heart")
                            .foregroundColor(.red)
                        Text("Conditions")
                            .foregroundColor(.red)
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                        
                    }
                    VStack(alignment: .leading) {
                        Text("Arthritis")
                        Text("Asthma")
                    }
                }
                
                Section {
                    HStack {
                        Image(systemName: "staroflife")
                            .foregroundColor(.orange)
                        Text("Medications")
                            .foregroundColor(.orange)
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                        
                    }
                    VStack(alignment: .leading) {
                        Text("Loratadine")
                        Text("Albuterol")
                    }
                }
                
                Section {
                    HStack {
                        Image(systemName: "list.number")
                            .foregroundColor(.pink)
                        Text("Procedures")
                            .foregroundColor(.pink)
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                        
                    }
                    VStack(alignment: .leading) {
                        Text("Loratadine")
                        Text("Albuterol")
                        
                    }
                }
                NavigationLink(destination: UserInfo()) {
                    Section {
                        
                        Text("User Info")
                    }
                    
                }
            }
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .navigationBarTitle("Medical Records")
            
        }
    }
}

struct HealthRecords_Previews: PreviewProvider {
    static var previews: some View {
        HealthRecords()
    }
}
