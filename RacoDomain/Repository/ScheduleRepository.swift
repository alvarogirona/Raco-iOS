//
//  ScheduleRepository.swift
//  RacoDomain
//
//  Created by alvaro on 22/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RxSwift

public protocol ScheduleRepository {
    func loadInitialData()
    func getAll() -> Observable<[RemoteSchedule]>
}
