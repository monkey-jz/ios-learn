//
//  Place.swift
//  LocationDemo
//
//  Created by boyaa on 2022/9/22.
//

import UIKit
import MapKit

class Place: NSObject,MKAnnotation {
    let title: String?
    let subtitle: String?
    var coordinate: CLLocationCoordinate2D
    init(title: String,subtitle: String,coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }

}
