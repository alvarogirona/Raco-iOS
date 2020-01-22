//
//  GetAllSchedulesUseCase.swift
//  RacoDomain
//
//  Created by alvaro on 22/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RxSwift

public class GetAllSchedulesUseCase: UseCase {

    public typealias Resource = [RemoteSchedule]

    private let scheduleRepository: ScheduleRepository

    public init (scheduleRepository: ScheduleRepository) {
        self.scheduleRepository = scheduleRepository
    }

    public func execute() -> Observable<[RemoteSchedule]> {
        return scheduleRepository
            .getAll()
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
    }
}
