//
//  SubjectsAlertsViewController.swift
//  Raco
//
//  Created by alvaro on 13/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import UIKit

class SubjectsAlertsViewController: NiblessViewController {

    private let viewModel: SubjectAlertsViewModel
    private let alertsView: SubjectAlertsView

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Avisos"
    }

    init (viewModel: SubjectAlertsViewModel,
          rootView: SubjectAlertsView) {
        self.viewModel = viewModel
        self.alertsView = rootView

        super.init()

        alertsView.frame = view.frame
        view.addSubview(alertsView)
    }
}

protocol AlertsDependencyContainer {
    func makeAlertsViewModel() -> SubjectAlertsViewModel
}
