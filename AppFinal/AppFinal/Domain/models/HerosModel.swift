//
//  HerosModel.swift
//  AppFinal
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 13/1/22.
//

import Foundation

//Solicitud de localizaciones de un Hero
struct HeroLocationsRequest: Codable {
    var id: String
}


//Respuesta con los puntos de localizacion
struct HeroLocationsResponse: Codable {
    let id:String
    let longitud:String
    let latitud:String
}
