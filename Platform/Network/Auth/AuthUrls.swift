//
//  AuthService.swift
//  Platform
//
//  Created by alvaro on 12/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation

public class AuthUrls {
    public class func authorizationUrl(authParameters: AuthParameters) -> URL? {
        return URL(string: "https://api.fib.upc.edu/v2/o/authorize/?client_id=\(authParameters.clientId)&redirect_uri=\(authParameters.redirectUrl)&response_type=code&state=random_state_string")
    }

    public class func tokenUrl() -> String {
        return "https://api.fib.upc.edu/v2/o/token"
    }
}
