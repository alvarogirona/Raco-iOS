//
//  RemoteDataSource.swift
//  Platform
//
//  Created by alvaro on 12/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RxSwift

public protocol RemoteDataSource: class {
    associatedtype RemoteItem

    func loadData() -> Single<RemoteItem>
}
