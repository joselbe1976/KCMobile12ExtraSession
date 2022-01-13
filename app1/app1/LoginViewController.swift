//
//  LoginViewController.swift
//  app1
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 13/1/22.
//

import UIKit

class LoginViewController: UIViewController {
    @IBAction func RegistroAction(_ sender: Any) {
        //Registro
        self.present(RegistroViewController(), animated: true) //MOdal
    }
    
    @IBAction func HomeAction(_ sender: Any) {
        //Accedemos a la window del Iphone
        let win = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first
        
        //Cambiamos el controlador
        win?.rootViewController = HomeViewController()
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
