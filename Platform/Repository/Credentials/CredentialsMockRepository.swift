//
//  CredentialsMockRepository.swift
//  Platform
//
//  Created by alvaro on 02/02/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RacoDomain
import RxSwift

class CredentialsMockRepository: CredentialsRepository {
    var accessToken: String? = ""

    var accessTokenSubject: BehaviorSubject<String?> = BehaviorSubject.init(value: "")

    func requestToken(accessCode: String) -> Completable {
        return Completable.create { completable in

            completable(.completed)

            return Disposables.create()
        }
    }



}
