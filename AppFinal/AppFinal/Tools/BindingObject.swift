//
//  BindingObject.swift
//  AppFinal
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 13/1/22.
//

import Foundation

//Usando Genericos....
class BindingObject<T> {
    typealias Binding = (T) -> Void
    
    var value : T
    private var binder: Binding? //la funcion aqui...
    
    init(_ value: T){
        self.value = value
    }
    
    func setValue(value:T){
        self.value = value
        
        if let funcion = binder {
            funcion(value)
        }
    }
    
    func bind(_ binder:  @escaping Binding) {
        self.binder = binder
        binder(value)
    }
    
}
