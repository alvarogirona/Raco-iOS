//
//  PlatformMockDependencyContainer.swift
//  Platform
//
//  Created by alvaro on 01/02/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RacoDomain

public class PlatformMockDependencyContainer: PlatformDependencies {
    public init() {}

    public var credentialsRepository: CredentialsRepository = CredentialsMockRepository()

    public var subjectsRepository: SubjectsRepository = SubjectsMockRepository()

    public func makeGetAllSubjectsUseCase() -> GetAllSubjectsUseCase {
        return GetAllSubjectsUseCase(subjectsRepository: subjectsRepository)
    }

    public var subjectAlertsRepository: SubjectAlertsRepository = SubjectAlertsMockRepository()

    public func makeGetAllSubjectsAlertsUseCase() -> GetAllSubjectAlertsUseCase {
        return GetAllSubjectAlertsUseCase(subjectAlertsRepository: subjectAlertsRepository)
    }

    public var scheduleRepository: ScheduleRepository = ScheduleMockRepository()

    public func makeGetAllSchedulesUseCase() -> GetAllSchedulesUseCase {
        GetAllSchedulesUseCase(scheduleRepository: scheduleRepository)
    }
}
