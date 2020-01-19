//
//  CredentialsRepository.swift
//  RacoDomain
//
//  Created by alvaro on 12/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RxSwift

public protocol CredentialsRepository {
    var accessToken: String? { get }
    var accessTokenSubject: BehaviorSubject<String?> { get set }

    func requestToken(accessCode: String) -> Completable
}
