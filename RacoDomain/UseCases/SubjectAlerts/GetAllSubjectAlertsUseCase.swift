//
//  GetAllSubjectAlertsUseCase.swift
//  RacoDomain
//
//  Created by alvaro on 21/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RxSwift

public class GetAllSubjectAlertsUseCase: UseCase {
    public typealias Resource = [RemoteSubjectAlert]

    private let subjectAlertsRepository: SubjectAlertsRepository

    public init (subjectAlertsRepository: SubjectAlertsRepository) {
        self.subjectAlertsRepository = subjectAlertsRepository
    }

    public func execute() -> Observable<[RemoteSubjectAlert]> {
        subjectAlertsRepository
            .getAll()
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
    }
}
