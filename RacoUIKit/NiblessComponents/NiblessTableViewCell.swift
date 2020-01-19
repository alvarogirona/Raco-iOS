//
//  NiblessTableViewCell.swift
//  RacoUIKit
//
//  Created by alvaro on 19/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import UIKit

open class NiblessTableViewCell: UITableViewCell {

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("Loading this view controller from a nib is unsupported in favor of initializer dependency injection.")
    }

    @available(*, unavailable,
      message: "Loading this view from a nib is unsupported in favor of initializer dependency injection."
    )
    override open func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
