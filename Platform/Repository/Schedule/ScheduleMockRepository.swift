//
//  ScheduleMockRepository.swift
//  Platform
//
//  Created by alvaro on 01/02/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RacoDomain
import RxSwift

class ScheduleMockRepository: ScheduleRepository {
    func loadInitialData() {

    }

    func getAll() -> Observable<[RemoteSchedule]> {
        return Observable.just([
            RemoteSchedule(
                subjectCode: "MD",
                group: "10",
                weekDay: 1,
                startHour: "10:00",
                duration: 2,
                type: "T",
                classroom: "A6001"
            )
        ])
    }


}
