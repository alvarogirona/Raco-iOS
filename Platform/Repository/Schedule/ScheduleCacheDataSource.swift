//
//  RemoteCacheDataSource.swift
//  Platform
//
//  Created by alvaro on 22/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RxSwift
import RacoDomain

class ScheduleCacheDataSource: CacheDataSource {

    typealias RemoteItem = RemoteSchedule

    var cacheSubject: BehaviorSubject<[RemoteSchedule]> = BehaviorSubject(value: [])

    var cache: [RemoteSchedule] = []
}
