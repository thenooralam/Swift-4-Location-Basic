//
//  ViewController.swift
//  Location
//
//  Created by Nooralam Shaikh on 01/10/18.
//  Copyright © 2018 Nooralam Shaikh. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    var userLocation = CLLocationCoordinate2D()
    let annotation = MKPointAnnotation()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setLocationManager()
    }
    
    func setLocationManager() {
        locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }


}
extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            
            annotation.coordinate = center
            self.mapView.addAnnotation(annotation)
            self.mapView.setRegion(region, animated: true)
        }
    }
}

