//
//  UserProfileMockRepository.swift
//  Platform
//
//  Created by alvaro on 01/02/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RacoDomain
import RxSwift

class UserProfileMockRepository: UserProfileRepository {
    func loadInitialData() {

    }

    func getUserProfile() -> Observable<RemoteUserProfile> {
        return Observable.just(
            RemoteUserProfile(name: "Álvaro")
        )
    }


}
