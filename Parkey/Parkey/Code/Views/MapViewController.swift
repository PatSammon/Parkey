import UIKit
import GoogleMaps
import GooglePlaces
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, GMSAutocompleteViewControllerDelegate
{
    let locationManager = CLLocationManager()
    var mapView: GMSMapView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        //Need to include this along with our own licensing eventually.
        //print(GMSServices.openSourceLicenseInfo())
    }
    
    @IBAction func searchPressed(_ sender: Any)
    {
        let searchController = GMSAutocompleteViewController()
        searchController.delegate = self
        
        let fields = GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue))
        
        searchController.placeFields = fields
        
        let filter = GMSAutocompleteFilter()
        filter.type = .address
        searchController.autocompleteFilter = filter
        
        present(searchController, animated: true, completion: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        guard let location = locations.first else
        {return}
        
        let currentCoordinate = location.coordinate
        let camera = GMSCameraPosition.camera(withLatitude: currentCoordinate.latitude, longitude: currentCoordinate.longitude, zoom: 14.0)
        let mapView = GMSMapView.map(withFrame: CGRect(x:0, y:100, width: view.frame.width, height: view.frame.height/1.5 ), camera: camera)
        //let mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
        mapView.settings.compassButton = true
        mapView.isMyLocationEnabled = true
        self.view.addSubview(mapView)
        
       /* let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: currentCoordinate.latitude, longitude: currentCoordinate.longitude)
        marker.title = "New York"
        marker.snippet = "New York"
        marker.map = mapView*/
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace)
    {
        
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error)
    {
        print("Error: ", error.localizedDescription)
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController)
    {
        dismiss(animated: true, completion: nil)
    }
}
