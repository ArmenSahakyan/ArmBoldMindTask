//
//  customButton.swift
//  ArmBoldMindProject
//
//  Created by Armen Sahakayn on 3/8/20.
//  Copyright © 2020 ArmBoldMind Team. All rights reserved.
//

import UIKit

 class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      //  setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    var nibName = "CustomBtn"

      @IBOutlet weak var btnImageView: UIImageView!
      @IBOutlet weak var btnLabel: UILabel!
    

      @IBInspectable var image: UIImage? {
          get {
              return btnImageView.image
          } set(image) {
              btnImageView.image = image
          }
      }

      @IBInspectable var label: String? {
          get {
              return btnLabel.text
          } set(label) {
              btnLabel.text = label
          }
      }

      func setup() {
          let view = loadViewFromNib()
          view.frame = self.bounds
          view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
          btnImageView.layer.cornerRadius = 60/2
          btnImageView.layer.borderColor = UIColor(red: 5/255,green: 66/255, blue: 38/255, alpha: 1).cgColor
          btnImageView.layer.borderWidth = 2
          btnLabel.font = UIFont.boldSystemFont(ofSize: 14.0)
          btnImageView.isUserInteractionEnabled = true
          btnLabel.isUserInteractionEnabled = true
          view.isUserInteractionEnabled = true
          addSubview(view)
      }

      func loadViewFromNib() -> UIButton {
        let bundle = Bundle(for: type(of: self))
          let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIButton
          return view
      }

}
