//
//  ScheduleDataRepository.swift
//  Platform
//
//  Created by alvaro on 22/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RacoDomain
import RxSwift

class ScheduleDataRepository<R: RemoteDataSource, C: CacheDataSource>: ScheduleRepository
where R.RemoteItem == [RemoteSchedule], C.RemoteItem == RemoteSchedule {
    
    private let remoteDataSource: R
    private let cacheDataSource: C
    
    private let disposeBag = DisposeBag()
    
    init (remoteDataSource: R,
          cacheDataSource: C) {
        self.remoteDataSource = remoteDataSource
        self.cacheDataSource = cacheDataSource
        
        loadInitialData()
    }
    
    func loadInitialData() {
        remoteDataSource
            .loadData()
            .subscribe(onSuccess: { [unowned self] schedules in
                self.cacheDataSource.addToCache(items: schedules)
            }).disposed(by: disposeBag)
    }
    
    func getAll() -> Observable<[RemoteSchedule]> {
        return cacheDataSource.cacheSubject.asObservable()
    }
    
    
}
