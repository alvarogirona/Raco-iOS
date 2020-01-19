//
//  CredentialsDataRepository.swift
//  Platform
//
//  Created by alvaro on 12/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RxSwift
import RacoDomain

final public class CredentialsDataRepository: CredentialsRepository {
    public var accessToken: String?
    public var accessTokenSubject: BehaviorSubject<String?> = BehaviorSubject<String?>(value: nil)

    private let remoteDataSource: CredentialsRemoteDataSource
    private let keyChainDataSource: CredentialsKeyChainDataSource

    public init(keyChainDataSource: CredentialsKeyChainDataSource,
                remoteDataSource: CredentialsRemoteDataSource) {

        self.keyChainDataSource = keyChainDataSource
        self.remoteDataSource = remoteDataSource

    }

    public func requestToken(accessCode: String) -> Completable {
        return remoteDataSource
            .getAccessToken(accessCode: accessCode)
            .flatMapCompletable { (response) -> Completable in
                self.accessToken = response.accessToken
                self.accessTokenSubject.onNext(response.accessToken)

                return Completable.create { completable in

                    completable(.completed)
                    return Disposables.create()
                }
        }
    }
}
