//
//  ScheduleViewModel.swift
//  Raco
//
//  Created by alvaro on 19/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import UIKit
import RacoDomain
import RxSwift

class ScheduleViewModel<T: UseCase, R: UseCase>
where T.Resource == [RemoteSubject], R.Resource == [RemoteSchedule] {

    // View state
    let schedulesSubject: BehaviorSubject<[Int: [SubjectClass]]> = BehaviorSubject(value: [:])

    // Dependencies
    private let getAllSubjectsUseCase: T
    private let getAllSchedulesUseCase: R
    private let mapper: ScheduleMapper

    // Private data
    private var remoteSchedules: [RemoteSchedule] = []
    private var remoteSubjects: [RemoteSubject] = []

    private let disposeBag = DisposeBag()

    init (
        getAllSubjectsUseCase: T,
        getAllSchedulesUseCase: R,
        mapper: ScheduleMapper
    ) {
        self.getAllSubjectsUseCase = getAllSubjectsUseCase
        self.getAllSchedulesUseCase = getAllSchedulesUseCase
        self.mapper = mapper

        subscribeToSubjects()
        subscribeToSchedules()
    }

    private func subscribeToSubjects() {
        getAllSubjectsUseCase
            .execute()
            .subscribe(onNext: { [unowned self] subjects in
                self.remoteSubjects = subjects
                self.mapSchedules()
            }).disposed(by: disposeBag)
    }

    private func subscribeToSchedules() {
        getAllSchedulesUseCase
            .execute()
            .subscribe(onNext: { [unowned self] schedules in
                self.remoteSchedules = schedules
                self.mapSchedules()
            }).disposed(by: disposeBag)
    }

    private func mapSchedules() {
        let mappedSchedules = mapper.map(schedule: remoteSchedules, subjects: remoteSubjects)

        schedulesSubject.onNext(mappedSchedules)
    }

}
