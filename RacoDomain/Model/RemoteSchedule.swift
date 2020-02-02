//
//  RemoteSchedule.swift
//  RacoDomain
//
//  Created by alvaro on 22/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation

public struct RemoteSchedule: Codable {
    public let subjectCode: String
    public let group: String
    public let weekDay: Int
    public let startHour: String
    public let duration: Int
    public let type: String
    public let classroom: String

    public init(
        subjectCode: String,
        group: String,
        weekDay: Int,
        startHour: String,
        duration: Int,
        type: String,
        classroom: String
    ) {
        self.subjectCode = subjectCode
        self.group = group
        self.weekDay = weekDay
        self.startHour = startHour
        self.duration = duration
        self.type = type
        self.classroom = classroom
    }

    enum CodingKeys: String, CodingKey {
        case subjectCode = "codi_assig"
        case group = "grup"
        case weekDay = "dia_setmana"
        case startHour = "inici"
        case duration = "durada"
        case type = "tipus"
        case classroom = "aules"
    }
}
