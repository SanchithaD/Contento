//
//  ContactMapView.swift
//  Contento
//
//  Created by Sanchitha Dinesh on 3/17/20.
//  Copyright © 2020 Sanchitha. All rights reserved.
//

import SwiftUI
import UserNotifications
import MapKit
struct ContactMapView: UIViewRepresentable {
    
    @ObservedObject var locationManager = LocationManager()
    
    func makeUIView(context: Context) -> MKMapView{
        MKMapView()
    }
    func updateUIView(_ view: MKMapView, context: Context){
        
        var userLatitude: Double {
            return Double(Float(locationManager.lastLocation?.coordinate.latitude ?? 0))
        }
        
        var userLongitude: Double {
            return Double(Float(locationManager.lastLocation?.coordinate.longitude ?? 0))
        }
        let coordinate = CLLocationCoordinate2D(
            latitude: CLLocationDegrees(userLatitude), longitude: CLLocationDegrees(userLongitude))
        let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.centerCoordinate = coordinate
        view.setRegion(region, animated: true)
        locationManager.addNotification()
    }
    
}

struct ContactMapView_Previews: PreviewProvider {
    static var previews: some View {
        ContactMapView()
    }
}

struct HomeMapView : View {

/// statuses

/// view body
var body: some View {

    VStack(spacing: 10) {
        ContactMapView().overlay(Text("Go Home")
        .font(.title)
        .fontWeight(.semibold)
        .foregroundColor(Color.white)
        .frame(width: 250, height: 70)
        .background(Color.blue.opacity(0.6)
        .cornerRadius(15))
        .padding(.top, 10), alignment: .top)
    }
}
}
