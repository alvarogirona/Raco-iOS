//
//  SubjectColor.swift
//  Raco
//
//  Created by alvaro on 26/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import UIKit

extension UIColor {
    static func colorFor(index: Int) -> UIColor {
        switch (index) {
        case 0: return .systemBlue
        case 1: return .systemGreen
        case 2: return .systemIndigo
        case 3: return .systemOrange
        case 4: return .systemPink
        case 5: return .systemPurple
        case 6: return .systemRed
        case 7: return .systemTeal
        case 8: return .systemYellow
        default: return .systemGray
        }
    }
}
