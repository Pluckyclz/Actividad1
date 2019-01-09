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
    
    @IBOutlet weak var tiempoEstimadoLlegada: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        map.delegate = self
        
        //MARK: Dibujar Mapa
        
        let latitude: CLLocationDegrees = 19.4336523
        let longitude: CLLocationDegrees = -99.1454316
        let latDelta: CLLocationDegrees = 0.5
        let lonDelta: CLLocationDegrees = 0.5
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
        
        // 19.3948,-99.1736
        let coordinates2 = CLLocationCoordinate2D(latitude:19.3948, longitude:-99.1736)
        
        // MARK: Ruta
        
        let sourcePlacemark = MKPlacemark.init(coordinate: coordinates)
        let sourceMapItem = MKMapItem.init(placemark: sourcePlacemark)
        
        let destinationPlacemark = MKPlacemark.init(coordinate: coordinates2)
        let destinationMapItem = MKMapItem.init(placemark: destinationPlacemark)
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .automobile
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate {
            (response, error) -> Void in
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                return
            }
            let route = response.routes[0]
            self.map.addOverlay(route.polyline, level: .aboveRoads)
            let rect = route.polyline.boundingMapRect
            self.map.setRegion(MKCoordinateRegion(rect), animated: true)
            let valorTruncado = (route.expectedTravelTime/60).truncate(places: 2)
            self.tiempoEstimadoLlegada.text = "Tiempo estimado de llegada: \(valorTruncado) minutos"
            print(destinationPlacemark.location)
            print(destinationPlacemark.countryCode)
            print(destinationPlacemark.title)
            print(destinationPlacemark.areasOfInterest)
            
        }
        
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


extension MapaViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.orange
        renderer.lineDashPattern = [2,4];
        renderer.lineWidth = 4.0
        renderer.alpha = 1
        return renderer
    }
}

extension Double
{
    func truncate(places : Int)-> Double
    {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}
