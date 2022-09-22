//
//  ViewController.swift
//  LocationDemo
//
//  Created by boyaa on 2022/9/21.
//

import UIKit

import CoreLocation
import MapKit

class ViewController: UIViewController,CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    private var previousPoint: CLLocation?
    private var totalMovementDistance = CLLocationDistance(0)
    
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var horizontalAccuracyLabel: UILabel!
    @IBOutlet weak var altideLabel: UILabel!
    @IBOutlet weak var verticalAccuracyLabel: UILabel!
    @IBOutlet weak var distanceTraveledLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print("locationManagerDidChangeAuthorization ===")
        
        switch manager.authorizationStatus {
        case CLAuthorizationStatus.authorizedAlways,CLAuthorizationStatus.authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
            break
       default:
            locationManager.stopUpdatingLocation()
            mapView.showsUserLocation = false
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations =====")
        if let newLocation = locations.last {
            let latitudeString = String(format: "%g\u{00B0}", newLocation.coordinate.latitude)
            latitudeLabel.text = latitudeString
            
            let longitudeString = String(format: "%g\u{00B0}", newLocation.coordinate.longitude)
            longitudeLabel.text = longitudeString
            
            let horizontalAccuracyString = String(format: "%gm", newLocation.horizontalAccuracy)
            horizontalAccuracyLabel.text = horizontalAccuracyString
            
            let altitudeString = String(format: "%gm", newLocation.altitude)
            altideLabel.text = altitudeString
            
            let verticalAccuracyString = String(format: "%gm", newLocation.verticalAccuracy)
            verticalAccuracyLabel.text = verticalAccuracyString
            
            if newLocation.horizontalAccuracy < 0 {
                return
            }
            
            if newLocation.horizontalAccuracy > 100 {
                return
            }
            
            if previousPoint == nil {
                totalMovementDistance = 0
                let start = Place(title: "Start Point", subtitle: "This is where we started", coordinate: newLocation.coordinate)
                mapView.addAnnotation(start)
                let region = MKCoordinateRegion(center: newLocation.coordinate, latitudinalMeters: 100, longitudinalMeters: 100)
                mapView.setRegion(region, animated: true)
            }else {
                totalMovementDistance += newLocation.distance(from: previousPoint!)
            }
            previousPoint = newLocation
            let distanceString = String(format: "%gm", totalMovementDistance)
            distanceTraveledLabel.text = distanceString
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        print(error.localizedDescription)
    }
    
    
  


}

