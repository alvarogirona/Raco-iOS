//
//  SubjectsRepository.swift
//  RacoDomain
//
//  Created by alvaro on 19/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RxSwift

public protocol SubjectsRepository {
    func loadInitialData() -> Completable
    func getAll() -> Observable<[RemoteSubject]>
}
