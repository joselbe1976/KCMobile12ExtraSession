//
//  RootViewModel.swift
//  AppFinal
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 13/1/22.
//

import Foundation


//Estados de pantallas
enum viewStatus {
    case Login
    case Home
    case Register
}


final class RootViewModel {
    
    var rootInteractor : RootInteractorProtocol
    
    init(interactor: RootInteractorProtocol = RootInteractor()){
        self.rootInteractor = interactor
    }
    
    //Pantalla Activa a visualizar
    var viewActive: viewStatus = .Login {
        didSet{
            print("Nuevo valor asignado: \(viewActive)")
    
            if oldValue != viewActive {
                //ha cambiado la vista a mostrar
                self.onViewChange?() //ejecutamos la funcion.
            }
        
        }
        
    }
    
    //funcion que avisa del cambio.....
    var onViewChange: (() ->Void)?
    
    
    var errorMessage = BindingObject("") //mensaje de error para la vista
    
    
    
    
    func login(user:String, pass:String){
        
        self.errorMessage.setValue(value: "Haciendo Login... espere...")
        
        rootInteractor.login(user: user, pass: pass) {
            //Login Success
            self.viewActive = .Home
            self.errorMessage.setValue(value: "Conectado")
        } onError: {
            // Login Error
            print("Error login")
            self.errorMessage.setValue(value: "Error en el login")
        }

    }
    
}
