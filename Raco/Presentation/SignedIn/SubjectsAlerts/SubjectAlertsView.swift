//
//  AlertsView.swift
//  Raco
//
//  Created by alvaro on 13/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import UIKit

class SubjectAlertsView: NiblessView {

    var hierarchyNotReady = true

    private let viewModel: SubjectAlertsViewModel

    // MARK: Views
    var subjectAlertsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: UITableView.Style.grouped)

        return tableView
    }()

    // MARK: init
    init (
        frame: CGRect = .zero,
        viewModel: SubjectAlertsViewModel
    ) {
        self.viewModel = viewModel
        super.init(frame: frame)
    }

    override func didMoveToWindow() {
        guard hierarchyNotReady else {
            return
        }

        hierarchyNotReady = false

        backgroundColor = UIColor.systemGroupedBackground
    }


    // MARK: Hierarchy

    private func makeHierarchy() {
        addSubview(subjectAlertsTableView)
    }

    // MARK: Constraints

    private func activateConstraints() {
        activateConstraintsSubjectAlertsTableView()
    }

    private func activateConstraintsSubjectAlertsTableView() {

    }

}
