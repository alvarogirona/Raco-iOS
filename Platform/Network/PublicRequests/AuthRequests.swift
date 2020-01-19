//
//  AuthRequest.swift
//  Platform
//
//  Created by alvaro on 12/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RacoDomain
import RxSwift
import Alamofire

enum BadResponseError: Error {
    case badResponse
}

public class AuthRequests {
    private let authParameters: AuthParameters

    init (authParameters: AuthParameters) {
        self.authParameters = authParameters
    }

    func authWith(code: String) -> Single<AuthResponse> {
        return Single.create { single in
            Alamofire.request(
                AuthUrls.tokenUrl(),
                method: .post,
                parameters: self.buildParameters(authorizationCode: code),
                encoding: URLEncoding.queryString, headers: nil)
                .responseString { (response) in
                    switch (response.result) {
                    case .success(let dataString):
                        guard let authResponse = try? JSONDecoder().decode(AuthResponse.self,
                                                                           from: dataString.data(using: .utf8)!)
                            else {
                                single(.error(BadResponseError.badResponse))
                                return
                        }
                        single(.success(authResponse))
                    case .failure(let error):
                        print(error)
                    }
            }

            return Disposables.create()
        }
    }

    private func buildParameters(authorizationCode: String) -> [String: String] {
        return [
            "grant_type" : "authorization_code",
            "code": authorizationCode,
            "client_id": authParameters.clientId,
            "client_secret": authParameters.clientSecret
        ]
    }
}
