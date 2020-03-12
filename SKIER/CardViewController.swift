//
//  CardViewController.swift
//  CardViewAnimation
//
//  Created by Brian Advent on 26.10.18.
//  Copyright © 2018 Brian Advent. All rights reserved.
//

import UIKit
import CoreLocation
class CardViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var AltMax: UILabel!
    let locationManager = CLLocationManager()
    @IBOutlet weak var AltAVG: UILabel!
    @IBOutlet weak var handleArea: UIView!
    @IBOutlet weak var AltMin: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //setupCard()
        setupLocationManager()
    }
    func setupLocationManager() {
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
                locationManager.requestWhenInUseAuthorization()
                locationManager.startUpdatingLocation()
            }
    //        CLlocation import end
            //if everything nice we print into console
    var minAlt = 99999999999;
    var maxAlt = -1;
            func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
                if let location = locations.last {
                    if location.horizontalAccuracy > 0 {
                        locationManager.stopUpdatingLocation()
                        
                        let longitude = location.coordinate.longitude
                        let latitude = location.coordinate.latitude
                        let altitude = location.altitude;
                        print("longitude = \(longitude), latitude = \(latitude), altitude = \(altitude)")
                        if(minAlt > Int(location.altitude)){
                            minAlt = Int(location.altitude)
                            AltMin.text = "Min: \(minAlt)"
                        }
                        if(maxAlt < Int(location.altitude)){
                            maxAlt = Int(location.altitude)
                            AltMax.text = "Max: \(maxAlt)"
                        }
                        
                    }
                }
            }
}
