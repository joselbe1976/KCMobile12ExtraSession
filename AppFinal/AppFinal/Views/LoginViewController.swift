//
//  LoginViewController.swift
//  AppFinal
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 13/1/22.
//

import UIKit

class LoginViewController: UIViewController {

    var rootVM : RootViewModel?
    
    
    init(vm:RootViewModel){
        super.init(nibName: nil, bundle: nil)
        self.rootVM = vm
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBAction func LoginButton(_ sender: Any) {
        rootVM?.viewActive = .Home
    }
    
    
    @IBAction func RegistroButton(_ sender: Any) {
        rootVM?.viewActive = .Register
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
