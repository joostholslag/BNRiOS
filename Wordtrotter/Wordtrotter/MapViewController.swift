import UIKit
import MapKit
//import CoreLocation

// CHANGED: Added references to MKMapViewDelegate and CLLocationManagerDelegate
class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    // Create a locationManager
    var locationManager: CLLocationManager!
    // Create an outlet to the mapView on the storyboard
    @IBOutlet weak var mapView: MKMapView!
    // Create an outlet to the button on the storyboard
    @IBOutlet var myCurrentLocation: UIButton!
    
    // Attach an action to the button on the storyboard
    @IBAction func myCurrentLocationButtonPressed(sender: AnyObject) {
        print("Current Location Button Pressed.")
        // So far the button doesn't do anything except print an acknowledgment
    }
    
    // CHANGED: use viewDidLoad instead of loadView
    override func viewDidLoad() {
        //  Always call the super implementation of viewDidLoad
        
        super.viewDidLoad()
        
        print("MapViewController loaded its view.")
        
        // CHANGED:  Set it as a subview of this controller
        view.addSubview(mapView)
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.3)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), forControlEvents: .ValueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        // CHANGED: you add the segmentedController to the mapView and not to the viewController.  This makes it a subview of the mapView subview and not a subview of the viewController.
        mapView.addSubview(segmentedControl)
        
        // CHANGED: the margins are now related to the mapView and not to the viewController
        let margins = mapView.layoutMarginsGuide
        
        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(margins.topAnchor, constant: 2)
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        topConstraint.active = true
        leadingConstraint.active = true
        trailingConstraint.active = true
        
        if (CLLocationManager.locationServicesEnabled()) {
            // set up the locationManager
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
        
    }
    
    func mapTypeChanged(segControl: UISegmentedControl) {
        
        // Using a variable here allows us to show the switch parameters before they execute
        let mapTypeIndex = segControl.selectedSegmentIndex
        
        print("Map Type changed to \(mapTypeIndex)")
        
        switch mapTypeIndex {
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Hybrid
        case 2:
            mapView.mapType = .Satellite
        default:
            break
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("locationManager")
        let location = locations.last
        print("Location Is: \(location)")
        // NOTE: This code sets the initial location to a specific location - by latitude and longitude
        let center = CLLocationCoordinate2DMake(42.0745, -87.6845)  // Bahá'í House of Worship, Wilmette, IL, USA
        // NOTE: This code sets the initial location of the map to the current location.  IMPORTANT: Since the Mac has no built-in GPS, the IOS simulator defaults to a location in California.  When you run it on a real device, the actual location of the device will be used.
        // let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
        self.mapView.setRegion(region, animated: true)
        self.locationManager.stopUpdatingLocation()
    }
}