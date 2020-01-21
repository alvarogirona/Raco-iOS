//
//  UseCase.swift
//  RacoDomain
//
//  Created by alvaro on 21/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RxSwift

public protocol UseCase {
    associatedtype Resource

    func execute() -> Observable<Resource>
}
