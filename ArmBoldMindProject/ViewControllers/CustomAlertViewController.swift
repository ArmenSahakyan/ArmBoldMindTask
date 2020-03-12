//
//  CustomAlertViewController.swift
//  ArmBoldMindProject
//
//  Created by Armen Sahakyan on 3/11/20.
//  Copyright © 2020 ArmBoldMind Team. All rights reserved.
//

import UIKit

protocol CustomAlertProtocol {
    func AlertButtonsTap(methodType:String)
}

class CustomAlertViewController: UIViewController {
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var alertOneButton: UIButton!
    @IBOutlet weak var alertTwoButton: UIButton!
    static var sharedInstace : CustomAlertProtocol?

    var titles:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let Tap = UITapGestureRecognizer(target: self, action: #selector(viewTap))
        self.view.addGestureRecognizer(Tap)
        alertView.layer.cornerRadius = 10
        alertView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        alertOneButton.setTitle(titles[0],for: .normal)
        alertTwoButton.setTitle(titles[1],for: .normal)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func alertOneButtonTap(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
        CustomAlertViewController.sharedInstace?.AlertButtonsTap(methodType: alertOneButton.currentTitle!)
    }
    @IBAction func alertTwoButtonTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        CustomAlertViewController.sharedInstace?.AlertButtonsTap(methodType: alertTwoButton.currentTitle!)
    }
    @objc func viewTap() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
