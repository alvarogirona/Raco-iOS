//
//  StackView+removeAllArrangedSubviews.swift
//  RacoUIKit
//
//  Created by alvaro on 22/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import UIKit

public extension UIStackView {

    /**
     Removes all the arranged subviews of an `UIStackView` and deactivates its constraints.
     */
    func removeAllArrangedSubviews() {

        let removedSubviews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
            self.removeArrangedSubview(subview)
            return allSubviews + [subview]
        }

        NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))

        removedSubviews.forEach({ $0.removeFromSuperview() })
    }
}
