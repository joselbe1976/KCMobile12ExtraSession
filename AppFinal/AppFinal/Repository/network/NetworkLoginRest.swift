//
//  NetworkLoginRest.swift
//  AppFinal
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 13/1/22.
//

import Foundation

struct NetworkLoginRest {
    func login(user:String, pass:String, onSuccess: @escaping successClosureString, onError: errorClosure ){
        
        let request = BaseNetwork().getSessionLogin(user: user, password: pass)
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                return
            }
            
            if (httpResponse.statusCode == 200) {
                    //Correcta
                if let token = data {
                    let tokenSend = String(decoding: token, as: UTF8.self)
                    onSuccess(tokenSend)
                } else {
                    onError!() //esto en teoria nunca debe pasar.
                }
            } else{
                 //erronea: 401
                onError!()
            }
            
            
        }.resume()
    }
}
