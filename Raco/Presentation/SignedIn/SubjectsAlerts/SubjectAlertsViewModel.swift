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

class SubjectAlertsViewModel<T: UseCase> where T.Resource == [RemoteSubject] {

    private let disposeBag = DisposeBag()

    private let getAllSubjectsUseCase: T

    init (getAllSubjectsUseCase: T) {
        self.getAllSubjectsUseCase = getAllSubjectsUseCase
    }

    private func subscribeToAlerts() {

    }

    private func subscribeToSubjects() {
        getAllSubjectsUseCase
        .execute()
        .subscribe(onNext: { subjects in

        })
    }

}
