//
//  SubjectAlertsResponse.swift
//  Platform
//
//  Created by alvaro on 21/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RacoDomain

struct SubjectAlertsResponse: Codable {
    let count: Int
    let results: [RemoteSubjectAlert]
}
