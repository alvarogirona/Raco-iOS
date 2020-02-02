//
//  SubjectAlertsMockRepository.swift
//  Platform
//
//  Created by alvaro on 01/02/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RacoDomain
import RxSwift

class SubjectAlertsMockRepository: SubjectAlertsRepository {
    func loadInitialData() {

    }

    func getAll() -> Observable<[RemoteSubjectAlert]> {
        return Observable.just([
            
        ])
    }


}
