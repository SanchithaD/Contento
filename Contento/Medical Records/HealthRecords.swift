//
//  Safety.swift
//  Contento
//
//  Created by Sanchitha Dinesh on 3/17/20.
//  Copyright © 2020 Sanchitha. All rights reserved.
//

import SwiftUI

struct HealthRecords: View {
    var body: some View {
        NavigationView {
            List {
            VStack {
                Section {
                    HStack {
                        Image(systemName: "eyedropper")
                            .foregroundColor(.blue)
                        
                        Text("Allergies")
                            .foregroundColor(.blue)
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                    Text("Peanuts")
                }

                Section {
                    HStack {
                        Image(systemName: "waveform.path.ecg")
                            .foregroundColor(.purple)
                        Text("Clinical Vitals")
                            .foregroundColor(.purple)
                            .font(.subheadline)
                             .fontWeight(.bold)                    }
                    VStack(alignment: .leading) {
                        Text("Body Mass Index")
                        //                        .font(.body)
                        Text("Body Temperature")
                        //                        .font(.body)
                        Text("Heart Rate")
                        //                        .font(.body)
                    }
                }

                Section {
                    HStack {
                        Image(systemName: "heart")
                            .foregroundColor(.red)
                        Text("Conditions")
                            .foregroundColor(.red)
                            .font(.subheadline)
                             .fontWeight(.bold)
                        
                    }
                    VStack(alignment: .leading) {
                        Text("Arthritis")
                        //                        .font(.body)
                        Text("Asthma")
                        //                        .font(.body)
                        
                    }
                }

                Section {
                    HStack {
                        Image(systemName: "staroflife")
                            .foregroundColor(.orange)
                        Text("Medications")
                            .foregroundColor(.orange)
                            .font(.subheadline)
                             .fontWeight(.bold)
                        
                    }
                    VStack(alignment: .leading) {
                        Text("Loratadine")
                        //                        .font(.body)
                        Text("Albuterol")
                        //                        .font(.body)
                        
                    }
                }

                Section {
                    HStack {
                        Image(systemName: "list.number")
                            .foregroundColor(.pink)
                        Text("Procedures")
                            .foregroundColor(.pink)
                            .font(.subheadline)
                             .fontWeight(.bold)
                        
                    }
                    VStack(alignment: .leading) {
                        Text("Loratadine")
                        //                        .font(.body)
                        Text("Albuterol")
                        //                        .font(.body)
                        
                    }
                }
            }
        }
            .navigationBarTitle("Medical Records")


    }
}
}

struct HealthRecords_Previews: PreviewProvider {
    static var previews: some View {
        HealthRecords()
    }
}
