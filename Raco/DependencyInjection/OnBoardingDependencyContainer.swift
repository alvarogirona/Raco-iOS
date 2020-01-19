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

class OnBoardingDependencyContainer: SignedInViewControllerFactory {
    let authorizationCodeSubject: PublishSubject<String> = PublishSubject()

    private let platformDependencyContainer = PlatformDependencyContainer()

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
        let signedInViewController = SignedInViewController(dependencyContainer: SignedInDependencyContainer())

        /// TODO: Move to `signedInViewController`

        let subjectsAlertsNavigationController = makeSubjectsAlertsNavigationController()
        let subjectsVC = SubjectsViewController()
        let userProfileVC = UserProfileViewController()

        signedInViewController.viewControllers = [subjectsAlertsNavigationController, subjectsVC, userProfileVC]

        return signedInViewController
    }

    private func makeSubjectsAlertsNavigationController() -> NiblessNavigationController {
        let subjectsAlertsNavigationController = NiblessNavigationController()
        subjectsAlertsNavigationController.tabBarItem = UITabBarItem(title: "Avisos", image: nil, tag: 0)
        let subjectAlertsViewModel = SubjectAlertsViewModel()
        let subjectsAlertsVC = SubjectsAlertsViewController(
            viewModel: subjectAlertsViewModel,
            rootView: SubjectAlertsView(viewModel: subjectAlertsViewModel)
        )
        subjectsAlertsNavigationController.viewControllers = [subjectsAlertsVC]

        return subjectsAlertsNavigationController
    }

    func makeSubjectAlertsViewModel() {

    }
}
