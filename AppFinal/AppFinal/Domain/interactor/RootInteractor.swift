//
//  RootInteractor.swift
//  AppFinal
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 13/1/22.
//

import Foundation

enum StatusLogin {
     case Sucesss
     case Error
}


//protocolo

protocol RootInteractorProtocol: AnyObject {
    func login(user:String, pass:String, onSuccess: @escaping successClosure, onError: errorClosure )
}

//interactor que hace el login de Verdad
final class RootInteractor: RootInteractorProtocol {
    func login(user: String, pass: String, onSuccess: @escaping successClosure, onError: errorClosure) {
        NetworkLoginRest().login(user: user, pass: pass) { tokenJWT in
            //Success
            DispatchQueue.main.async {
                //grabar el token en user Default
                let defaults = UserDefaults.standard
                defaults.set(tokenJWT, forKey: "TOKEN-JWT")
                
                onSuccess()
            }
        
        } onError: {
            DispatchQueue.main.async {
                //hilo principal
                onError!()
            }
            
        }

        
        
        
    }
}

//para Testing
final class RootInteractorTesting: RootInteractorProtocol {
    func login(user: String, pass: String, onSuccess: @escaping successClosure, onError: errorClosure) {
        onSuccess()
    }
    
    
}
