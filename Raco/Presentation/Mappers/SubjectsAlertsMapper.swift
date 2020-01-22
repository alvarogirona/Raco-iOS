//
//  SubjectsAlertsMapper.swift
//  Raco
//
//  Created by alvaro on 21/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RacoDomain

class SubjectsAlertsMapper {

    func map(subjects: [RemoteSubject], alerts: [RemoteSubjectAlert]) -> [SubjectAlerts] {

        let groupedAlerts = groupAlertsBySubjectId(alerts)

        return subjects.map { (remoteSubject) -> SubjectAlerts in
            let subjectAlerts = groupedAlerts[remoteSubject.acronym ?? ""] ?? []

            return SubjectAlerts(
                subjectame: remoteSubject.name,
                alerts: Array<SubjectAlert>(subjectAlerts.prefix(5)))
        }
    }

    private func groupAlertsBySubjectId(_ alerts: [RemoteSubjectAlert]) -> [String: [SubjectAlert]] {
        return alerts.reduce([:]) { (result, remoteSubjectAlert) -> [String: [SubjectAlert]] in
            let subjectAlert = SubjectAlert(id: remoteSubjectAlert.id,
                                                  title: remoteSubjectAlert.title,
                                                  subjectCode: remoteSubjectAlert.subjectCode,
                                                  text: remoteSubjectAlert.text,
                                                  insertionDate: remoteSubjectAlert.insertionDate,
                                                  updatedDate: remoteSubjectAlert.updatedDate)
            var newResult = result

            guard let prevArray = result[remoteSubjectAlert.subjectCode] else {
                var newResult = result
                newResult[subjectAlert.subjectCode] = [subjectAlert]
                return newResult
            }

            newResult[subjectAlert.subjectCode] = prevArray + [subjectAlert]

            return newResult
        }
    }
}
