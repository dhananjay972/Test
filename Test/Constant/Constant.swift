//
//  Constant.swift
//  Test
//
//  Created by Apple on 18/07/20.
//  Copyright © 2020 V group Inc. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    func cornerView()
    {
        self.layer.cornerRadius = 10
        self.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.layer.borderWidth = 2
    }
func dropShadow(scale: Bool = true) {
  layer.masksToBounds = false
  layer.shadowColor = UIColor.black.cgColor
  layer.shadowOpacity = 0.5
  layer.shadowOffset = CGSize(width: -1, height: 1)
  layer.shadowRadius = 1

  layer.shadowPath = UIBezierPath(rect: bounds).cgPath
  layer.shouldRasterize = true
  layer.rasterizationScale = scale ? UIScreen.main.scale : 1
}
    
    func roundCorners(cornerRadius: Double) {
           let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
           let maskLayer = CAShapeLayer()
           maskLayer.frame = self.bounds
           maskLayer.path = path.cgPath
           self.layer.mask = maskLayer
       }
    func animationView(isHidden:Bool)
    {
        UIView.transition(with: self, duration: 0.6, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
              self.isHidden = isHidden
          }, completion: nil)
    }
}
