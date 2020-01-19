//
//  LogInViewModel.swift
//  Raco
//
//  Created by alvaro on 12/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RxSwift
import RacoDomain

class LogInViewModel {

    let presentLogInWebView: PublishSubject<Bool> = PublishSubject()
    let loggedInSubject: PublishSubject<Bool> = PublishSubject()

    private let authorizationCodeObservable: Observable<String>
    private let credentialsRepository: CredentialsRepository
    private let disposeBag = DisposeBag()

    init (
        authorizationCodeObservable: Observable<String>,
        credentialsRepository: CredentialsRepository
    ) {
        self.authorizationCodeObservable = authorizationCodeObservable
        self.credentialsRepository = credentialsRepository

        subscribeToAccessCode()
    }

    @objc
    func loginSelected() {
        presentLogInWebView.onNext(true)
    }

    func subscribeToAccessCode() {
        authorizationCodeObservable
        .subscribe({ [unowned self] code in
            guard let code = code.element else {
                return
            }
            self.credentialsRepository.requestToken(accessCode: code)
                .asObservable()
                .subscribe({ [unowned self] _ in
                    self.loggedInSubject.onNext(true)
                }).disposed(by: self.disposeBag)

        }).disposed(by: disposeBag)
    }
}
