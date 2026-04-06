//
//  StoreLocationsViewController.swift
//  RewardsApp
//
//  Created by Daniel Perusse on 2026-04-06.
//
//  Principal Author: Daniel Perusse
//  Description: Shows store locations using MapKit
import UIKit
import MapKit

class StoreLocationsViewController: UIViewController, MKMapViewDelegate {
    
    //outlets for user interaction
    @IBOutlet weak var mapViewLocations: MKMapView!
    @IBOutlet weak var btnViewStoreDetails: UIButton!
    
    //custom annotation to tell which store we picked by index
    class MKPointAnnotationID: MKPointAnnotation {
        var index: Int!
    }
    
    //store array
    var stores: [Store] = []
    
    //represents selected annotation
    var selectedID: Int = -1
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set view nav title
        title = "Store Locations"
        
        //needed for annotation selection to work
        mapViewLocations.delegate = self
        
        //prevent viewing details screen before selection annotation
        btnViewStoreDetails.isEnabled = false
        
        //get list of all stores + data
        stores = StoreRepository.getStores()
        
        //call our map functions on load
        setStartLocation()
        setLocations()
    }
    
    //sets default map view location
    private func setStartLocation() {
        //coordinates for city of Barrie, Ontario, Canada
        let initialLocation = CLLocationCoordinate2D(latitude: 44.382355, longitude: -79.688802)
        //this determines initial map zoom and location
        let region = MKCoordinateRegion(center: initialLocation, latitudinalMeters: 5000, longitudinalMeters: 5000)
        mapViewLocations.setRegion(region, animated: true)
    }
    
    //set all location pins for map
    private func setLocations() {
        
        //loop through each location and set it up
        for i in stores.indices {
            let annotation = MKPointAnnotationID()
            annotation.coordinate = CLLocationCoordinate2D(latitude: stores[i].latitude, longitude: stores[i].longitude)
            
            //shows store name on map
            annotation.title = stores[i].name
            
            //set location index for reference
            annotation.index = i
            
            //add the pin to our map
            mapViewLocations.addAnnotation(annotation)
        }
    }
    
    //this will run whenever we press a map notation
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = view.annotation as? MKPointAnnotationID {
            
            //get the id of the currently selected annotation and enable button
            selectedID = annotation.index!
            
            btnViewStoreDetails.isEnabled = true

        }
    }
    
    //this sends the user to the details page when pressed and enabled
    @IBAction func btnViewStoreDetailsPressed(_ sender: UIButton) {

        //to go to details screen and send over store data for display
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "StoreDetailViewController") as! StoreDetailViewController
        detailVC.store = stores[selectedID]
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
