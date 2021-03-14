//
//  HomeViewController.swift
//  Parkey
//
//  Created by Azka Ghaffar on 3/2/21.
//  Copyright © 2021 iona. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class HomeViewController: UIViewController {
    
    @IBOutlet weak var AccountIcon: UIImageView!
    //@IBOutlet weak var label: UILabel!
    @IBAction func ParkOut(_ sender: UIButton) {
        //RequestHandler.addParkingSpot(latitude: 37.7911551, longitude: -122.3966103, date: getCurrentTimeStampWOMiliseconds(dateToConvert: NSDate()))
    }
    //@IBOutlet weak var accountLabel: UIImageView!
    //@IBOutlet weak var mic: UIImageView!
    //@IBOutlet weak var logo: UIImageView!
    //@IBOutlet weak var ParKey: UIImageView!
    //@IBOutlet weak var bottomLabel: UILabel!
    @IBAction func ParkIn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "park-vc") as! ParkViewController
        present(vc, animated: true)
    }
    @IBAction func ToAccountPage(_ sender: Any) {
        performSegue(withIdentifier: "AccountSegue", sender: self)
    }
    @IBOutlet weak var MapView: MKMapView!
    let locationManager = CLLocationManager()
    let regionInMeters: Double = 1000
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        CheckLocationServices()
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    

    func CheckLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        }else{
        
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            //MapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
            break
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .authorizedAlways:
            break
        }
    }
}

extension HomeViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        _ = MKCoordinateRegion.init(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        //MapView.setRegion(region, animated: true)
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        checkLocationAuthorization()
    }
    func getCurrentTimeStampWOMiliseconds(dateToConvert: NSDate) -> String {
        let objDateformat: DateFormatter = DateFormatter()
        objDateformat.dateFormat = "yyyy-MM-dd"
        let strTime: String = objDateformat.string(from: dateToConvert as Date)
        let objUTCDate: NSDate = objDateformat.date(from: strTime)! as NSDate
        let milliseconds: Int64 = Int64(objUTCDate.timeIntervalSince1970)
        let strTimeStamp: String = "\(milliseconds)"
        return strTimeStamp
    }
}



