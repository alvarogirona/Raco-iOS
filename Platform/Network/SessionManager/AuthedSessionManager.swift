//
//  AuthedSessionManager.swift
//  Platform
//
//  Created by alvaro on 12/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import Alamofire

class AuthedSessionManager {
    let sessionManager: SessionManager

    init (adapter: RequestAdapter) {
        self.sessionManager = SessionManager()
        self.sessionManager.adapter = adapter
    }
}
