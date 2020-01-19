//
//  AuthTokens.swift
//  Platform
//
//  Created by alvaro on 12/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation

public protocol AuthParameters {
    var clientId: String { get }
    var clientSecret: String { get }
    var redirectUrl: String { get }
}
