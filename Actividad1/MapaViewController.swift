//
//  MapaViewController.swift
//  Actividad1
//
//  Created by usuario on 1/9/19.
//  Copyright © 2019 grupo salinas. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let latitude: CLLocationDegrees = 19.4336523
        let longitude: CLLocationDegrees = -99.1454316
        let latDelta: CLLocationDegrees = 0.9
        let lonDelta: CLLocationDegrees = 0.9
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: coordinates, span: span)
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        
        annotation.title = "Ciudad de México"
        
        annotation.subtitle = "Me encuentro aqui."
        
        annotation.coordinate = coordinates
        
        map.addAnnotation(annotation)
        
        map.selectAnnotation(annotation, animated: true)
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
