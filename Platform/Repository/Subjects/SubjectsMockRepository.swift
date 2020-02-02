//
//  SubjectsMockRepository.swift
//  Platform
//
//  Created by alvaro on 01/02/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RacoDomain
import RxSwift

class SubjectsMockRepository: SubjectsRepository {
    func loadInitialData() -> Completable {
        return Completable.create { completable in
            completable(.completed)

            return Disposables.create()
        }
    }

    func getAll() -> Observable<[RemoteSubject]> {
        return Observable.just([
            RemoteSubject(
                id: "MD",
                name: "Mineria de dades",
                url: nil,
                guide: nil,
                group: "10",
                acronym: "MD",
                upcCode: 1234,
                semester: "1",
                credits: 6.0
            )
        ])
    }


}
