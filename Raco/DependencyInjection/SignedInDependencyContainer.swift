//
//  SignedInDependencyContainer.swift
//  Raco
//
//  Created by alvaro on 12/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Platform

class SignedInDependencyContainer {

    let platformDependencyContainer = PlatformDependencyContainer()
}

extension SignedInDependencyContainer: AlertsDependencyContainer {
    func makeAlertsViewModel() -> SubjectAlertsViewModel {
        return SubjectAlertsViewModel()
    }
}
