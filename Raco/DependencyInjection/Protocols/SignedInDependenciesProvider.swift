//
//  SignedInDependenciesProvider.swift
//  Raco
//
//  Created by alvaro on 22/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RacoDomain

protocol SignedInDependenciesProvider {

    // MARK: - ViewControllers
    func makeSignedInViewController() -> SignedInViewController
    func makeScheduleNavigationController(scheduleViewController: ScheduleViewController<GetAllSubjectsUseCase, GetAllSchedulesUseCase>) -> NiblessNavigationController
    func makeSubjectsNavigationController(subjectsViewController: SubjectsViewController) -> NiblessNavigationController

    // MARK: - ViewModels
    func makeSubjectsViewModel() -> SubjectsViewModel
    func makeSubjectAlertsViewModel() -> SubjectAlertsViewModel<GetAllSubjectsUseCase, GetAllSubjectAlertsUseCase>
}
