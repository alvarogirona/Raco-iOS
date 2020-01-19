//
//  CacheDataSourceTests.swift
//  PlatformTests
//
//  Created by alvaro on 19/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import XCTest
@testable import Platform
@testable import RacoDomain

class CacheDataSourceTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testCacheDataSource() {

        let cacheDataSource = SubjectsCacheDataSource()
        XCTAssert(cacheDataSource.cache.count == 0)

        let dummySubjects = buildDummySubjects()
        cacheDataSource.addToCache(items: dummySubjects)
        XCTAssert(dummySubjects.count == cacheDataSource.cache.count)

        cacheDataSource.clearCache()
        XCTAssert(cacheDataSource.cache.count == 0)
    }

    func buildDummySubjects() -> [Subject] {
        return [
            Subject(id: "1",
                    url: "https://raco.fib.upc.edu",
                    guide: "https://raco.fib.upc.edu",
                    group: "1",
                    acronym: "1",
                    upcCode: 1,
                    semester: "1",
                    credits: 6.0,
                    name: "First")
        ]
    }

}
