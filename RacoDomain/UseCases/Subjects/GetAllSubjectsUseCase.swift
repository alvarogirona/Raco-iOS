//
//  GetAllSubjectsUseCase.swift
//  RacoDomain
//
//  Created by alvaro on 21/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RxSwift

public class GetAllSubjectsUseCase: UseCase {
    public typealias Resource = [RemoteSubject]

    private let subjectsRepository: SubjectsRepository

    public init (subjectsRepository: SubjectsRepository) {
        self.subjectsRepository = subjectsRepository
    }

    public func execute() -> Observable<Resource> {
        return subjectsRepository
            .getAll()
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .asObservable()
    }
}
