//
//  MKMapView+extension.swift
//  AppFinal
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 13/1/22.
//

import Foundation
import MapKit

extension MKMapView {
    
    //centrar el Mapa en una localizacion y altura
    func centerToLocation(_ location: CLLocation, regionRadius:CLLocationDistance=500){
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        setRegion(coordinateRegion, animated: true)
    }
    
}
