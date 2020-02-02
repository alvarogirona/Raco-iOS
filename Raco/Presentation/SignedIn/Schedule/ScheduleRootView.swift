//
//  ScheduleRootView.swift
//  Raco
//
//  Created by alvaro on 26/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import UIKit

class ScheduleRootView: NiblessView {

    private var hierarchyNotReady = true

    let schedulesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return collectionView
    }()

    override func didMoveToWindow() {
        guard hierarchyNotReady else {
            return
        }

        hierarchyNotReady = false

        backgroundColor = .systemBackground

        makeHierarchy()
        activateConstraints()
    }

    private func makeHierarchy() {
        addSubview(schedulesCollectionView)
    }

    private func activateConstraints() {
        activateScheduleCollectionViewConstraints()
    }

    private func activateScheduleCollectionViewConstraints() {
        schedulesCollectionView.translatesAutoresizingMaskIntoConstraints = false

        let leading = schedulesCollectionView.leadingAnchor
            .constraint(equalTo: leadingAnchor)
        let trailing = schedulesCollectionView.trailingAnchor
            .constraint(equalTo: trailingAnchor)
        let top = schedulesCollectionView.topAnchor
            .constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        let bottom = schedulesCollectionView.bottomAnchor
            .constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)

        NSLayoutConstraint.activate([leading, trailing, top, bottom])
    }

}
