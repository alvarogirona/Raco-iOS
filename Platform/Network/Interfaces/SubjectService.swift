//
//  SubjectService.swift
//  Platform
//
//  Created by alvaro on 19/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RxSwift
import RacoDomain

protocol SubjectService {
    func getAll() -> Single<[RemoteSubject]>
}
