//
//  SubjectsViewController.swift
//  Raco
//
//  Created by alvaro on 13/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SubjectsViewController: NiblessViewController {

    private let rootView: SubjectsRootView
    private let viewModel: SubjectsViewModel

    private let disposeBag = DisposeBag()

    init(
        rootView: SubjectsRootView,
        viewModel: SubjectsViewModel
    ) {
        self.rootView = rootView
        self.viewModel = viewModel

        super.init()

        self.rootView.frame = view.frame
        view.addSubview(self.rootView)

        self.navigationItem.title = "Asignaturas"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        bindViewModel()
    }

    private func configureTableView() {
        rootView.tableView.register(SubjectTableViewCell.self, forCellReuseIdentifier: "cell")
    }

    private func bindViewModel() {
        viewModel.subjectsObservable
            .observeOn(MainScheduler.instance)
            .asDriver(onErrorJustReturn: [])
            .drive(rootView.tableView.rx.items(cellIdentifier: "cell", cellType: SubjectTableViewCell.self)) { _, subject, cell in
                cell.renderSubject(subject: subject)
        }
        .disposed(by: disposeBag)
    }
}
