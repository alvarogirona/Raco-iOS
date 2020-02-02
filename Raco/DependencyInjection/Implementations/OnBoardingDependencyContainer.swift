//
//  OnBoardingDependencyContainer.swift
//  Raco
//
//  Created by alvaro on 12/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import UIKit
import Platform
import RacoDomain
import RxSwift

class OnBoardingDependencyContainer: OnBoardingDependenciesProvider, SignedInViewControllerFactory {

    let authorizationCodeSubject: PublishSubject<String> = PublishSubject()

    #if DEBUG
    private let platformDependencyContainer = PlatformMockDependencyContainer()
    #else
    private let platformDependencyContainer = PlatformDependencyContainer()
    #endif

    private lazy var signedInDependencyContainer = SignedInDependencyContainer(
        platformDependencyContainer: self.platformDependencyContainer
    )

    func makeLogInViewModel() -> LogInViewModel {
        return LogInViewModel(
            authorizationCodeObservable: authorizationCodeSubject.asObservable(),
            credentialsRepository: platformDependencyContainer.credentialsRepository
        )
    }

    func credentialsRepository() -> CredentialsRepository {
        return platformDependencyContainer.credentialsRepository
    }

    func makeLogInViewController() -> LogInViewController {
        let viewModel = makeLogInViewModel()
        return LogInViewController(viewModel: viewModel,
                                   rootView: LogInView(viewModel: viewModel),
                                   signedInViewControllerFactory: self)
    }

    func makeSignedInViewController() -> SignedInViewController {
        signedInDependencyContainer.makeSignedInViewController()
    }
}
