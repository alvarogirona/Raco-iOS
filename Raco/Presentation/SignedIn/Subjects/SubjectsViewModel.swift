//
//  SubjectsViewModel.swift
//  Raco
//
//  Created by alvaro on 19/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RacoDomain

class SubjectsViewModel {

    private let subjectsRepository: SubjectsRepository

    init(
        subjectsRepository: SubjectsRepository
    ) {
        self.subjectsRepository = subjectsRepository
    }
}
