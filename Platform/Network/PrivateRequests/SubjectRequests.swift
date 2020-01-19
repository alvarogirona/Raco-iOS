//
//  SubjectRequests.swift
//  Platform
//
//  Created by alvaro on 12/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RacoDomain

class SubjectRequests: SubjectService {

    private let sessionManager: SessionManager

    init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }

    func getAll() -> Single<[Subject]> {
        return Single.create { [unowned self] single in

            self.sessionManager.request("")

            return Disposables.create()
        }
    }
}
