//
//  SignedInDependencyContainer.swift
//  Raco
//
//  Created by alvaro on 12/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Platform
import RacoDomain
import UIKit

class SignedInDependencyContainer: SignedInDependenciesProvider {

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
        let scheduleNavigationController = makeScheduleNavigationController(scheduleViewController: makeScheduleViewController())
        let subjectsNavigationController = makeSubjectsNavigationController(
            subjectsViewController: makeSubjectsViewController()
        )
        let userProfileNavigationController = makeUserProfileNavigationController(userProfileViewController: makeUserProfileViewController())

        signedInViewController.viewControllers = [
            subjectsAlertsNavigationController,
            scheduleNavigationController,
            subjectsNavigationController,
            userProfileNavigationController
        ]

        return signedInViewController
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

    // MARK: Schedule

    func makeScheduleNavigationController(scheduleViewController: ScheduleViewController<GetAllSubjectsUseCase, GetAllSchedulesUseCase>) -> NiblessNavigationController {
        let navigationController = NiblessNavigationController()

        navigationController.tabBarItem = UITabBarItem(title: "Horario", image: UIImage(named: "calendar"), tag: 1)
        navigationController.viewControllers = [scheduleViewController]

        return navigationController
    }

    private func makeScheduleViewController() -> ScheduleViewController<GetAllSubjectsUseCase, GetAllSchedulesUseCase> {
        return ScheduleViewController(viewModel: makeScheduleViewModel())
    }

    private func makeScheduleViewModel() -> ScheduleViewModel<GetAllSubjectsUseCase, GetAllSchedulesUseCase> {
        return ScheduleViewModel(
            getAllSubjectsUseCase: platformDependencyContainer.makeGetAllSubjectsUseCase(),
            getAllSchedulesUseCase: platformDependencyContainer.makeGetAllSchedulesUseCase(),
            mapper: ScheduleMapper()
        )
    }

    // MARK: Subjects

    func makeSubjectsNavigationController(
        subjectsViewController: SubjectsViewController
    ) -> NiblessNavigationController {

        let navigationController = NiblessNavigationController()
        navigationController.tabBarItem = UITabBarItem(title: "Asignaturas", image: UIImage(named: "list.dash"), tag: 2)
        navigationController.viewControllers = [subjectsViewController]

        return navigationController
    }


    private func makeSubjectsViewController() -> SubjectsViewController {
        let subjectsViewModel = makeSubjectsViewModel()
        let subjectsVC = SubjectsViewController(
            rootView: makeSubjectsRootView(subjectsViewModel: subjectsViewModel),
            viewModel: subjectsViewModel)

        return subjectsVC
    }

    private func makeSubjectsRootView(subjectsViewModel: SubjectsViewModel) -> SubjectsRootView {
        return SubjectsRootView(viewModel: subjectsViewModel)
    }

    // MARK: User profile
    private func makeUserProfileNavigationController(userProfileViewController: UserProfileViewController) -> NiblessNavigationController {
        let navigationController = NiblessNavigationController()

        navigationController.tabBarItem = UITabBarItem(title: "Usuario", image: UIImage(named: "person.fill"), tag: 3)
        navigationController.viewControllers = [userProfileViewController]

        return navigationController
    }

    private func makeUserProfileViewController() -> UserProfileViewController {
        return UserProfileViewController()
    }


    // MARK: - ViewModels
    func makeSubjectsViewModel() -> SubjectsViewModel {
        return SubjectsViewModel(subjectsRepository: platformDependencyContainer.subjectsRepository)
    }

    func makeSubjectAlertsViewModel() -> SubjectAlertsViewModel<GetAllSubjectsUseCase, GetAllSubjectAlertsUseCase> {
        return SubjectAlertsViewModel(
            getAllSubjectsUseCase: platformDependencyContainer.makeGetAllSubjectsUseCase(),
            getAllSubjectAlertsUseCase: platformDependencyContainer.makeGetAllSubjectsAlertsUseCase(),
            subjectAlertsMapper: SubjectsAlertsMapper()
        )
    }
}
