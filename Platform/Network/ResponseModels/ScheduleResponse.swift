//
//  ScheduleResponse.swift
//  Platform
//
//  Created by alvaro on 22/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RacoDomain

struct ScheduleResponse: Codable {
    let count: Int
    let results: [RemoteSchedule]
}
