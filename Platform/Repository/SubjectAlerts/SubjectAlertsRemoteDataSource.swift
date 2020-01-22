//
//  SubjectAlertsRemoteDataSource.swift
//  Platform
//
//  Created by alvaro on 21/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Alamofire
import RacoDomain
import RxSwift

class SubjectAlertsRemoteDataSource: RemoteDataSource {

    typealias RemoteItem = [RemoteSubjectAlert]

    private let sessionManager: SessionManager

    init (sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }

    func loadData() -> Single<[RemoteSubjectAlert]> {
        return Single.create { [unowned self] single in

            self.sessionManager.request(Endpoints.subjectAlerts)
                .responseData { (response) in

                    switch (response.result) {
                    case .success(let data):
                        guard let parsedResponse = try? JSONDecoder().decode(SubjectAlertsResponse.self, from: data) else {
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
