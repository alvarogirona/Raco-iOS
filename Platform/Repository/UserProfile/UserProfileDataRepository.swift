//
//  UserProfileDataRepository.swift
//  Platform
//
//  Created by alvaro on 22/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RxSwift
import RacoDomain

class UserProfileDataRepository: UserProfileRepository {
    func loadInitialData() {

    }

    func getUserProfile() -> Observable<RemoteUserProfile> {
        return Observable.create { observable in

            return Disposables.create()
        }
    }

    
}
