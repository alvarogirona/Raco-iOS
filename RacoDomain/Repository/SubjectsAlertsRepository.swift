//
//  SubjectsAlertsRepository.swift
//  RacoDomain
//
//  Created by alvaro on 19/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RxSwift

public protocol SubjectAlertsRepository {

    func loadInitialData()
    func getAll() -> Observable<[RemoteSubjectAlert]>
}
