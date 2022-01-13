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
    
    
    func LoadEmpleados(){
        
    }
    
}
