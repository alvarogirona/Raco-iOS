//
//  UIView+GradientBackground.swift
//  RacoUIKit
//
//  Created by alvaro on 12/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import UIKit

public extension UIView {
    func setGradientBackground() {
        let colorTop = UIColor.flatPink().cgColor
        let colorBottom = UIColor.flatPinkDark().cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = bounds

        layer.insertSublayer(gradientLayer, at:0)
    }
}
