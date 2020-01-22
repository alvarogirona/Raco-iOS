//
//  ScheduleRemoteDataSource.swift
//  Platform
//
//  Created by alvaro on 22/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RacoDomain

class ScheduleRemoteDataSource: RemoteDataSource {
    typealias RemoteItem = [RemoteSchedule]

    private let sessionManager: SessionManager

    init (sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }

    func loadData() -> Single<[RemoteSchedule]> {
        return Single.create { [unowned self] single in

            self.sessionManager.request(Endpoints.schedule)
                .responseData { (response) in
                    switch (response.result) {
                    case .success(let data):
                        guard let parsedResponse = try? JSONDecoder().decode(ScheduleResponse.self, from: data) else {
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
