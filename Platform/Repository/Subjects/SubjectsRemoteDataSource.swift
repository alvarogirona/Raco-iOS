//
//  SubjectsRemoteDataSource.swift
//  Platform
//
//  Created by alvaro on 19/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RxSwift
import RacoDomain
import Alamofire

class SubjectsRemoteDataSource: RemoteDataSource {

    typealias RemoteItem = [Subject]

    private let subjectRequests: SubjectRequests

    init (subjectRequests: SubjectRequests) {
        self.subjectRequests = subjectRequests
    }

    func loadData() -> Single<[Subject]> {
        return subjectRequests.getAll()
    }
}
