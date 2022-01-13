//
//  LoginViewController.swift
//  AppFinal
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 13/1/22.
//

import UIKit

class LoginViewController: UIViewController {

    var rootVM : RootViewModel?
    
    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    init(vm:RootViewModel){
        super.init(nibName: nil, bundle: nil)
        self.rootVM = vm
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBAction func LoginButton(_ sender: Any) {
        if let user = user.text,
           let pass = password.text{
        
                rootVM?.login(user: user, pass: pass)
        } else{
            //mensaje al usuario de que rellene
        }
    }
    
    
    @IBAction func RegistroButton(_ sender: Any) {
        rootVM?.viewActive = .Register
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //binding con el error del viewModel
        self.rootVM?.errorMessage.bind({ data in
            self.errorLabel.text = data
        })
        
        
        user.text = "bejl@keepcoding.es"
        password.text = "123456"
        
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
