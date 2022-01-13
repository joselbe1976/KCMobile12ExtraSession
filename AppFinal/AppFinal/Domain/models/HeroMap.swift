//
//  HeroMap.swift
//  AppFinal
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 13/1/22.
//

import MapKit

class HeroMap: NSObject, MKAnnotation {
    let name: String?
    let coordinate: CLLocationCoordinate2D
    
    init(name:String, coordinate: CLLocationCoordinate2D){
        self.name = name
        self.coordinate = coordinate
        
        super.init()
    }
}
