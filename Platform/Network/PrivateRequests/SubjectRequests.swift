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

            self.sessionManager.request(Endpoints.subjects)
                .responseData { (response) in
                    switch (response.result) {
                    case .success(let data):
                        guard let parsedResponse = try? JSONDecoder().decode(SubjectsResponse.self, from: data) else {
                            single(.error(NetworkError.parsingError))
                            return
                        }

                        single(.success(parsedResponse.results))
                    case .failure(let error):
                        single(.error(error))
                    }
            }

            return Disposables.create()
        }
    }
}
