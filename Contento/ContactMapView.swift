//
//  ContactMapView.swift
//  Contento
//
//  Created by Sanchitha Dinesh on 3/17/20.
//  Copyright © 2020 Sanchitha. All rights reserved.
//

import SwiftUI
import MapKit
import UserNotifications


struct ContactMapView: UIViewRepresentable {

    var locationManager = CLLocationManager()
    func setupManager() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
    }
    
    func makeUIView(context: Context) -> MKMapView {
        setupManager()
        let mapView = MKMapView(frame: UIScreen.main.bounds)
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
    }
    func monitorRegionAtLocation(center: CLLocationCoordinate2D, identifier: String ) {
        // Make sure the devices supports region monitoring.
        if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
            // Register the region.
            let maxDistance = locationManager.maximumRegionMonitoringDistance
            let region = CLCircularRegion(center: center,
                                          radius: maxDistance, identifier: identifier)
            region.notifyOnEntry = true
            region.notifyOnExit = false

            
            locationManager.startMonitoring(for: region)
            

            
        }
    }
    
}

struct ToDoMap: View {
    var body: some View {
        VStack {
        ContactMapView()
            NavigationLink (destination: LocationView()) {
        Text("New Location")
            .foregroundColor(Color.blue)
            }
        }
    }
}

struct LocationView: View {
    var body: some View {
        VStack {
            Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                /*@START_MENU_TOKEN@*/Text("1").tag(1)/*@END_MENU_TOKEN@*/
                /*@START_MENU_TOKEN@*/Text("2").tag(2)/*@END_MENU_TOKEN@*/
            }
            Text("Hello World")
        }
    }
}

struct ContactMapView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoMap()
    }
}
