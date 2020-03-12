//
//  Theming.swift
//  ArmBoldMindProject
//
//  Created by Armen Sahakyan on 3/7/20.
//  Copyright © 2020 ArmBoldMind Team. All rights reserved.
//

import UIKit

struct Theme {
    struct Colors {
        static let action = UIColor(red: 250/255, green: 200/255, blue: 15/255, alpha: 1)
        static let attention = UIColor(red: 0, green: 122/255, blue: 1, alpha: 1)
        static let information = UIColor.black
        static let informationLight = UIColor(red: 80/255, green: 80/255, blue: 80/255, alpha: 1)
        static let simple = UIColor.white
        static let description = UIColor(red: 120/255, green: 120/255, blue: 120/255, alpha: 1)
        static let window = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        static let shadow = UIColor.black
        static let shadowAction = UIColor(red: 248/255, green: 215/255, blue: 22/255, alpha: 1)
        static let shadowAttention = UIColor(red: 0, green: 122/255, blue: 1, alpha: 1)
        static let greenButtonColor =  UIColor(netHex:0x2FA763)
    }
    struct Sizes {
        static let button = CGSize.init(width: 44, height: 44)
        static let step = CGSize.init(width: 20, height: 20)
        static let shadow = CGSize.init(width: 0, height: 3)
        static let shadowBig = CGSize.init(width: 0, height: 0)
    }
    struct Radiuses {
        static let window: CGFloat = 4
        static let button: CGFloat = 14
        static let buttonBig: CGFloat = 60
        static let shadow: CGFloat = 3
        static let shadowBig: CGFloat = 30
    }
}

func itemsStyle(view: UIView, shadow: Bool = true, radius: Bool = true, border: Bool = false, big: Bool = false, shadowColor: UIColor = Theme.Colors.shadow, useShadowPath: Bool = true){
    if border {
        view.layer.borderWidth = 1
        view.layer.borderColor = Theme.Colors.window.cgColor
    } else {
        view.layer.borderWidth = 0
    }
    if radius {
        view.layer.cornerRadius = Theme.Radiuses.button
    } else {
        view.layer.cornerRadius = 0
    }
    if shadow {
        view.layer.shadowColor = shadowColor.cgColor
        view.layer.shadowOffset = Theme.Sizes.shadow
        view.layer.shadowRadius = big ? Theme.Radiuses.shadowBig : Theme.Radiuses.shadow
        view.layer.shadowOpacity = big ? 0.8 : 0.2
        if useShadowPath {
            let shadowPath = UIBezierPath(roundedRect: view.bounds, cornerRadius: view.layer.cornerRadius)
            view.layer.shadowPath = shadowPath.cgPath
        }
    } else {
        view.layer.shadowRadius = 0
        view.layer.shadowOpacity = 0
    }
    //view.layer.masksToBounds = true
}
