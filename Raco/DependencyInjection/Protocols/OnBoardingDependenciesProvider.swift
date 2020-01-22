//
//  OnBoardingDependencies.swift
//  Raco
//
//  Created by alvaro on 22/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RxSwift
import RacoDomain

protocol OnBoardingDependenciesProvider {
    var authorizationCodeSubject: PublishSubject<String> { get }

    func makeLogInViewModel() -> LogInViewModel
    func credentialsRepository() -> CredentialsRepository
    func makeLogInViewController() -> LogInViewController
    func makeSignedInViewController() -> SignedInViewController
}
