//
//  SubjectsResponse.swift
//  Platform
//
//  Created by alvaro on 19/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RacoDomain

struct SubjectsResponse: Codable {
    let count: Int
    let results: [Subject]
}
