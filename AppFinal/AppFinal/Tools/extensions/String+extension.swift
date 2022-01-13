//
//  String+extension.swift
//  AppFinal
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 13/1/22.
//

import Foundation

extension String {
    func toDouble() -> Double {
        let nsString = self as NSString
        return nsString.doubleValue
    }
}
