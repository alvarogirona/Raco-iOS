//
//  SubjectsViewModel.swift
//  Raco
//
//  Created by alvaro on 19/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RxSwift
import RacoDomain

class SubjectsViewModel {

    // MARK: Outputs
    var subjectsObservable: Observable<[RemoteSubject]> {
        get {
            return subjectsSubject.asObservable()
        }
    }

    // MARK: State
    private let subjectsSubject: BehaviorSubject<[RemoteSubject]> = BehaviorSubject(value: [])

    // MARK: Dependencies
    private let subjectsRepository: SubjectsRepository


    private let disposeBag = DisposeBag()

    // TODO: Should use use cases intead of direct access to the repository
    init (subjectsRepository: SubjectsRepository) {
        self.subjectsRepository = subjectsRepository

        self.loadInitialData()
        self.subscribeToData()
    }

    private func loadInitialData() {
        self.subjectsRepository
            .loadInitialData()
            .subscribe()
            .disposed(by: disposeBag)
    }

    private func subscribeToData() {

        self.subjectsRepository
            .getAll()
            .subscribe (onNext: { [unowned self] in
                self.subjectsSubject.onNext($0)
            })
            .disposed(by: disposeBag)
    }
}
