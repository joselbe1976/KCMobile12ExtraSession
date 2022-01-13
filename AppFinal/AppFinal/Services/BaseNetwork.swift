//
//  BaseNetwork.swift
//  AppFinal
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 13/1/22.
//

import Foundation

let server = "https://vapor2022.herokuapp.com"

struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    static let content = "application/json"
}

enum endpoints: String {
    case login = "/api/auth/login"
    case heroLocations = "/api/heros/locations"
}

struct BaseNetwork {
    //Session del Login
    func getSessionLogin(user:String, password:String) -> URLRequest {
            
        let urlCad : String = "\(server)\(endpoints.login.rawValue)"
        let encodeCredentials = "\(user):\(password)".data(using: .utf8)?.base64EncodedString() //base64 del usuairo:clave
        var segCredentials : String = ""
        if let credentials = encodeCredentials {
            segCredentials = "Basic \(credentials)"
        }
        
        //Creamos el request
        var request : URLRequest = URLRequest(url: URL(string: urlCad)!) //la URL
        request.httpMethod = HTTPMethods.post
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type") //Header
        request.addValue(segCredentials, forHTTPHeaderField: "Authorization")
        return request
    }
    
    //Session localizaciones capitan america
    func getSessionHeroLocations(idHero:String) -> URLRequest {
        let urlCad : String = "\(server)\(endpoints.heroLocations.rawValue)"
        
        //Creamos el request
        var request : URLRequest = URLRequest(url: URL(string: urlCad)!) //la URL
        request.httpMethod = HTTPMethods.post
        request.httpBody = try? JSONEncoder().encode(HeroLocationsRequest(id: idHero)) //JSon en el Body de la llamada
        
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type") //Header
        
        //buscamos el Toen JWT
        let defaults = UserDefaults.standard
        let token = defaults.string(forKey: "TOKEN-JWT")
        
        if let tokenJWT = token {
            request.addValue("Bearer \(tokenJWT)", forHTTPHeaderField: "Authorization")
        }
        return request
    }
    
}


