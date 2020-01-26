//
//  ScheduleMapper.swift
//  Raco
//
//  Created by alvaro on 22/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RacoDomain

class ScheduleMapper {
    func map(schedule: [RemoteSchedule], subjects: [RemoteSubject]) -> [Int: [SubjectClass]] {

        let mappedSchedules = schedule
            .map { remoteSchedule -> SubjectClass? in

                guard let subject = subjects.enumerated().first (where: { $0.element.acronym == remoteSchedule.subjectCode }) else {
                    return nil
                }

                return SubjectClass(subject: ScheduleSubject(name: subject.element.name, id: subject.offset),
                                    classType: remoteSchedule.type,
                                    startHour: remoteSchedule.startHour,
                                    duration: remoteSchedule.duration,
                                    weekDay: remoteSchedule.weekDay)
        }
        .compactMap({ $0 })

        let days: [Int: [SubjectClass]] = [:]

        return mappedSchedules.reduce(into: days) { (result, subjectClass) in
            guard let day = result[subjectClass.weekDay] else {
                result[subjectClass.weekDay] = [subjectClass]
                return
            }

            result[subjectClass.weekDay] = day + [subjectClass]
        }
    }
}
