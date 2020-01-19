//
//  SubjectsDataRepository.swift
//  Platform
//
//  Created by alvaro on 19/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RacoDomain
import RxSwift

class SubjectsDataRepository<R: RemoteDataSource, C: CacheDataSource>: SubjectsRepository
where R.RemoteItem == [Subject], C.RemoteItem == Subject {

    private let remoteDataSource: R
    private let cacheDataSource: C

    init(remoteDataSource: R,
         cacheDataSource: C) {
        self.remoteDataSource = remoteDataSource
        self.cacheDataSource = cacheDataSource
    }

    public func getAll() -> Observable<[Subject]> {
        return cacheDataSource.cacheSubject
    }

    public func loadInitialData() -> Completable {
        remoteDataSource.loadData()
            .flatMapCompletable { (subjects) -> Completable in
                return Completable.create { [unowned self] completable in

                    self.cacheDataSource.addToCache(items: subjects)
                    return Disposables.create()
                }
        }
    }
}
