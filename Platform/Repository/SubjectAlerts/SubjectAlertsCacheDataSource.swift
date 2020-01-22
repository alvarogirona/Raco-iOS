//
//  SubjectAlertsCacheDataSource.swift
//  Platform
//
//  Created by alvaro on 21/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import RacoDomain
import RxSwift

class SubjectAlertsCacheDataSource: CacheDataSource {
    typealias RemoteItem = RemoteSubjectAlert

    var cacheSubject: BehaviorSubject<[RemoteSubjectAlert]> = BehaviorSubject(value: [])

    var cache: [RemoteSubjectAlert] = []
}
