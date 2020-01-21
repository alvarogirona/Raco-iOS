//
//  SubjectAlerts.swift
//  Raco
//
//  Created by alvaro on 21/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation

struct SubjectAlerts {
    let subjectame: String
    let alerts: [SubjectAlert]
}

struct SubjectAlert {
    let id: Int
    let title: String
    let subjectCode: String
    let text: String
    let insertionDate: String
    let updatedDate: String
}
