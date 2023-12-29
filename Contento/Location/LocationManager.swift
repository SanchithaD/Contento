//
//  LocationManager.swift
//  Contento
//
//  Created by Sanchitha Dinesh on 4/8/20.
//  Copyright © 2020 Sanchitha Dinesh. All rights reserved.
//

import Foundation
import CoreLocation
import Combine
import UserNotifications

class LocationManager: NSObject, ObservableObject {

    private let geocoder = CLGeocoder()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = 0.5
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.requestLocation()
        self.locationManager.startUpdatingLocation()
    }

    @Published var locationStatus: CLAuthorizationStatus? {
        willSet {
            objectWillChange.send()
        }
    }

    @Published var lastLocation: CLLocation? {
        willSet {
            objectWillChange.send()
        }
    }

    var statusString: String {
        guard let status = locationStatus else {
            return "unknown"
        }

        switch status {
        case .notDetermined: return "notDetermined"
        case .authorizedWhenInUse: return "authorizedWhenInUse"
        case .authorizedAlways: return "authorizedAlways"
        case .restricted: return "restricted"
        case .denied: return "denied"
        default: return "unknown"
        }

    }

    let objectWillChange = PassthroughSubject<Void, Never>()

    private let locationManager = CLLocationManager()
    func addNotification() {
        let center = UNUserNotificationCenter.current()

        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Are you doing OK?"
            content.body = "You haven't moved for the past 6 hours!"
            content.sound = UNNotificationSound.default

          
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)

            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
            
            // add our notification request
            //UNUserNotificationCenter.current().add(request)
            
            center.add(request)
            
        }

        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else {
                        print("D'oh")
                    }
                }
            }
        }

    }
    
    @Published var placemark: CLPlacemark? {
       willSet { objectWillChange.send() }
     }
    
    private func geocode() {
      guard let location = self.lastLocation else { return }
      geocoder.reverseGeocodeLocation(location, completionHandler: { (places, error) in
        if error == nil {
          self.placemark = places?[0]
        } else {
          self.placemark = nil
        }
      })
    }
}

extension LocationManager: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.locationStatus = status
        if status == .notDetermined {
            manager.requestWhenInUseAuthorization()
        }
        print(#function, statusString)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(#function,error.localizedDescription)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
            self.lastLocation = location

        self.geocode()
        print(#function, location)
       
    }

}

