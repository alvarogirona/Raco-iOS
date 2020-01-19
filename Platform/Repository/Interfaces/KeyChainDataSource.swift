//
//  KeyChainDataSource.swift
//  Platform
//
//  Created by alvaro on 12/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation

public protocol KeyChainDataSource {
    associatedtype StoredType

    func getBy(key: String) -> StoredType
}
