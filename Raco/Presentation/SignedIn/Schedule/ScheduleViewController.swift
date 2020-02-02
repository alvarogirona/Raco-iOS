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

class ScheduleViewController<T: UseCase, R: UseCase>: NiblessViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
where T.Resource == [RemoteSubject], R.Resource == [RemoteSchedule] {

    private let viewModel: ScheduleViewModel<T, R>

    private let scheduleRootView: ScheduleRootView
    private let scheduleDayView: ScheduleDayView
    private var classes: [Int: [SubjectClass]] = [:]

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Horario"
    }

    init (viewModel: ScheduleViewModel<T, R>) {
        self.viewModel = viewModel
        self.scheduleDayView = ScheduleDayView()
        self.scheduleRootView = ScheduleRootView()

        super.init()

        scheduleRootView.frame = view.frame
        view.addSubview(scheduleRootView)

        configureCollectionView()
        bindViewModel()
    }

    private func configureCollectionView() {
        scheduleRootView.schedulesCollectionView.register(ScheduleCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        scheduleRootView.schedulesCollectionView.delegate = self
        scheduleRootView.schedulesCollectionView.dataSource = self
    }

    private func bindViewModel() {
        viewModel.schedulesSubject
            .observeOn(MainScheduler.asyncInstance)
            .subscribe(onNext: { [unowned self] (classes) in
                self.classes = classes
                self.scheduleRootView.schedulesCollectionView.reloadData()
            }).disposed(by: disposeBag)
    }

    // MARK: - UICollectionView

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return classes.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cell",
            for: indexPath) as! ScheduleCollectionViewCell

        cell.scheduleView.render(schedule: classes[indexPath.item] ?? [])

        cell.setNeedsLayout()
        cell.layoutIfNeeded()

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(
            width: scheduleRootView.schedulesCollectionView.bounds.width,
            height: scheduleRootView.schedulesCollectionView.bounds.height
        )
    }
}
