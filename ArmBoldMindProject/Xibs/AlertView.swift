//
//  AlertView.swift
//  ArmBoldMindProject
//
//  Created by Armen Sahakyan on 3/8/20.
//  Copyright © 2020 ArmBoldMind Team. All rights reserved.
//

import UIKit

class AlertView: UIView {
    
    static let instance = AlertView()
    
    @IBOutlet weak var alertButtonOne: UIButton!
    @IBOutlet weak var alertButtonTwo: UIButton!
    @IBOutlet weak var buttonsView: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("AlertView", owner: self, options: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
       super.awakeFromNib()
       //custom logic goes here
    }
    private func viewInit() {
        superview?.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        superview?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    enum AlertTipe {
        case photoButton
        case genderButton
    }
    
    func showAlert(alertTipe: AlertTipe) {
        switch alertTipe {
        case .photoButton:
            alertButtonOne.titleLabel?.text = "Change picture"
            alertButtonTwo.titleLabel?.text = "Delete picture"
        case .genderButton:
            alertButtonOne.titleLabel?.text = "Male"
            alertButtonTwo.titleLabel?.text = "Female"
        }
        let keyWindow = UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
        .filter({$0.isKeyWindow}).first
        
        keyWindow?.addSubview(parentFocusEnvironment as! UIView)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
