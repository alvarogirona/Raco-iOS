//
//  SignedInDependencyContainer.swift
//  Raco
//
//  Created by alvaro on 12/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Platform
import UIKit

class SignedInDependencyContainer {

    let platformDependencyContainer: PlatformDependencyContainer


    init (platformDependencyContainer: PlatformDependencyContainer) {
        self.platformDependencyContainer = platformDependencyContainer
    }

    // MARK: - ViewControllers
    func makeSignedInViewController() -> SignedInViewController {
        let signedInViewController = SignedInViewController(
            dependencyContainer: SignedInDependencyContainer(platformDependencyContainer: platformDependencyContainer)
        )

        let subjectsAlertsNavigationController = makeSubjectsAlertsNavigationController()
        let subjectsNavigationController = makeSubjectsNavigationController(
            subjectsViewController: makeSubjectsViewController()
        )
        let userProfileNavigationController = makeUserProfileNavigationController(userProfileViewController: makeUserProfileViewController())


        signedInViewController.viewControllers = [
            subjectsAlertsNavigationController,
            subjectsNavigationController,
            userProfileNavigationController
        ]

        return signedInViewController
    }

    // MARK: User profile
    private func makeUserProfileNavigationController(userProfileViewController: UserProfileViewController) -> NiblessNavigationController {
        let navigationController = NiblessNavigationController()

        navigationController.tabBarItem = UITabBarItem(title: "Usuario", image: UIImage(named: "person.fill"), tag: 2)
        navigationController.viewControllers = [userProfileViewController]

        return navigationController
    }

    private func makeUserProfileViewController() -> UserProfileViewController {
        return UserProfileViewController()
    }


    // MARK: Subject alerts
    private func makeSubjectsAlertsNavigationController() -> NiblessNavigationController {
        let subjectsAlertsNavigationController = NiblessNavigationController()
        subjectsAlertsNavigationController.tabBarItem = UITabBarItem(title: "Avisos", image: UIImage(named: "star.fill"), tag: 0)
        let subjectAlertsViewModel = makeSubjectAlertsViewModel()
        let subjectsAlertsVC = SubjectsAlertsViewController(
            viewModel: subjectAlertsViewModel,
            rootView: SubjectAlertsView(viewModel: subjectAlertsViewModel)
        )
        subjectsAlertsNavigationController.viewControllers = [subjectsAlertsVC]

        return subjectsAlertsNavigationController
    }

    func makeSubjectsNavigationController(
        subjectsViewController: SubjectsViewController
    ) -> NiblessNavigationController {

        let navigationController = NiblessNavigationController()
        navigationController.tabBarItem = UITabBarItem(title: "Asignaturas", image: UIImage(named: "list.dash"), tag: 1)
        navigationController.viewControllers = [subjectsViewController]

        return navigationController
    }


    // MARK: Subjects
    func makeSubjectsViewController() -> SubjectsViewController {
        let subjectsViewModel = makeSubjectsViewModel()
        let subjectsVC = SubjectsViewController(
            rootView: makeSubjectsRootView(subjectsViewModel: subjectsViewModel),
            viewModel: subjectsViewModel)

        return subjectsVC
    }

    func makeSubjectsRootView(subjectsViewModel: SubjectsViewModel) -> SubjectsRootView {
        return SubjectsRootView(viewModel: subjectsViewModel)
    }

    // MARK: - ViewModels
    func makeSubjectsViewModel() -> SubjectsViewModel {
        return SubjectsViewModel(subjectsRepository: platformDependencyContainer.subjectsRepository)
    }

    func makeSubjectAlertsViewModel() -> SubjectAlertsViewModel {
        return SubjectAlertsViewModel()
    }
}
