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
        
        var userLatitude: Float {
            return Float(locationManager.lastLocation?.coordinate.latitude ?? 0)
        }
        
        var userLongitude: Float {
            return Float(locationManager.lastLocation?.coordinate.longitude ?? 0)
        }
        let coordinate = CLLocationCoordinate2D(
            latitude: CLLocationDegrees(userLatitude), longitude: CLLocationDegrees(userLongitude))
        let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.centerCoordinate = coordinate
        view.setRegion(region, animated: true)
    }
    
}

struct ContactMapView_Previews: PreviewProvider {
    static var previews: some View {
        ContactMapView()
    }
}
