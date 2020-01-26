//
//  SubjectsRootView.swift
//  Raco
//
//  Created by alvaro on 13/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import UIKit

class SubjectsRootView: NiblessView {
    
    private var hierarchyNotReady = true
    
    var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        return tableView
    }()
    
    init (frame: CGRect = .zero,
          viewModel: SubjectsViewModel) {
        
        super.init(frame: frame)
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        
        guard hierarchyNotReady else {
            return
        }
        
        hierarchyNotReady = false

        backgroundColor = UIColor.systemGroupedBackground

        makeHierarchy()
        activateConstraints()
    }

    private func makeHierarchy() {
        addSubview(tableView)
    }

    private func activateConstraints() {
        activateTableViewContraints()
    }

    private func activateTableViewContraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false

        let leading = tableView.leadingAnchor
            .constraint(equalTo: leadingAnchor)
        let trailing = tableView.trailingAnchor
            .constraint(equalTo: trailingAnchor)
        let top = tableView.topAnchor
            .constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        let bottom = tableView.bottomAnchor
            .constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)

        NSLayoutConstraint.activate([leading, trailing, top, bottom])
    }


}
