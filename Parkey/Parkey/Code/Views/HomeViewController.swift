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
    
    var parkout = false
    
    @IBOutlet weak var AccountIcon: UIImageView!
    //@IBOutlet weak var label: UILabel!
    @IBAction func ParkOut(_ sender: UIButton) {
        parkout = true
        performSegue(withIdentifier: "toMapView", sender: self)
    }
    //@IBOutlet weak var accountLabel: UIImageView!
    //@IBOutlet weak var mic: UIImageView!
    //@IBOutlet weak var logo: UIImageView!
    //@IBOutlet weak var ParKey: UIImageView!
    //@IBOutlet weak var bottomLabel: UILabel!
    @IBAction func ParkIn(_ sender: UIButton) {
        //let vc = storyboard?.instantiateViewController(identifier: "park-vc") as! ParkViewController
        performSegue(withIdentifier: "toMapView", sender: self)
        //present(vc, animated: true)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    
        if segue.identifier == "toMapView"{
            let ParkViewController:ParkViewController = segue.destination as! ParkViewController
            ParkViewController.ParkOut = parkout
        }
    }
}



