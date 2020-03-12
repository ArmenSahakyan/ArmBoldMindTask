//
//  UIColor+Additions.swift
//  ArmBoldMindProject
//
//  Created by Armen Sahakyan on 3/7/20.
//  Copyright © 2020 ArmBoldMind Team. All rights reserved.
//

import Foundation
import UIKit
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
extension UIView {
    func setupBackground(radius:CGFloat = 700) {
  //      var endPoint = CGPoint(x: self.frame.width/2, y: self.frame.height/2)

        let gradient = RadialGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor(netHex: 0x09A95F).cgColor, UIColor(netHex:0x006038).cgColor]
        self.layer.insertSublayer(gradient, at: 0)
    }
}
class RadialGradientLayer: CALayer {

   override init(){

        super.init()

        needsDisplayOnBoundsChange = true
    }

     init(center:CGPoint,radius:CGFloat,colors:[CGColor]){

        self.center = center
        self.radius = radius
        self.colors = colors

        super.init()

    }

    required init(coder aDecoder: NSCoder) {

        super.init()

    }

    var center:CGPoint = CGPoint(x:190,y: 300)
    var radius:CGFloat = 700
    var colors:[CGColor] = [UIColor(red: 251/255, green: 237/255, blue: 33/255, alpha: 1.0).cgColor , UIColor(red: 251/255, green: 179/255, blue: 108/255, alpha: 1.0).cgColor]

    override func draw(in ctx: (CGContext?)) {

        ctx!.saveGState()

        let colorSpace = CGColorSpaceCreateDeviceRGB()

     //   let locations:[CGFloat] = [0.0, 1.0]

        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: [0.0,1.0])!

      //  let startPoint = CGPoint(x: 0, y: self.bounds.height)
     //   let endPoint = CGPoint(x: self.bounds.width, y: self.bounds.height)

        ctx!.drawRadialGradient(gradient, startCenter: center, startRadius: 0.0, endCenter: center, endRadius: radius, options: [])

    }

}

