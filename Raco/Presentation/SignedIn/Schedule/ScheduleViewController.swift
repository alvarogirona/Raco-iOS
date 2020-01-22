//
//  ScheduleViewController.swift
//  Raco
//
//  Created by alvaro on 19/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import UIKit
import RacoDomain
import RxSwift

class ScheduleViewController<T: UseCase, R: UseCase>: NiblessViewController
where T.Resource == [RemoteSubject], R.Resource == [RemoteSchedule] {

    private let viewModel: ScheduleViewModel<T, R>

    private let scheduleDayView: ScheduleDayView

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Horario"
    }

    init (viewModel: ScheduleViewModel<T, R>) {
        self.viewModel = viewModel
        let scheduleDayView = ScheduleDayView()
        self.scheduleDayView = scheduleDayView

        super.init()

        scheduleDayView.frame = view.frame
        view.addSubview(scheduleDayView)

        bindViewModel()
    }

    private func bindViewModel() {
        viewModel.schedulesSubject
            .subscribeOn(MainScheduler.asyncInstance)
            .subscribe(onNext: { [unowned self] (classes) in
                self.scheduleDayView.render(schedule: classes)
            }).disposed(by: disposeBag)
    }
}
