//
//  PlatformDependencies.swift
//  Platform
//
//  Created by alvaro on 01/02/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RacoDomain

public protocol PlatformDependencies {
    // MARK: Credentials

    var credentialsRepository: CredentialsRepository { get }

    // MARK: Subjects

    var subjectsRepository: SubjectsRepository { get }

    func makeGetAllSubjectsUseCase() -> GetAllSubjectsUseCase

    // MARK: Subject alerts

    var subjectAlertsRepository: SubjectAlertsRepository { get }

    func makeGetAllSubjectsAlertsUseCase() -> GetAllSubjectAlertsUseCase

    // MARK: Schedule

    var scheduleRepository: ScheduleRepository { get }

    func makeGetAllSchedulesUseCase() -> GetAllSchedulesUseCase

}
