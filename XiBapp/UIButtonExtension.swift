//
//  UIButtonExtension.swift
//  XiBapp
//
//  Created by Admin on 23.12.2020.
//

import Foundation
import UIKit

extension UIButton {

    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-4.0, 4.0, -4.0, 4.0, -2.0, 2.0, -1.0, 1.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }

}
