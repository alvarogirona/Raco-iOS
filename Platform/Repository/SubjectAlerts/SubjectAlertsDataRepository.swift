//
//  SubjectAlertsDataRepository.swift
//  Platform
//
//  Created by alvaro on 21/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import RacoDomain
import RxSwift

class SubjectAlertsDataRepository<R: RemoteDataSource, C: CacheDataSource>: SubjectAlertsRepository
where R.RemoteItem == [RemoteSubjectAlert], C.RemoteItem == RemoteSubjectAlert
{

    private let remoteDataSource: R
    private let cacheDataSource: C

    private let disposeBag = DisposeBag()

    init(
        remoteDataSource: R,
        cacheDataSource: C
    ) {
        self.remoteDataSource = remoteDataSource
        self.cacheDataSource = cacheDataSource
        loadInitialData()
    }

    public func loadInitialData() {
        remoteDataSource.loadData()
            .subscribe(onSuccess: { [weak self] (subjectAlerts) in
                guard let strongSelf = self else {
                    return
                }

                strongSelf.cacheDataSource.addToCache(items: subjectAlerts)
                }, onError: { error in

            }).disposed(by: disposeBag)
    }

    public func getAll() -> Observable<[RemoteSubjectAlert]> {
        return cacheDataSource.cacheSubject
            .asObservable()
    }


}
