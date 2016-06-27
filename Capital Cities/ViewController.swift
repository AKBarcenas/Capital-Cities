//
//  ViewController.swift
//  Capital Cities
//
//  Created by Alex on 6/27/16.
//  Copyright © 2016 Alex Barcenas. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    // The map view that will display the map.
    @IBOutlet weak var mapView: MKMapView!
    
    /*
     * Function Name: viewDidLoad
     * Parameters: None
     * Purpose: This method creates annotations for some capital cities and places them onto a map.
     * Return Value: None
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapView.delegate = self
        
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics.")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light.")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.")
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.")
        
        mapView.addAnnotations([london, oslo, paris, rome, washington])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
     * Function Name: mapView
     * Parameters: mapView - the map view that called this method.
     *   viewForAnnotation - the annotation that will be displayed on the map.
     * Purpose: This method checks the type of annotation that is being displayed. For capital
     *   annotations it ether tries to reuse another unused annotation view or create a new one.
     * Return Value: MKAnnotationView!
     */
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        // 1
        let identifier = "Capital"
        
        // 2
        if annotation is Capital {
            // 3
            var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
            
            if annotationView == nil {
                //4
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView!.canShowCallout = true
                
                // 5
                let btn = UIButton(type: .DetailDisclosure)
                annotationView!.rightCalloutAccessoryView = btn
            } else {
                // 6
                annotationView!.annotation = annotation
            }
            
            return annotationView
        }
        
        // 7
        return nil
    }
    
    /*
     * Function Name: mapView
     * Parameters: mapView - the map view that called this method.
     *   view - the annotation that had its button tapped.
     *   control - the control that was tapped in the view.
     * Purpose: This method displays an alert controller with the title of the capital and some
     *   information about the capital.
     * Return Value: None
     */
    
    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {
        let capital = view.annotation as! Capital
        let placeName = capital.title
        let placeInfo = capital.info
        
        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(ac, animated: true, completion: nil)
    }
}

