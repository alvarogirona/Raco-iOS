//
//  SubjectsCacheDataSource.swift
//  Platform
//
//  Created by alvaro on 19/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RxSwift
import RacoDomain

class SubjectsCacheDataSource: CacheDataSource {

    typealias RemoteItem = RemoteSubject

    var cacheSubject: BehaviorSubject<[RemoteSubject]> = BehaviorSubject(value: [])

    var cache: [RemoteSubject] = []
}
