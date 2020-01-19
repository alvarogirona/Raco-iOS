//
//  Endpoints.swift
//  Platform
//
//  Created by alvaro on 19/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation

class Endpoints {
    static let baseUrl = "https://api.fib.upc.edu"

    class var subjectAlerts: String {
        return baseUrl + "/v2/jo/avisos/?format=json"
    }

    class var subjects: String {
        return baseUrl + "/v2/jo/assignatures/?format=json"
    }
}
