//
//  AlertsViewModel.swift
//  Raco
//
//  Created by alvaro on 13/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RxSwift
import RacoDomain

class SubjectAlertsViewModel<T: UseCase, R: UseCase>
where T.Resource == [RemoteSubject], R.Resource == [RemoteSubjectAlert] {

    // Public subjects
    let subjectAlertsSubject: BehaviorSubject<[SubjectAlerts]> = BehaviorSubject(value: [])

    // Dependencies
    private let getAllSubjectsUseCase: T
    private let getAllSubjectAlertsUseCase: R
    private let mapper: SubjectsAlertsMapper

    // Private data
    private var remoteSubjects: [RemoteSubject]?
    private var remoteSubjectAlerts: [RemoteSubjectAlert]?

    // Private attributes
    private let disposeBag = DisposeBag()

    init (
        getAllSubjectsUseCase: T,
        getAllSubjectAlertsUseCase: R,
        subjectAlertsMapper: SubjectsAlertsMapper
    ) {
        self.getAllSubjectsUseCase = getAllSubjectsUseCase
        self.getAllSubjectAlertsUseCase = getAllSubjectAlertsUseCase
        self.mapper = subjectAlertsMapper

        subscribeToAlerts()
        subscribeToSubjects()
    }

    private func subscribeToAlerts() {
        getAllSubjectAlertsUseCase
            .execute()
            .subscribe(onNext: { [weak self] alerts in
                guard let strongSelf = self else {
                    return
                }

                strongSelf.remoteSubjectAlerts = alerts
                strongSelf.mapRemoteData()
            }).disposed(by: disposeBag)
    }

    private func subscribeToSubjects() {
        getAllSubjectsUseCase
            .execute()
            .subscribe(onNext: { [weak self] subjects in
                guard let strongSelf = self else {
                    return
                }

                strongSelf.remoteSubjects = subjects
                strongSelf.mapRemoteData()
            }).disposed(by: disposeBag)
    }

    private func mapRemoteData() {
        guard let remoteSubjects = remoteSubjects,
            let remoteAlerts = remoteSubjectAlerts else {
                return
        }

        let mappedSubjectAlerts = mapper.map(subjects: remoteSubjects, alerts: remoteAlerts)
        subjectAlertsSubject.onNext(mappedSubjectAlerts)
    }

}
