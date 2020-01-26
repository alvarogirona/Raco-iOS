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

class SubjectsAlertsViewController<T: UseCase, R: UseCase>: NiblessViewController, UITableViewDelegate, UITableViewDataSource
where T.Resource == [RemoteSubject], R.Resource == [RemoteSubjectAlert] {

    // MARK: - Dependencies
    private let viewModel: SubjectAlertsViewModel<T, R>
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
    init (viewModel: SubjectAlertsViewModel<T, R>,
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

        viewModel.presentAlertSubject
            .subscribe(onNext: { [unowned self] (subjectAlert) in
                let detailViewController = SubjectAlertDetailViewController(subjectAlert: subjectAlert)
                self.navigationController?.pushViewController(detailViewController, animated: true)
            }).disposed(by: disposeBag)
    }

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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = subjects[indexPath.section].alerts[indexPath.row]
        viewModel.selected(alert: alert)
    }
}

protocol AlertsDependencyContainer {
    func makeAlertsViewModel() -> SubjectAlertsViewModel<GetAllSubjectsUseCase, GetAllSubjectAlertsUseCase>
}
