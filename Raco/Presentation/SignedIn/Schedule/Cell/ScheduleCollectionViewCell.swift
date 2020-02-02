//
//  ScheduleCollectionViewCell.swift
//  Raco
//
//  Created by alvaro on 27/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import UIKit
import RacoUIKit

class ScheduleCollectionViewCell: NiblessCollectionViewCell {

    var scheduleView: ScheduleDayView

    override init(frame: CGRect) {
        scheduleView = ScheduleDayView()
        super.init(frame: frame)

        addSubview(scheduleView)

        scheduleView.translatesAutoresizingMaskIntoConstraints = false

        let leading = scheduleView.leadingAnchor
            .constraint(equalTo: leadingAnchor)
        let trailing = scheduleView.trailingAnchor
            .constraint(equalTo: trailingAnchor)
        let top = scheduleView.topAnchor
            .constraint(equalTo: topAnchor)
        let bottom = scheduleView.bottomAnchor
            .constraint(equalTo: bottomAnchor)

        NSLayoutConstraint.activate([leading, trailing, top, bottom])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
