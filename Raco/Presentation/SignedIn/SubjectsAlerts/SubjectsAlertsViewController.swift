//
//  SubjectsAlertsViewController.swift
//  Raco
//
//  Created by alvaro on 13/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import UIKit
import RxSwift
import RacoDomain

class SubjectsAlertsViewController: NiblessViewController {

    // MARK: - Dependencies
    private let viewModel: SubjectAlertsViewModel<GetAllSubjectsUseCase, GetAllSubjectAlertsUseCase>
    private let alertsView: SubjectAlertsView

    // MARK: - Data
    private var subjects: [SubjectAlerts] = []

    // MARK: - Private attributes
    private let disposeBag = DisposeBag()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Avisos"
    }

    // MARK: initialization
    init (viewModel: SubjectAlertsViewModel<GetAllSubjectsUseCase, GetAllSubjectAlertsUseCase>,
          rootView: SubjectAlertsView) {
        self.viewModel = viewModel
        self.alertsView = rootView

        super.init()

        alertsView.frame = view.frame
        view.addSubview(alertsView)

        configureTableView()
        bindViewModel()
    }

    private func configureTableView() {
        alertsView.subjectAlertsTableView.register(SubjectAlertTableViewCell.self, forCellReuseIdentifier: "cell")
        alertsView.subjectAlertsTableView.delegate = self
        alertsView.subjectAlertsTableView.dataSource = self
    }

    // MARK: - Binding
    private func bindViewModel() {
        viewModel.subjectAlertsSubject
            .observeOn(MainScheduler.asyncInstance)
            .subscribe(onNext: { [unowned self] subjects in
                self.subjects = subjects
                self.alertsView.subjectAlertsTableView.reloadData()
            }).disposed(by: disposeBag)
    }
}

extension SubjectsAlertsViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return subjects.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return subjects[section].subjectame
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects[section].alerts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SubjectAlertTableViewCell

        cell.renderSubjectAlert(subjectAlert: subjects[indexPath.section].alerts[indexPath.row])

        return cell
    }


}

protocol AlertsDependencyContainer {
    func makeAlertsViewModel() -> SubjectAlertsViewModel<GetAllSubjectsUseCase, GetAllSubjectAlertsUseCase>
}
