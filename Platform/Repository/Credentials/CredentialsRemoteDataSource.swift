//
//  CredentialsRemoteDataSource.swift
//  Platform
//
//  Created by alvaro on 12/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RxSwift
import RacoDomain
import RxRelay

public class CredentialsRemoteDataSource {

    public typealias RemoteItem = String

    private let authRequests: AuthRequests

    init(authRequests: AuthRequests) {
        self.authRequests = authRequests
    }

    public func getAccessToken(accessCode: String) -> Single<AuthResponse> {
        return authRequests.authWith(code: accessCode)
    }
}
