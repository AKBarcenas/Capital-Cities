//
//  Capital.swift
//  Capital Cities
//
//  Created by Alex on 6/27/16.
//  Copyright © 2016 Alex Barcenas. All rights reserved.
//

import MapKit
import UIKit

class Capital: NSObject, MKAnnotation {
    // The title of the captial annotation
    var title: String?
    // The coordinate of the capital annotation
    var coordinate: CLLocationCoordinate2D
    // The information about the capital annotation
    var info: String
    
    /*
     * Function Name: init
     * Parameters: title - the title of the capital.
     *   coordinate - the coordinate associated with the capital.
     *   info - the information about the capital.
     * Purpose: This method creates a new capital and initializes all of its properties.
     * Return Value: None
     */
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
}
