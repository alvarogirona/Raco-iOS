//
//  AuthRequestAdapter.swift
//  Platform
//
//  Created by alvaro on 12/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import Alamofire

/**
 Class which implements `RequestAdapter` protocol in order to add the access token to all the requests
 of a `SessionManager`.
 */
class AuthRequestAdapter: RequestAdapter {
    private let accessToken: String

    init (accessToken: String) {
        self.accessToken = accessToken
    }

    /**
     Adds access token to request.
     */
    public func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        urlRequest.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")

        return urlRequest
    }
}
