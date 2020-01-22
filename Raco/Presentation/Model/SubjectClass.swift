//
//  DaySchedule.swift
//  Raco
//
//  Created by alvaro on 22/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation

struct SubjectClass {
    let subject: ScheduleSubject
    let classType: String
    let startHour: String
    let duration: Int
    let weekDay: Int

    var endHour: String {
        let hour = Int(startHour.split(separator: ":")[0])!
        let minutes = startHour.split(separator: ":")[1]

        return "\(hour + duration):\(minutes)"
    }
}

struct ScheduleSubject {
    let name: String
}
