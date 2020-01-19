//
//  NetworkModule.swift
//  Platform
//
//  Created by alvaro on 19/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import Alamofire

class NetworkModule {
    func makeAuthedSessionManager(accessToken: String) -> SessionManager {
        let sessionManager = SessionManager()
        sessionManager.adapter = makeRequestAdapter(accessToken: accessToken)
        return sessionManager
    }

    private func makeRequestAdapter(accessToken: String) -> RequestAdapter {
        return AuthRequestAdapter(accessToken: accessToken)
    }
}

protocol AccessTokenProvider {
    var accessToken: String { get }
}
