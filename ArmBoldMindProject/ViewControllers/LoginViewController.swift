//
//  LoginViewController.swift
//  ArmBoldMindProject
//
//  Created by Armen Sahakyan on 3/7/20.
//  Copyright © 2020 ArmBoldMind Team. All rights reserved.
//

import UIKit
import Alamofire

protocol LoginProtocol {
    func loginSuccess()
    func autorizationSuccess(success:Int)
}

class LoginViewController: UIViewController, LoginProtocol {

    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    let afManager:AlamofireManager = AlamofireManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AlamofireManager.sharedInstace = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.configViews()
    }
    
    func configViews() {
        self.view.setupBackground()
        itemsStyle(view: phoneView, shadow: true)
        itemsStyle(view: passwordView, shadow: true)
        itemsStyle(view: signInButton, shadow:false)
        UITextField.appearance().tintColor = .white
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.8)])
    }

    @IBAction func signInButtonTap(_ sender: Any) {
        signInButton.isUserInteractionEnabled = false
        let password    = passwordTextField.text ?? ""
        let phoneNumber = "+374" + (phoneTextField.text ?? "")
        let parametersDict : [String : Any] = ["password": password,"phoneNumber": phoneNumber]
        
       // let parametersDict : [String : Any] = ["password": "asdasd","phoneNumber":"+37495807672"]
        
        afManager.loginRequest(url: loginAddress,parameters: parametersDict)
    }
    func loginSuccess() {
        signInButton.isUserInteractionEnabled = true
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        signInButton.isUserInteractionEnabled = true
    }
    func autorizationSuccess(success:Int) {
        if success == 1 {
            self.performSegue(withIdentifier: "showHomeVC", sender: self)

        }else{
            passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        }
        signInButton.isUserInteractionEnabled = true
    }
    
}
