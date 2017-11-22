//
//  MapView.swift
//  Party
//
//  Created by Danny Nuch on 11/21/17.
//  Copyright © 2017 alan. All rights reserved.
//

import Foundation
import MapKit

class MapView: BaseView {
    
    var mapView: MKMapView!
    var annotation: MKPointAnnotation!
    
    override func setUpViews() {
        mapView = MKMapView(frame: UIScreen.main.bounds)
        annotation = MKPointAnnotation()
        let initialLocation = CLLocation(latitude: 37.3351916, longitude: -121.8832602)
        centerMapOnLocation(location: initialLocation)
        addAnnotation()
    }
    
    let regionRadius: CLLocationDistance = 1200
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    func addAnnotation() {
        annotation.coordinate = CLLocationCoordinate2D(latitude: 37.3351916, longitude: -121.8832602)
        mapView.addAnnotation(annotation)
    }
    
}
