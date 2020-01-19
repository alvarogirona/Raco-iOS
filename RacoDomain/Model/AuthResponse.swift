//
//  AuthResponse.swift
//  RacoDomain
//
//  Created by alvaro on 12/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation

public struct AuthResponse: Codable {
    public let accessToken: String
    public let expiresIn: Int
    public let refreshToken: String
    public let tokenType: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case expiresIn = "expires_in"
        case refreshToken = "refresh_token"
        case tokenType = "token_type"
    }
}
