//
//  NiblessTabController.swift
//  RacoUIKit
//
//  Created by alvaro on 13/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import UIKit

open class NiblessTabBarController: UITabBarController {
    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable,
    message: "Loading this view controller from a nib is unsupported in favor of initializer dependency injection."
    )
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    @available(*, unavailable,
    message: "Loading this view controller from a nib is unsupported in favor of initializer dependency injection."
    )
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Loading this view controller from a nib is unsupported in favor of initializer dependency injection.")
    }

}
