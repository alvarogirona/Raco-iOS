//
//  SubjectsAlertsViewController.swift
//  Raco
//
//  Created by alvaro on 13/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import UIKit
import RacoDomain

class SubjectsAlertsViewController: NiblessViewController {

    private let viewModel: SubjectAlertsViewModel<GetAllSubjectsUseCase>
    private let alertsView: SubjectAlertsView

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Avisos"
    }

    init (viewModel: SubjectAlertsViewModel<GetAllSubjectsUseCase>,
          rootView: SubjectAlertsView) {
        self.viewModel = viewModel
        self.alertsView = rootView

        super.init()

        alertsView.frame = view.frame
        view.addSubview(alertsView)
    }
}

protocol AlertsDependencyContainer {
    func makeAlertsViewModel() -> SubjectAlertsViewModel<GetAllSubjectsUseCase>
}
