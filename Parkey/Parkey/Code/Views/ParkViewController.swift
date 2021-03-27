//
//  ViewController.swift
//  ParkIn
//
//  Created by Azka Ghaffar on 2/23/21.
//

import UIKit
import Mapbox
import MapboxCoreNavigation
import MapboxNavigation
import MapboxDirections

class ParkViewController: UIViewController, MGLMapViewDelegate {
    var mapView: NavigationMapView!
    var routeOptions: NavigationRouteOptions?
    var route: Route?

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView = NavigationMapView(frame: view.bounds)
<<<<<<< Updated upstream

=======
        mapView.frame = view.bounds
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.showsUserLocation = true
         
        //mapView.setCenter(mapboxSFOfficeCoordinate, zoomLevel: 15, animated: false)
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
        view.addSubview(mapView)

        // Set the map view's delegate
        mapView.delegate = self

        // Allow the map to display the user's location
        mapView.showsUserLocation = true
        mapView.setUserTrackingMode(.follow, animated: true, completionHandler: nil)

        // Add a gesture recognizer to the map view
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(didLongPress(_:)))
        mapView.addGestureRecognizer(longPress)
    }

    @objc func didLongPress(_ sender: UILongPressGestureRecognizer) {
        guard sender.state == .began else { return }

        // Converts point where user did a long press to map coordinates
        let point = sender.location(in: mapView)
        let coordinate = mapView.convert(point, toCoordinateFrom: mapView)

        if let origin = mapView.userLocation?.coordinate {
            // Calculate the route from the user's location to the set destination
            calculateRoute(from: origin, to: coordinate)
        } else {
            print("Failed to get user location, make sure to allow location access for this application.")
        }
    }

    // Calculate route to be used for navigation
    func calculateRoute(from origin: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D) {
        // Coordinate accuracy is how close the route must come to the waypoint in order to be considered viable. It is measured in meters. A negative value indicates that the route is viable regardless of how far the route is from the waypoint.
        let origin = Waypoint(coordinate: origin, coordinateAccuracy: -1, name: "Start")
        let destination = Waypoint(coordinate: destination, coordinateAccuracy: -1, name: "Finish")

        // Specify that the route is intended for automobiles avoiding traffic
        let routeOptions = NavigationRouteOptions(waypoints: [origin, destination], profileIdentifier: .automobileAvoidingTraffic)

        // Generate the route object and draw it on the map
        Directions.shared.calculate(routeOptions) { [weak self] (session, result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let response):
                guard let route = response.routes?.first, let strongSelf = self else {
                    return
                }
                
                strongSelf.route = route
                strongSelf.routeOptions = routeOptions
                
                // Draw the route on the map after creating it
                strongSelf.drawRoute(route: route)
                
                // Show destination waypoint on the map
                strongSelf.mapView.showWaypoints(on: route)
                
                // Display callout view on destination annotation
                if let annotation = strongSelf.mapView.annotations?.first as? MGLPointAnnotation {
                    annotation.title = "Start navigation"
                    strongSelf.mapView.selectAnnotation(annotation, animated: true, completionHandler: {
                        let array = RequestHandler.getParkingSpots()
                        //iterate through spots and see if there is one with similar coordinates
                        if array.count != 0{
                            var spotFound = false
                            //iterate through Spots and see if there is somethign with coordinates close to it
                            for item:ParkingSpot in array{
                                if spotFound{
                                    break
                                }
                                if (item.longitude > (Float(annotation.coordinate.longitude) - 0.0005)) && (item.longitude < (Float(annotation.coordinate.longitude) + 0.0005)){
                                    //then check latitude
                                    if (item.latitude > (Float(annotation.coordinate.latitude) - 0.0005)) && (item.latitude < (Float(annotation.coordinate.latitude) + 0.0005)){
                                        //then delete the parking spot
                                        RequestHandler.removeParkingSpot(latitude: item.latitude, longitude: item.longitude)
                                        spotFound = true
                                    }
                                }
                            }
                        }
                    })
                }
            }
        }
<<<<<<< Updated upstream
=======
        let userLocation = mapView.userLocation?.coordinate

        //check to see if the user is Parking in or Parking out
        if ParkOut {
            //store the latitude and longitude of the users location
            RequestHandler.addParkingSpot(latitude: Float(userLocation!.latitude), longitude: Float(userLocation!.longitude), date: ParkViewController.getCurrentTimeStampWOMiliseconds(dateToConvert: NSDate()))
        }
>>>>>>> Stashed changes
    }

    func drawRoute(route: Route) {
        guard let routeShape = route.shape, routeShape.coordinates.count > 0 else { return }
        // Convert the route’s coordinates into a polyline
        var routeCoordinates = routeShape.coordinates
        let polyline = MGLPolylineFeature(coordinates: &routeCoordinates, count: UInt(routeCoordinates.count))

        // If there's already a route line on the map, reset its shape to the new route
        if let source = mapView.style?.source(withIdentifier: "route-source") as? MGLShapeSource {
            source.shape = polyline
        } else {
            let source = MGLShapeSource(identifier: "route-source", features: [polyline], options: nil)

            // Customize the route line color and width
            let lineStyle = MGLLineStyleLayer(identifier: "route-style", source: source)
            lineStyle.lineColor = NSExpression(forConstantValue: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
            lineStyle.lineWidth = NSExpression(forConstantValue: 3)

            // Add the source and style layer of the route line to the map
            mapView.style?.addSource(source)
            mapView.style?.addLayer(lineStyle)
        }
    }

    // Implement the delegate method that allows annotations to show callouts when tapped
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true
    }

    // Present the navigation view controller when the callout is selected
    func mapView(_ mapView: MGLMapView, tapOnCalloutFor annotation: MGLAnnotation) {
        guard let route = route, let routeOptions = routeOptions else {
            return
        }
        let navigationViewController = NavigationViewController(for: route, routeIndex: 0, routeOptions: routeOptions)
        navigationViewController.modalPresentationStyle = .fullScreen
        self.present(navigationViewController, animated: true, completion: nil)
    }

    func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
        
        //make request handler call
<<<<<<< Updated upstream
        let array = RequestHandler.getPlaces()
        
        //iterate through the items
        for item in array{
            let annotation = MGLPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2DMake(CLLocationDegrees(item.coordinates[0]), CLLocationDegrees(item.coordinates[1]))
            annotation.title=item.name
            annotation.subtitle="Cost: \(item.cost)"
            mapView.addAnnotation(annotation)
        }
       /* // Create point to represent where the symbol should be placed
        let annotation = MGLPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2DMake(40.749193, -73.987456)
        annotation.title="Pats Pizzeria"
        annotation.subtitle="The best Pizza in NYC"
        mapView.addAnnotation(annotation)*/
    }
}
=======
        let array = RequestHandler.getParkingSpots()
            //iterate through the items
        var counter = 1
        for item:ParkingSpot in array{
                let annotation = MGLPointAnnotation()
                annotation.title = "Possible Parking"
                annotation.coordinate = CLLocationCoordinate2DMake(CLLocationDegrees(item.latitude), CLLocationDegrees(item.longitude))
                //create the data source to hold the point data
                let shapeSource = MGLShapeSource(identifier: "marker-source\(counter)", shape: annotation, options: nil)
                
                //create a style layer for the symbol
                let shapeLayer = MGLSymbolStyleLayer(identifier: "marker-style\(counter)", source: shapeSource)
                //addImage
                if let image = UIImage(named: "circle.png"){
                    //let image2=image.resizableImage(withCapInsets: UIEdgeInsets(top: CGFloat(100.0), left: CGFloat(100.0), bottom: CGFloat(100.0), right: 100.0))
                    style.setImage(image, forName: "circle-symbol")
                }
                shapeLayer.iconImageName = NSExpression(forConstantValue: "circle-symbol")
                shapeLayer.iconOpacity = NSExpression(forConstantValue: 0.3)
                style.addSource(shapeSource)
                style.addLayer(shapeLayer)
                counter += 1
            }
    }
    
    static func getCurrentTimeStampWOMiliseconds(dateToConvert: NSDate) -> String {
        let objDateformat: DateFormatter = DateFormatter()
        objDateformat.dateFormat = "yyyy-MM-dd"
        let strTime: String = objDateformat.string(from: dateToConvert as Date)
        let objUTCDate: NSDate = objDateformat.date(from: strTime)! as NSDate
        let milliseconds: Int64 = Int64(objUTCDate.timeIntervalSince1970)
        let strTimeStamp: String = "\(milliseconds)"
        return strTimeStamp
    }
}
extension ParkViewController: SearchControllerDelegate {
    func categorySearchResultsReceived(results: [SearchResult]) {
    let annotations = results.map { searchResult -> MGLPointAnnotation in
    let annotation = MGLPointAnnotation()
    annotation.coordinate = searchResult.coordinate
    annotation.title = searchResult.name
    annotation.subtitle = searchResult.address?.formattedAddress(style: .medium)
    return annotation
    }
     
    showAnnotation(annotations, isPOI: false)
    }
     
    func searchResultSelected(_ searchResult: SearchResult) {
    let annotation = MGLPointAnnotation()
    annotation.coordinate = searchResult.coordinate
    annotation.title = searchResult.name
    annotation.subtitle = searchResult.address?.formattedAddress(style: .medium)
     
    showAnnotation([annotation], isPOI: searchResult.type == .POI)
    }
     
    func userFavoriteSelected(_ userFavorite: FavoriteRecord) {
    let annotation = MGLPointAnnotation()
    annotation.coordinate = userFavorite.coordinate
    annotation.title = userFavorite.name
    annotation.subtitle = userFavorite.address?.formattedAddress(style: .medium)
     
    showAnnotation([annotation], isPOI: true)
    }

    }
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
