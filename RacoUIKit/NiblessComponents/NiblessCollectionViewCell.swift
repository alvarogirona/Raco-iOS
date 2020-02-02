//
//  NiblessCollectionViewCell.swift
//  RacoUIKit
//
//  Created by alvaro on 27/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import UIKit

open class NiblessCollectionViewCell: UICollectionViewCell {

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("Loading this view controller from a nib is unsupported in favor of initializer dependency injection.")
    }

    @available(*, unavailable,
      message: "Loading this view from a nib is unsupported in favor of initializer dependency injection."
    )
    override open func awakeFromNib() {
        super.awakeFromNib()
    }
}
