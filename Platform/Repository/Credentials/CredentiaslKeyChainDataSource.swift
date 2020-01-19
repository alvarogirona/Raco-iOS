//
//  CredentiaslKeyChainDataSource.swift
//  Platform
//
//  Created by alvaro on 12/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation

public class CredentialsKeyChainDataSource: KeyChainDataSource {
    public typealias StoredType = String

    public func getBy(key: String) -> String {
        return ""
    }
}
