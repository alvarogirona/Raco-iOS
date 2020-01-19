//
//  CacheDataSource.swift
//  Platform
//
//  Created by alvaro on 19/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RxSwift

protocol CacheDataSource: class {
    associatedtype RemoteItem

    var cacheSubject: BehaviorSubject<[RemoteItem]> { get }
    var cache: [RemoteItem] { get set }

    func addToCache(items: [RemoteItem])
    func clearCache()
}

extension CacheDataSource {
    func addToCache(items: [RemoteItem]) {
        cache = cache + items
        cacheSubject.onNext(cache)
    }

    func clearCache() {
        cache = []
        cacheSubject.onNext(cache)
    }
}
