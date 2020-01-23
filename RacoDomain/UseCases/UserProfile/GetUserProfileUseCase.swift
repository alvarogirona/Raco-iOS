//
//  GetUserProfileUseCase.swift
//  RacoDomain
//
//  Created by alvaro on 22/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RxSwift

class GetUserProfileUseCase: UseCase {

    typealias Resource = RemoteUserProfile

    private let userProfileRepository: UserProfileRepository

    init (userProfileRepository: UserProfileRepository) {
        self.userProfileRepository = userProfileRepository
    }

    func execute() -> Observable<RemoteUserProfile> {
        return Observable.create { observable in

            return Disposables.create()
        }
    }
}
