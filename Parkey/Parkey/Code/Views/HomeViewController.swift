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
    var mic = false
    
    @IBOutlet weak var ParkIn: UIButton!
    
    @IBOutlet weak var MicButton: UIButton!
    
    @IBOutlet weak var ParkOut: UIButton!
    
    @IBOutlet weak var RankingNum: UILabel!
    
    @IBOutlet weak var MicHelp: UILabel!
    
    
    
    @IBOutlet weak var AccountIcon: UIImageView!
    //@IBOutlet weak var label: UILabel!
    @IBAction func ParkOut(_ sender: UIButton) {
        parkout = true
        performSegue(withIdentifier: "toMapView", sender: self)
    }
    //@IBOutlet weak var accountLabel: UIImageView!
    @IBAction func micPressed(_ sender: UIButton) {
        mic = true
        performSegue(withIdentifier: "toMapView", sender: self)
    }
    
    
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
        ParkIn.titleLabel?.numberOfLines = 2
        ParkIn.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        ParkOut.titleLabel?.numberOfLines = 2
        ParkOut.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        let boldText1 = "near.."
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 30)]
        let attributedString = NSMutableAttributedString(string:boldText1, attributes:attrs)
        let normalText1 = "I am parking in "
        let normalString = NSMutableAttributedString(string:normalText1)
        let boldText2 = "from.."
        let normalText2 = "\nI am parking out "
        let attributedString2 = NSMutableAttributedString(string:boldText2, attributes: attrs)
        let normalString2 = NSMutableAttributedString(string: normalText2)
        
        normalString.append(attributedString)
        normalString.append(normalString2)
        normalString.append(attributedString2)
        MicHelp.attributedText = normalString
        
        RankingNum.isHidden = true
        if (UserDefaults.standard.bool(forKey: "RankSet")) {
            RankingNum.text = "Rank - #\(UserDefaults.standard.integer(forKey: "Rank"))"
            RankingNum.isHidden = false
        }
        
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
            ParkViewController.micUsed = mic
        }
    }
}



